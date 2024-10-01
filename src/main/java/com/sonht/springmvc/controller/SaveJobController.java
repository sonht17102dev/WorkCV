package com.sonht.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonht.springmvc.entity.SaveJob;
import com.sonht.springmvc.entity.User;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.SaveJobService;
import com.sonht.springmvc.service.UserService;

@Controller
public class SaveJobController extends BaseController {
	@Autowired
	SaveJobService saveJobService;
	
	public SaveJobController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService,
			CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}
	
	@GetMapping("list-save-job")
	public String displaySaveJob(Model model, HttpSession session) {
		listSaveJobs(model, session);
		
		return "list-save-job";
	}
	
	@PostMapping("/save-job/delete")
	public String deleteSaveJob(@RequestParam("id") String saveJobId, Model model, HttpSession session) {
		saveJobService.deleteSaveJob(Integer.parseInt(saveJobId));
		model.addAttribute("delete_success", "success");
		listSaveJobs(model, session);
		
		return "list-save-job";
	}
	
	private void listSaveJobs(Model model, HttpSession session) {
		User user = (User) session.getAttribute("userLogin");
		List<SaveJob> saveJobs = saveJobService.getListSaveJobsByUserId(user.getId());
		model.addAttribute("saveJobList", saveJobs);
	}
}
