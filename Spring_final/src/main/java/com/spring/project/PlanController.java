package com.spring.project;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {
	
	@RequestMapping("plan_make.do")
	public String plan_make() {
		return "plan/plan_make";
	}
	
	@RequestMapping("plan_list.do")
	public String plan_list(HttpServletRequest request, Model model) {
			
	
	  return "plan/plan_list";

	  
	}
  
}
