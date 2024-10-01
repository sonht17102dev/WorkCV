package com.sonht.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.FollowCompany;
import com.sonht.springmvc.entity.SaveJob;
import com.sonht.springmvc.entity.User;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.FollowCompanyService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.UserService;

@Controller
public class FollowCompanyController extends BaseController {
	@Autowired
	FollowCompanyService followCompanyService;
	
	public FollowCompanyController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService,
			CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}
	
	@GetMapping("/list-follow-company")
	public String listFollowCompany(HttpSession session, Model model) {
		User user = (User) session.getAttribute("userLogin");
		List<FollowCompany> followCompanies = followCompanyService.getListFollowCompaniesByUserId(user.getId());
		model.addAttribute("followCompaniesList", followCompanies);
		return "list-follow-company";
	}
	
	@GetMapping("/detail-company/{companyId}")
	public String detailCompany(@PathVariable("companyId") String companyId, Model model) {
		Company companyFromDB = companyService.getCompany(Integer.parseInt(companyId));
		model.addAttribute("company", companyFromDB);
		return "detail-company";
	}
	
	@PostMapping("/user/follow-company/")
	@ResponseBody
	public Map<String, String> followCompany(@RequestParam("idUser") String userLoginId,
			@RequestParam("idCompany") String companyId, HttpSession session) {
		Map<String, String> messages = new HashMap<String, String>();
		
		if(userLoginId.isEmpty()) {
			messages.put("message", "error");
			return messages;
		}
		User userFromDB = userService.getUser(Integer.parseInt(userLoginId));
		Company companyFromDB = companyService.getCompany(Integer.parseInt(companyId));
		FollowCompany fc = new FollowCompany(companyFromDB, userFromDB);
		followCompanyService.save(fc);
		
		messages.put("message", "saveSuccess");
		return messages;
	}
	@PostMapping("/user/unfollow-company/")
	@ResponseBody
	public Map<String, String> unFollowCompany(@RequestParam("idUser") String userLoginId,
			@RequestParam("idCompany") String companyId, HttpSession session) {
		Map<String, String> messages = new HashMap<String, String>();
		System.out.println("companyId =" + companyId + " " + "userId = " + userLoginId );
		if(userLoginId.isEmpty()) {
			messages.put("message", "error");
			return messages;
		}
		FollowCompany fc = followCompanyService.findByCompanyIdAndUserId(Integer.parseInt(companyId), Integer.parseInt(userLoginId));
		followCompanyService.delete(fc);
		
		messages.put("message", "unSaveSuccess");
		return messages;
	}
}
