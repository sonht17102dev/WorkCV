package com.sonht.springmvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;

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
import org.springframework.web.multipart.MultipartFile;

import com.sonht.springmvc.dto.CompanyDTO;
import com.sonht.springmvc.dto.RecruiterDTO;
import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.User;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.UserService;

@Controller
@RequestMapping("/user")
public class ProfileController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CompanyService companyService;

	@ModelAttribute("recruiterDTO")
	public RecruiterDTO recruiterDTO() {
		return new RecruiterDTO();
	}

	@ModelAttribute("companyDTO")
	public CompanyDTO companyDTO() {
		return new CompanyDTO();
	}

	@GetMapping("/profile/{id}")
	public String profile(@PathVariable String id, Model model) {
		if (id != null) {
			User recruiter = userService.getUser(Integer.parseInt(id));
			model.addAttribute("recruiterDTO", recruiter);
			Company company = companyService.getCompany(Integer.parseInt(id));
			model.addAttribute("companyInformation", company);
		}
		return "profile";
	}

	@PostMapping("/update-profile")
	public String processFormRecruiter(@Valid @ModelAttribute("recruiterDTO") RecruiterDTO recruiter, BindingResult rs,
			Model model, @RequestParam("id") int id, HttpServletRequest request) throws UnsupportedEncodingException {
		if (rs.hasErrors()) {
			// trả về lỗi trên form và điều hướng về trang profile
			model.addAttribute("recruiterDTO", recruiter);
			model.addAttribute("msg_update_recruiter_error", "error");
		}
		request.setCharacterEncoding("UTF-8");
		User user = userService.getUser(id);
		user.setAddress(recruiter.getAddress());
		user.setDescription(recruiter.getDescription());
		user.setEmail(recruiter.getEmail());
		user.setFullName(recruiter.getFullName());
		user.setPhoneNumber(recruiter.getPhoneNumber());
		userService.saveUser(user);

		model.addAttribute("msg_update_recruiter_success", "success");
		return "profile";
	}

	@PostMapping("/upload")
	public String uploadImageUser(@RequestParam("file") MultipartFile file, HttpSession session,
			@RequestParam("recruiterId") String recruiterId, Model model) {
		User user = userService.getUser(Integer.parseInt(recruiterId));
		if (file.isEmpty()) {
			model.addAttribute("recruiterDTO", user);
			return "redirect:/user/profile/" + recruiterId;
		}
		uploadImgUserOrCompany(session, file, recruiterId, user, null);
		
		return "redirect:/user/profile/" + recruiterId;
	}
	
	
	@PostMapping("/update-company")
	public String processFormCompany(@Valid @ModelAttribute("companyDTO") CompanyDTO companyDTO, BindingResult rs,
			Model model)  {
		if (rs.hasErrors()) {
			// trả về lỗi trên form và điều hướng về trang profile
			model.addAttribute("companyInformation", companyDTO);
			model.addAttribute("msg_update_company_error", "error");
		}
		Company company = companyService.getCompany(companyDTO.getUserId());
		company.setEmail(companyDTO.getEmail());
		company.setNameCompany(companyDTO.getNameCompany());
		company.setAddress(companyDTO.getAddress());
		company.setPhoneNumber(companyDTO.getPhoneNumber());
		company.setDescription(companyDTO.getDescription());
		
		companyService.saveCompany(company);
		model.addAttribute("msg_update_company_success", "success");
		return "profile";
	}
	@PostMapping("/uploadImgCompany")
	public String uploadImageCompany(@RequestParam("file") MultipartFile file, HttpSession session,
			@RequestParam("recruiterId") String recruiterId, Model model) {
		Company company = companyService.getCompany(Integer.parseInt(recruiterId));
		if (file.isEmpty()) {
			model.addAttribute("companyDTO", company);
			return "redirect:/user/profile/" + recruiterId;
		}
		
		uploadImgUserOrCompany(session, file, recruiterId, null, company);
		
		return "redirect:/user/profile/" + recruiterId;
	}
	
	public void uploadImgUserOrCompany(HttpSession session, MultipartFile file, String recruiterId, User user, Company company) {
		// Lấy tên file gốc
		String fileName = file.getOriginalFilename();
		// Tạo chuỗi đường dẫn file
		String filePath = session.getServletContext().getRealPath("/") + "resources"  
				+ File.separator + "assets" 
				+ File.separator + "images"
				+ File.separator + fileName;
		
		try {
			File newFile = new File(filePath);
			FileOutputStream outputStream = new FileOutputStream(newFile);
			outputStream.write(file.getBytes());
			outputStream.close();
			if(user != null) {
				userService.updateImage(fileName, Integer.parseInt(recruiterId));
				user.setImage(fileName);
			} 
			if(company != null) {
				companyService.updateImage(fileName, Integer.parseInt(recruiterId));
				company.setLogo(fileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
