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
import org.springframework.web.multipart.MultipartFile;

import com.sonht.springmvc.entity.ApplyPost;
import com.sonht.springmvc.entity.Cv;
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
public class SaveJobController extends BaseController {
	@Autowired
	SaveJobService saveJobService;
	
	public SaveJobController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService,
			CvService cvService) {
		super(categoryService, applyPostService, companyService, recruitmentService, userService, cvService);
	}
	
	@GetMapping("/user/list-save-job")
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
	
	@PostMapping("/user/apply-job1/")
	@ResponseBody
	public Map<String, String> applyJob1(@RequestParam("userLoginId") String userLoginId,
			@RequestParam("idRe") String idRe, @RequestParam("text") String text, HttpSession session) {
		Map<String, String> messages = new HashMap<String, String>();
		if (userLoginId.isEmpty()) {
			messages.put("message", "errorNotLogin");
			return messages;
		}
		boolean isApplied = applyPostService.checkUserApplied(Integer.parseInt(idRe), Integer.parseInt(userLoginId),
				text);
		if (isApplied) {
			messages.put("message", "errorApplied");
			return messages;
		}

		User user = userService.getUser(Integer.parseInt(userLoginId));
		Recruitment recruitment = recruitmentService.getRecruitment(Integer.parseInt(idRe));
		ApplyPost newApplyPost = new ApplyPost(java.time.LocalDate.now().toString(), user.getCv().getFileName(), 0,
				text);
		newApplyPost.setRecruitment(recruitment);
		newApplyPost.setUser(user);
		applyPostService.save(newApplyPost);
		
		messages.put("message", "success");
		return messages;
	}

	@PostMapping("/user/apply-job/")
	@ResponseBody
	public Map<String, String> applyJob(@RequestParam("userLoginId") String userLoginId, HttpSession session,
			@RequestParam("idRe") String idRe, @RequestParam("text") String text,
			@RequestParam("file") MultipartFile file) {
		Map<String, String> messages = new HashMap<String, String>();

		if (userLoginId.isEmpty()) {
			messages.put("message", "errorNotLogin");
			return messages;
		}
		boolean isApplied = applyPostService.checkUserApplied(Integer.parseInt(idRe), Integer.parseInt(userLoginId),
				text);
		if (isApplied) {
			messages.put("message", "errorApplied");
			return messages;
		}
		User user = (User) session.getAttribute("userLogin");
		Cv cv = user.getCv();
		cv.setFileName(file.getOriginalFilename());
		user.setCv(cv);
		userService.saveUser(user);
		Recruitment recruitment = recruitmentService.getRecruitment(Integer.parseInt(idRe));
		ApplyPost newApplyPost = new ApplyPost(java.time.LocalDate.now().toString(), file.getOriginalFilename(), 0,
				text);
		newApplyPost.setRecruitment(recruitment);
		newApplyPost.setUser(user);
		applyPostService.save(newApplyPost);
		messages.put("message", "success");
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
		SaveJob saveJobDuplicated = saveJobService.findSaveJobByUserIdAndRecruitmentId(Integer.parseInt(idRe), Integer.parseInt(userLoginId));
		if (saveJobDuplicated != null) {
			saveJobService.deleteSaveJob(saveJobDuplicated.getId());
			messages.put("message", "errorSaveDuplicated");
			return messages;
		} else {
			Recruitment recruitmentFromDB = recruitmentService.getRecruitment(Integer.parseInt(idRe));
			User userFromDB = userService.getUser(Integer.parseInt(userLoginId));
	
			SaveJob saveJob = new SaveJob(recruitmentFromDB, userFromDB);
			saveJobService.saveSaveJob(saveJob);
	
			messages.put("message", "saveSuccess");
			return messages;
		}
	}

	@PostMapping("/save-job/unsave/")
	@ResponseBody
	public Map<String, String> unsaveJob(@RequestParam("userLoginId") String userLoginId,
			@RequestParam("idRe") String idRe) {
		Map<String, String> messages = new HashMap<String, String>();
		if (userLoginId.isEmpty()) {
			messages.put("message", "error");
			return messages;
		} else {

			SaveJob saveJob = saveJobService.findSaveJobByUserIdAndRecruitmentId(Integer.parseInt(userLoginId),
					Integer.parseInt(idRe));
			if(saveJob != null) {
				saveJobService.deleteSaveJob(saveJob.getId());
			}
			messages.put("message", "unSaveSuccess");
			return messages;
		}
	}
}
