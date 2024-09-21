package com.sonht.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sonht.springmvc.dto.SearchForm;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.RecruitmentService;

@Controller
public class HomeController extends BaseController{

	@Autowired
	public HomeController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService) {
		super(categoryService, applyPostService, companyService, recruitmentService);
	}

	@GetMapping({ "/", "/home" })
	public String home(Model model) {
		model.addAttribute("searchForm", new SearchForm());
		homeData(model);
		return "home";
	}
	

}
