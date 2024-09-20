package com.sonht.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApplyJobController {
	
	@GetMapping("list-apply-job")
	public String listjobs() {
		
		return "list_apply_job";
	}
}
