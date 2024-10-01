package com.sonht.springmvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonht.springmvc.dto.RecruitmentDTO;
import com.sonht.springmvc.entity.ApplyPost;
import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Recruitment;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.RecruitmentService;

@Controller
@RequestMapping("/recruitment")
public class ManagePostController {

	@Autowired
	RecruitmentService recruitmentService;

	@Autowired
	CompanyService companyService;
	
	@Autowired
	ApplyPostService applyPostService;

	@GetMapping("/list-post")
	public String listPosts(HttpServletRequest request, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int size) {
		request.removeAttribute("mgs_delete_success");
		listRecruitment(request, page, size);
		
		return "managePosts";
	}
	
	
	@GetMapping("/post")
	public String addPostGet(@RequestParam("action") String action, Model model,
			HttpServletRequest request) throws NumberFormatException, ParseException {
		model.addAttribute("categories", new String[] { "Java", "NodeJS", ".NET", "React" });
		model.addAttribute("types", new String[] { "fulltime", "parttime", "freelancer" });
		
		if (action != null && action.equals("add")) {
			model.addAttribute("recruitmentDTO", new RecruitmentDTO());
		} else {
			
			int idd = Integer.parseInt(request.getParameter("id"));
			Recruitment re = recruitmentService.getRecruitment(idd);
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
			RecruitmentDTO reDTO = new RecruitmentDTO(idd, Integer.parseInt(request.getParameter("userId")), re.getAddress(),
					re.getDescription(), re.getExperience(), re.getQuantity(), re.getSalary(), re.getTitle(),
					re.getType(), re.getCategory(), sim.parse(re.getDeadline()));
			
			model.addAttribute("recruitmentDTO", reDTO);
		}
		return "post";
	}
	@GetMapping("/detail/{id}")
	public String detailPost(@PathVariable("id") String id, Model model) {
		loadDetail(id, model);
		return "detailPost";
	}
	
	@GetMapping("/approve/{id}")
	public String approve(@PathVariable("id") String id, Model model) {
		applyPostService.approveCV(id);
		loadDetail(id, model);
		return "detailPost";
	}

	@PostMapping("/add")
	public String addPost(@Valid @ModelAttribute("recruitmentDTO") RecruitmentDTO reDTO, BindingResult bindingResult,
			Model model, @RequestParam("id") String id) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("recruitmentDTO", reDTO);
			model.addAttribute("categories", new String[] { "Java", "NodeJS", ".NET", "React" });
			model.addAttribute("types", new String[] { "fulltime", "parttime", "freelancer" });
			model.addAttribute("msg_error", "Đăng bài thất bại");
			return "post";
		}
//		System.out.println(reDTO);
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ISO_LOCAL_DATE;
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
		Company company = companyService.getCompanyByUserId(reDTO.getUserId());
		Recruitment re = new Recruitment(reDTO.getAddress(), currentDate.format(dateTimeFormatter),
				reDTO.getDescription(), reDTO.getExperience(), reDTO.getQuantity(), reDTO.getSalary(), "active",
				reDTO.getTitle(), reDTO.getType(), reDTO.getCategory(), company, sim.format(reDTO.getDeadline()));
		re.setId(Integer.parseInt(id));
		
		recruitmentService.saveRecruitment(re);
		System.out.println(re);
		model.addAttribute("msg_success", "Đăng bài thành công");
		return "post";
	}
	
	private void loadDetail(String id, Model model) {
		Recruitment recruitment = recruitmentService.getRecruitment(Integer.parseInt(id));
		List<Recruitment> recruitmentsCategory = recruitmentService.getRecruitmentsByCategory(recruitment.getCategory());
		List<ApplyPost> applyPostsByRecruitmentId = applyPostService.getApplyPostsByRecruitmentId(Integer.parseInt(id));
		model.addAttribute("recruitment", recruitment);
		model.addAttribute("company", recruitment.getCompany());
		model.addAttribute("recruitment_list", recruitmentsCategory);
		model.addAttribute("applyPosts", applyPostsByRecruitmentId);
		
	}
	
	private void listRecruitment(HttpServletRequest request, int page, int size) {
		List<Recruitment> recruitments = recruitmentService.findPaginated(page, size);
		int totalPages = recruitmentService.getTotalPages(size);
		long totalItems = recruitmentService.count();

		request.setAttribute("recruitment_list", recruitments);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("totalItems", totalItems);
		request.setAttribute("pageSize", size);
	}
	
	@PostMapping("/delete")
	public String deleteRecruitment(@RequestParam("id") String id, HttpServletRequest request) {
		recruitmentService.deleteRecruitment(id);
		request.setAttribute("mgs_delete_success", "Bài đăng đã xoá thành công!");
		listRecruitment(request, 1, 5);
		return "managePosts";
	}
}
