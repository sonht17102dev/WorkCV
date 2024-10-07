package com.sonht.springmvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.UserService;

@Controller
public class RecruitmentController extends BaseController {

	public RecruitmentController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService,
			CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}
	
	@GetMapping("/user/list-post")
	public String listPosts(HttpServletRequest request, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int size) {
		request.removeAttribute("mgs_delete_success");
		listRecruitment(request, page, size);
		
		return "list-recruitment";
	}
}
