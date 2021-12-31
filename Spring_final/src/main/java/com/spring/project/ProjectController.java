package com.spring.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	@RequestMapping("login.do")
	public String home(Model model) {
		return "user/login";
	}
	
}
