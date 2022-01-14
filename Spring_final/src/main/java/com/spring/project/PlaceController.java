package com.spring.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.Place.PageDTO;
import com.spring.model.Place.PlaceDAO;
import com.spring.model.Place.PlaceDTO;



@Controller
public class PlaceController {
	
	@Autowired
	private PlaceDAO dao;

	private final int rowsize = 5;        // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0;          // DB 상의 게시물 전체 수	
	
	@RequestMapping("place_list.do")
	public String list(HttpServletRequest request, Model model) {

		int page;  // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			
			page = Integer.parseInt(request.getParameter("page"));
		
		} else {
		
			page = 1;  // 처음으로 게시물목록 태그를 클릭한 경우
		
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 작업
		totalRecord = this.dao.getListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);		
		
		List<PlaceDTO> pageList = this.dao.getPlaceList(dto);
		
		
		
		model.addAttribute("List", pageList); 

		model.addAttribute("Paging", dto);		

		
		
		return "place/place_list";
		
	}
	
	@RequestMapping("place_category.do")
	public String plist(HttpServletRequest request, Model model) {
		
		String result = request.getParameter("result");
		
		int page;  // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			
			page = Integer.parseInt(request.getParameter("page"));
		
		} else {
		
			page = 1;  // 처음으로 게시물목록 태그를 클릭한 경우
		
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 작업
		totalRecord = this.dao.getCategoryCont(result);
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord, result);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<PlaceDTO> pageList = this.dao.getCategoryList(dto);
		
		model.addAttribute("List", pageList);
		
		model.addAttribute("Paging", dto);
		
		return "place/place_list";
		
	}
	
}
