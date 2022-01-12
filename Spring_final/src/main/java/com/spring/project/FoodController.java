package com.spring.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FoodController {
	
	@RequestMapping(value="/food_main.do")
	public String food_main() {
		return "food/food_main";
	}
}
