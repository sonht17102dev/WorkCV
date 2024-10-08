package com.sonht.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sonht.springmvc.dto.SearchForm;
import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Recruitment;
import com.sonht.springmvc.entity.User;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.SaveJobService;
import com.sonht.springmvc.service.UserService;

@Controller
public class HomeController extends BaseController {
	@Autowired
	SaveJobService saveJobService;

	@Autowired
	public HomeController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService,
			CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}

	@GetMapping({ "/", "/home" })
	public String home(Model model, HttpSession session) {
		model.addAttribute("searchForm", new SearchForm());
		homeData(model);
		
		User user = (User) session.getAttribute("userLogin");
		if (user != null) {
			Company company = companyService.getCompanyByUserId(user.getId());
			List<Recruitment> recruitments = recruitmentService.getRecruitmentsByCompany(company.getId()+"");
			if(!recruitments.isEmpty())
				model.addAttribute("recruitment_of_company", recruitments.get(0));
		}
		return "home";
	}


}
