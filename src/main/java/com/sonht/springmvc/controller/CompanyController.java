package com.sonht.springmvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Recruitment;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.UserService;

@Controller
public class CompanyController extends BaseController {

	public CompanyController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService,
			CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}
	
	@GetMapping("/user/list-company")
	public String listCompany(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int size) {
		List<Company> companies = companyService.findPaginated(page, size);
		int totalPages = companyService.getTotalPages(size);
		long totalItems = companyService.count();

		model.addAttribute("company_list", companies);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalItems", totalItems);
		model.addAttribute("pageSize", size);
		
		return "list-company";
	}
	
	@GetMapping("/user/detail-company/{companyId}")
	public String detailCompany(@PathVariable("companyId") String companyId, Model model) {
		Company companyFromDB = companyService.getCompany(Integer.parseInt(companyId));
		model.addAttribute("company", companyFromDB);
		return "detail-company";
	}
}
