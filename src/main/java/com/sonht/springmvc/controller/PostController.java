package com.sonht.springmvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
import com.sonht.springmvc.entity.Category;
import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Recruitment;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.UserService;

@Controller
@RequestMapping("/recruitment")
public class PostController extends BaseController{

	public PostController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService,
			CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}

	@GetMapping("/list-post")
	public String listPosts(HttpServletRequest request, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int size, HttpSession session,
			@ModelAttribute("recruitment_of_company") Recruitment recruitmentGlobal) {
		request.removeAttribute("mgs_delete_success");
		if(recruitmentGlobal != null)
			listRecruitment(request, page, size, recruitmentGlobal.getCompany().getId());
		
		return "managePosts";
	}
	
	@GetMapping("/category/{id}")
	public String showRecruitmentByCategory(@PathVariable("id") int id, Model model) {
		List<Recruitment> recruitments = categoryService.findRecruitmentsByCategory(id);
		String nameJob = "";
		for(Recruitment recruitment: recruitments) {
			if(recruitment.getCategory().getId()==id) {
				nameJob = recruitment.getCategory().getName();
				break;
			}
		}
		model.addAttribute("nameJob", nameJob);
		model.addAttribute("recruitment_list", recruitments);
		return "list-recruitment";
	}
	
	@GetMapping("/detail/{id}")
	public String detailPost(@PathVariable("id") String id, Model model) {
		Recruitment recruitment = recruitmentService.getRecruitment(Integer.parseInt(id));
		List<Recruitment> recruitmentsCategory = recruitmentService.getRecruitmentsByCategory(recruitment.getCategory().getName());
		List<ApplyPost> applyPostsByRecruitmentId = applyPostService.getApplyPostsByRecruitmentId(Integer.parseInt(id));
		model.addAttribute("recruitment", recruitment);
		model.addAttribute("company", recruitment.getCompany());
		model.addAttribute("recruitment_list", recruitmentsCategory);
		model.addAttribute("applyPosts", applyPostsByRecruitmentId);
		model.addAttribute("recruitmentId", id);
		return "detailPost";
	}
	
	@GetMapping("/post/{action}")
	public String addPostGet(@PathVariable("action") String action, Model model,
			HttpServletRequest request)  throws NumberFormatException, ParseException {
		List<Category> categories = categoryService.getAlls();
		model.addAttribute("categories", categories);
		model.addAttribute("types", new String[] { "fulltime", "parttime", "freelancer" });
		if(action.equals("add")) {
			model.addAttribute("recruitmentDTO", new RecruitmentDTO());
			model.addAttribute("action", "add");
		}
		if(action.equals("update")) {
			int idd = Integer.parseInt(request.getParameter("id"));
			Recruitment re = recruitmentService.getRecruitment(idd);
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
			RecruitmentDTO reDTO = new RecruitmentDTO(idd, Integer.parseInt(request.getParameter("userId")), re.getAddress(),
					re.getDescription(), re.getExperience(), re.getQuantity(), re.getSalary(), re.getTitle(),
					re.getType(), re.getCategory().getName(), sim.parse(re.getDeadline()));
			
			model.addAttribute("recruitmentDTO", reDTO);
			model.addAttribute("action", "update");
		}
		return "post";
	}

	@PostMapping("/post")
	public String addPost(@Valid @ModelAttribute("recruitmentDTO") RecruitmentDTO reDTO, BindingResult bindingResult,
			Model model, @RequestParam("id") String id, HttpServletRequest request) {
		String actionParam = request.getParameter("action");
		List<Category> categories = categoryService.getAlls();
		if (bindingResult.hasErrors()) {
			model.addAttribute("recruitmentDTO", reDTO);
			model.addAttribute("categories", categories);
			model.addAttribute("types", new String[] { "fulltime", "parttime", "freelancer" });
			model.addAttribute("msg_error", "Đăng bài thất bại");
			model.addAttribute("action", actionParam.equals("add") ? "add" : "update");
			return "post";
		}
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ISO_LOCAL_DATE;
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
		Company company = companyService.getCompanyByUserId(reDTO.getUserId());
		Category category = categoryService.findByName(reDTO.getCategory());
		Recruitment re = new Recruitment(reDTO.getAddress(), currentDate.format(dateTimeFormatter),
				reDTO.getDescription(), reDTO.getExperience(), reDTO.getQuantity(), reDTO.getSalary(), "active",
				reDTO.getTitle(), reDTO.getType(), category, company, sim.format(reDTO.getDeadline()));
		re.setId(Integer.parseInt(id));
		
		recruitmentService.saveRecruitment(re);
		System.out.println(re);
		model.addAttribute("msg_success", actionParam.equals("add") ? "Đăng bài thành công" : "Cập nhật thành công");
		return "post";
	}
	
	@PostMapping("/delete")
	public String deleteRecruitment(@RequestParam("id") String id, HttpServletRequest request, HttpSession session,
			@ModelAttribute("recruitment_of_company") Recruitment recruitmentGlobal) {
		recruitmentService.deleteRecruitment(id);
		request.setAttribute("mgs_delete_success", "Bài đăng đã xoá thành công!");
		if(recruitmentGlobal != null)
			listRecruitment(request, 1, 5, recruitmentGlobal.getCompany().getId());
		return "managePosts";
	}
}
