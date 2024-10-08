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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sonht.springmvc.entity.ApplyPost;
import com.sonht.springmvc.entity.User;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.SaveJobService;
import com.sonht.springmvc.service.UserService;

@Controller
public class ApplyJobController extends BaseController {
	@Autowired
	SaveJobService saveJobService;

	public ApplyJobController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService,
			CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}

	@GetMapping("/user/get-list-apply")
	public String listjobs(HttpSession session, Model model) {
		User user = (User) session.getAttribute("userLogin");
		List<ApplyPost> applyPosts = applyPostService.getApplyPostsByUserId(user.getId());
		model.addAttribute("listApplyPosts", applyPosts);

		return "list_apply_job";
	}

	@GetMapping("/recruitment/get-list-apply/{recruitmentId}")
	public String listjobsOfRecruiter(@PathVariable("recruitmentId") String recruitmentId, Model model) {
		List<ApplyPost> applyPosts = applyPostService.getApplyPostsByRecruitmentId(Integer.parseInt(recruitmentId));
		model.addAttribute("listApplyPosts", applyPosts);
		System.out.println(applyPosts.size());
		return "list_apply_job";
	}

	@GetMapping("/recruitment/approve")
	public String approve(@RequestParam("id") String id, @RequestParam("recruitmentId") String recruitmentId,
			Model model, RedirectAttributes rd) {
		applyPostService.approveCV(id);
		rd.addFlashAttribute("message", "success");
		return "redirect:/recruitment/get-list-apply/" + recruitmentId;
	}

	@PostMapping("/user/delete-apply/") 
	public String deleteApply(@RequestParam("id") String applyJobId, RedirectAttributes rd) {
		applyPostService.deleteApplyJob(Integer.parseInt(applyJobId));
		rd.addFlashAttribute("delete_success", "success");
		return "redirect:/user/get-list-apply";
	}
}
