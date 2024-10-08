package com.sonht.springmvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sonht.springmvc.dto.SearchForm;
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
		return "home";
	}


}
