package com.sonht.springmvc.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonht.springmvc.dto.SearchForm;
import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Recruitment;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.UserService;

@Controller
public class SearchController extends BaseController{

	public SearchController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService, CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}
	
	@PostMapping("/search")
	public String search(@Valid @ModelAttribute("searchForm") SearchForm searchForm, 
            BindingResult result, Model model, @RequestParam("keyword") String keyword, @RequestParam("type") String type) {
		if(result.hasErrors()) {
			model.addAttribute("searchForm", searchForm);
			super.homeData(model);
			return "home";
		}
		
		switch (type) {
			case "job":
				List<Recruitment> recruitments = recruitmentService.searchByKeyword(keyword);
	            model.addAttribute("recruitments", recruitments);
	            break;
			case "address":
				List<Recruitment> recruitmentsByAddress = recruitmentService.searchByAddress(keyword);
	            model.addAttribute("recruitments", recruitmentsByAddress);
	            break;
			case "company":
				List<Company> companies = companyService.searchByName(keyword);
	            model.addAttribute("companies", companies);
	            break;
		}
		homeData(model);
		return "result-search";
	}

	@Override
	protected void homeData(Model model) {
		Long numberCompany = companyService.countCompany();
		Long numberCandidate = applyPostService.countCandidate();
		Long numberRecruitment = recruitmentService.count();

		model.addAttribute("numberCandidate", numberCandidate);
		model.addAttribute("numberCompany", numberCompany);
		model.addAttribute("numberRecruitment", numberRecruitment);
	}
	
	
}
