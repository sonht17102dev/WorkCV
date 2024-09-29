package com.sonht.springmvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.sonht.springmvc.entity.ApplyPost;
import com.sonht.springmvc.entity.Category;
import com.sonht.springmvc.entity.Company;
import com.sonht.springmvc.entity.Recruitment;
import com.sonht.springmvc.entity.User;
import com.sonht.springmvc.service.ApplyPostService;
import com.sonht.springmvc.service.CategoryService;
import com.sonht.springmvc.service.CompanyService;
import com.sonht.springmvc.service.CvService;
import com.sonht.springmvc.service.RecruitmentService;
import com.sonht.springmvc.service.UserService;

@Controller
public class BaseController {
	CategoryService categoryService;
	ApplyPostService applyPostService;
	CompanyService companyService;
	RecruitmentService recruitmentService;
	UserService userService;
	CvService cvService;
	

	@Autowired
	public BaseController(CategoryService categoryService, ApplyPostService applyPostService,
			CompanyService companyService, RecruitmentService recruitmentService, UserService userService, CvService cvService) {
		this.categoryService = categoryService;
		this.applyPostService = applyPostService;
		this.companyService = companyService;
		this.recruitmentService = recruitmentService;
		this.userService = userService;
		this.cvService = cvService;
	}
	
	
	protected void homeData(Model model) {
		Long numberCompany = companyService.countCompany();
		List<ApplyPost> applyPosts = applyPostService.getAlls();
		Map<Company, Integer> companiesWithMaxUserApplied = getCompaniesWithMaxUserApplied(applyPosts);
		Map<Recruitment, Integer> recruitmentWithMaxUserApplied = getRecruitmentsWithMaxUserApplied(applyPosts);
		Integer numberCandidate = applyPosts.size();
		Long numberRecruitment = recruitmentService.count();
		List<Category> categories = categoryService.getTop4Categories();

		model.addAttribute("numberCandidate", numberCandidate);
		model.addAttribute("numberCompany", numberCompany);
		model.addAttribute("numberRecruitment", numberRecruitment);

		model.addAttribute("categories", categories);
		model.addAttribute("companiesMap", companiesWithMaxUserApplied);
		model.addAttribute("recruitments", recruitmentWithMaxUserApplied.keySet());
	}
	
	protected Map<Company, Integer> getCompaniesWithMaxUserApplied(List<ApplyPost> applyPosts) {
		// Tạo một Map để đếm số lượng user ứng tuyển cho mỗi công ty
		Map<Company, Set<User>> companyUserMap = new HashMap<>();
		Map<Company, Integer> companyUserUnsortedMap = new HashMap<>();
		for (ApplyPost applyPost : applyPosts) {
			Company company = applyPost.getRecruitment().getCompany();
			User user = applyPost.getUser();
			companyUserMap.putIfAbsent(company, new HashSet<>());
			companyUserMap.get(company).add(user); // Đếm dựa trên số lượng user khác nhau
		}

		// Đưa vào danh sách các công ty và số lượng user ứng tuyển
		companyUserMap.forEach((company, users) -> {
			companyUserUnsortedMap.put(company, users.size());
		});
		Map<Company, Integer> sortedMap = companyUserUnsortedMap.entrySet().stream()
				.sorted(Map.Entry.<Company, Integer>comparingByValue().reversed())
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));

		return sortedMap;
	}
	
	protected Map<Recruitment, Integer> getRecruitmentsWithMaxUserApplied(List<ApplyPost> applyPosts) {
		// Tạo một Map để đếm số lượng user ứng tuyển cho mỗi công ty
		Map<Recruitment, Set<User>> recruitmentUserMap = new HashMap<>();
		Map<Recruitment, Integer> recruitmentUserUnsortedMap = new HashMap<>();
		for (ApplyPost applyPost : applyPosts) {
			Recruitment recruitment = applyPost.getRecruitment();
			User user = applyPost.getUser();

			// Đưa recruitment vào map nếu chưa có
			recruitmentUserMap.putIfAbsent(recruitment, new HashSet<>());
			// Thêm user vào set của recruitment
			recruitmentUserMap.get(recruitment).add(user);
		}

		// Chuyển đổi từ Set<User> sang Integer để đếm số lượng user
		recruitmentUserMap.forEach((recruitment, users) -> {
			recruitmentUserUnsortedMap.put(recruitment, users.size());
		});

		Map<Recruitment, Integer> sortedMap = recruitmentUserUnsortedMap.entrySet().stream()
				.sorted(Map.Entry.<Recruitment, Integer>comparingByValue().reversed())
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));

		return sortedMap;
	}
	
	public void uploadFile(HttpSession session, MultipartFile file, String recruiterId, User user, Company company) {
		// Lấy tên file gốc
		String fileName = file.getOriginalFilename();
		// Tạo chuỗi đường dẫn file
		String filePath = session.getServletContext().getRealPath("/") + "resources"  
				+ File.separator + "assets" 
				+ File.separator + "images"
				+ File.separator + fileName;
		
		try {
			File newFile = new File(filePath);
			FileOutputStream outputStream = new FileOutputStream(newFile);
			outputStream.write(file.getBytes());
			outputStream.close();
			if(user != null) {
				userService.updateImage(fileName, Integer.parseInt(recruiterId));
				user.setImage(fileName);
			} 
			else if(company != null) {
				companyService.updateImage(fileName, Integer.parseInt(recruiterId));
				company.setLogo(fileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
