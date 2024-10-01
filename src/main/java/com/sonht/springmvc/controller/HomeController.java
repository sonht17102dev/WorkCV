package com.sonht.springmvc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sonht.springmvc.dto.SearchForm;
import com.sonht.springmvc.entity.Recruitment;
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
	public String home(Model model) {
		model.addAttribute("searchForm", new SearchForm());
		homeData(model);
		return "home";
	}

	@PostMapping("/user/apply-job1/")
	@ResponseBody
	public Map<String, String> applyJob1(@RequestParam("userLoginId") String userLoginId,
			@RequestParam("idRe") String idRe, @RequestParam("text") String text) {
		Map<String, String> messages = new HashMap<String, String>();

		if (userLoginId.isEmpty()) {
			messages.put("message", "error");
			return messages;
		}
		boolean isApplied = applyPostService.checkUserApplied(Integer.parseInt(idRe), Integer.parseInt(userLoginId),
				text);
		if (isApplied) {
			messages.put("message", "errorApplied");
			return messages;
		}
		applyPostService.updateTextByRecruitmentId(Integer.parseInt(idRe), Integer.parseInt(userLoginId), text);
		messages.put("message", "success");
		return messages;
	}

	@PostMapping("/user/apply-job/")
	@ResponseBody
	public Map<String, String> applyJob(@RequestParam("userLoginId") String userLoginId,
			@RequestParam("idRe") String id, @RequestParam("text") String text) {
		Map<String, String> messages = new HashMap<String, String>();
		if (userLoginId == null) {
			messages.put("message-applyJob-error", "Bạn cần phải đăng nhập");
			return messages;
		}

		return messages;
	}

	@PostMapping("/save-job/save/")
	@ResponseBody
	public Map<String, String> saveJob(@RequestParam("userLoginId") String userLoginId,
			@RequestParam("idRe") String idRe) {
		Map<String, String> messages = new HashMap<String, String>();

		if (userLoginId.isEmpty()) {
			messages.put("message", "error");
			return messages;
		}
		Recruitment recruitmentFromDB = recruitmentService.getRecruitment(Integer.parseInt(idRe));
		User userFromDB = userService.getUser(Integer.parseInt(userLoginId));

		SaveJob saveJob = new SaveJob(recruitmentFromDB, userFromDB);
		saveJobService.saveSaveJob(saveJob);

		messages.put("message", "saveSuccess");
		return messages;
	}

	@PostMapping("/save-job/unsave/")
	@ResponseBody
	public Map<String, String> unsaveJob(@RequestParam("userLoginId") String userLoginId,
			@RequestParam("idRe") String idRe) {
		Map<String, String> messages = new HashMap<String, String>();
		if (userLoginId.isEmpty()) {
			messages.put("message", "error");
			return messages;
		}

		SaveJob saveJob = saveJobService.findSaveJobByUserIdAndRecruitmentId(Integer.parseInt(userLoginId),
				Integer.parseInt(idRe));
		saveJobService.deleteSaveJob(saveJob.getId());

		messages.put("message", "unSaveSuccess");
		return messages;
	}
}
