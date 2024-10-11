package com.sonht.springmvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sonht.springmvc.dto.CompanyDTO;
import com.sonht.springmvc.dto.RecruiterDTO;
import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Cv;
import com.sonht.springmvc.entity.User;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.EmailService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.UserService;

@Controller
@RequestMapping("/user")
public class ProfileController extends BaseController {
	@Autowired
	EmailService emailService;

	public ProfileController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService,
			CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}

	@ModelAttribute("userDTO")
	public RecruiterDTO recruiterDTO() {
		return new RecruiterDTO();
	}

	@ModelAttribute("companyDTO")
	public CompanyDTO companyDTO() {
		return new CompanyDTO();
	}

	@GetMapping("/profile/{id}")
	public String profile(@PathVariable String id, Model model) {
		pushDataProfile(id, model);
		return "profile";
	}

	public void pushDataProfile(String id, Model model) {
		if (id != null) {
			User user = userService.getUser(Integer.parseInt(id));
			model.addAttribute("userDTO", user);
			Company company = companyService.getCompanyByUserId(Integer.parseInt(id));
			model.addAttribute("companyDTO", company);
		}
	}

	@PostMapping("/confirm-account")
	public String confirm(@RequestParam("idUser") String userId, @RequestParam("email") String email,
			HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes) {
		// Lấy user theo id
		User user = (User) session.getAttribute("userLogin");
		// Lấy đường dẫn 
		String contextPath = request.getRequestURL().toString().replace(request.getServletPath(), "");
		
		String confirmationUrl = contextPath + "/user/confirm?id=" + user.getId();
		// Gửi email đường link xác thực
		emailService.sendSimpleMessage(user.getEmail(), "Xác nhận đăng ký",
				"Nhấn vào đường dẫn để xác nhận tài khoản của bạn: " + confirmationUrl);
		redirectAttributes.addFlashAttribute("confirm_await", "success");
		return "redirect:/user/profile/" + userId;
	}

	@GetMapping("/confirm")
	public String comfirmSucces(@RequestParam("id") String id, RedirectAttributes redirectAttributes, HttpSession session) {
		// Lấy user theo id
		User user = userService.getUser(Integer.parseInt(id));
		user.setIsVerified(1);
		userService.saveUser(user);
		redirectAttributes.addFlashAttribute("confirm_success", "success");
		
		return "redirect:/auth?action=login";
	}
	
	@PostMapping("/update-profile")
	public String processFormRecruiter(@Valid @ModelAttribute("userDTO") RecruiterDTO user, BindingResult rs,
			Model model, RedirectAttributes redirectAttributes) {
		if (rs.hasErrors()) {
			// trả về lỗi trên form và điều hướng về trang profile
			model.addAttribute("msg_update_user_error", "error");
			model.addAttribute("userDTO", user);
			Company company = companyService.getCompanyByUserId(user.getId());
			model.addAttribute("companyDTO", company);
			return "profile";
		}
		User userFromDB = userService.getUser(user.getId());
		userFromDB.setAddress(user.getAddress());
		userFromDB.setDescription(user.getDescription());
		userFromDB.setEmail(user.getEmail());
		userFromDB.setFullName(user.getFullName());
		userFromDB.setPhoneNumber(user.getPhoneNumber());
		userService.saveUser(userFromDB);

		redirectAttributes.addFlashAttribute("msg_update_user_success", "success");
		return "redirect:/user/profile/" + user.getId();
	}

	@PostMapping("/upload")
	public String uploadImageUser(@RequestParam("file") MultipartFile file, HttpSession session,
			@RequestParam("recruiterId") String recruiterId, Model model) {
		User user = userService.getUser(Integer.parseInt(recruiterId));
		if (file.isEmpty()) {
			model.addAttribute("recruiterDTO", user);
			return "redirect:/user/profile/" + recruiterId;
		}
		uploadFile(session, file, recruiterId, user, null);

		return "redirect:/user/profile/" + recruiterId;
	}

	@PostMapping("/uploadCV")
	public String uploadCVUser(@RequestParam("file") MultipartFile file, HttpSession session,
			@RequestParam("userIdUpload") String userId, @RequestParam("idCv") String idCv, Model model, RedirectAttributes redirectAttributes) {
		User user = (User) session.getAttribute("userLogin");
		if (file.isEmpty()) {
			pushDataProfile(userId, model);
			model.addAttribute("message_upload_cv", "error");
			return "profile";
		}
		Cv cv = null;
		if(idCv.isEmpty()) {
			cv = new Cv(file.getOriginalFilename());
		} else {
			cv = cvService.getCv(idCv);
		}
		cv.setFileName(file.getOriginalFilename());
		user.setCv(cv);
		userService.saveUser(user);
		redirectAttributes.addFlashAttribute("message_upload_cv", "success");
		return "redirect:/user/profile/" + user.getId();
	}

	@PostMapping("/deleteCv")
	@ResponseBody
	public Map<String, String> deleteCV(@RequestParam("idCv") String idCv, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		user.setCv(null);
		userService.saveUser(user);
		Map<String, String> map = new HashMap<String, String>();

		map.put("msg_delete_success", "Xoá CV cá nhân thành công!");
		return map;
	}

	@PostMapping("/update-company")
	public String processFormCompany(@Valid @ModelAttribute("companyDTO") CompanyDTO companyDTO, BindingResult rs,
			Model model, RedirectAttributes redirectAttributes, HttpSession session) {
		User userSession = (User) session.getAttribute("userLogin");
		if (rs.hasErrors()) {
			// trả về lỗi trên form và điều hướng về trang profile
			model.addAttribute("msg_update_company_error", "error");
			model.addAttribute("userDTO", userSession);
			model.addAttribute("companyDTO", companyDTO);
			return "profile";
		}
		Company company = companyService.getCompanyByUserId(userSession.getId());
		company.setEmail(companyDTO.getEmail());
		company.setNameCompany(companyDTO.getNameCompany());
		company.setAddress(companyDTO.getAddress());
		company.setPhoneNumber(companyDTO.getPhoneNumber());
		company.setDescription(companyDTO.getDescription());

		companyService.saveCompany(company);
		redirectAttributes.addFlashAttribute("msg_update_company_success", "success");
		return "redirect:/user/profile/" + userSession.getId();
	}

	@PostMapping("/uploadImgCompany")
	public String uploadImageCompany(@RequestParam("file") MultipartFile file, HttpSession session,
			@RequestParam("recruiterId") String recruiterId, Model model) {
		Company company = companyService.getCompany(Integer.parseInt(recruiterId));
		if (file.isEmpty()) {
			model.addAttribute("companyDTO", company);
			return "redirect:/user/profile/" + recruiterId;
		}

		uploadFile(session, file, recruiterId, null, company);

		return "redirect:/user/profile/" + recruiterId;
	}
}
