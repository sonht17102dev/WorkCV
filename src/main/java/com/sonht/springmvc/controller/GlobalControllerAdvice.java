package com.sonht.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Recruitment;
import com.sonht.springmvc.entity.User;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.RecruitmentService;

@ControllerAdvice
public class GlobalControllerAdvice {
	
	@Autowired
	CompanyService companyService;
	
	@Autowired
	RecruitmentService recruitmentService;
	
	@ModelAttribute
    public void addAttributes(Model model, HttpSession session) {
		User user = (User) session.getAttribute("userLogin");
		if (user != null && user.getRole().getRoleName().equals("recruiter")) {
			Company company = companyService.getCompanyByUserId(user.getId());
			List<Recruitment> recruitments = recruitmentService.getRecruitmentsByCompany(company.getId()+"");
			// Truyền dữ liệu chung đến tất cả các controller
			if(!recruitments.isEmpty())
				model.addAttribute("recruitment_of_company", recruitments.get(0));
		}
    }
}
