package com.spring.project;

import java.text.DateFormat;  
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.model.Activity.ActivityDAO;
import com.spring.model.Activity.ActivityDTO;
import com.spring.model.Activity.PageDTO;
import com.spring.model.Place.PlaceDAO;
import com.spring.model.Place.PlaceDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ActivityDAO adao;
	
	@Autowired
	private PlaceDAO pdao;
	
	private final int rowsize = 8;      
	private int totalRecord = 0; 
	private int page = 1;
	PageDTO dto = new PageDTO(page, rowsize, totalRecord);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		/*
		 * logger.info("Welcome home! The client locale is {}.", locale);
		 * 
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */
		List<ActivityDTO> aList = this.adao.getActivityList(dto);
		List<PlaceDTO> pList = this.pdao.getPlaceList(dto);
		
		model.addAttribute("aList", aList); 
		model.addAttribute("pList", pList);
		
		return "main";
	}
	
}
