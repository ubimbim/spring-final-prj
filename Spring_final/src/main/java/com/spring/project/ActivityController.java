package com.spring.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.Activity.ActivityDAO;
import com.spring.model.Activity.ActivityDTO;
import com.spring.model.Activity.PageDTO;
import com.spring.model.Activity.SpotDTO;
import com.spring.model.Member.MemberDTO;
import com.spring.model.Review.S_ReviewDTO;


@Controller
public class ActivityController {

	@Autowired
	private ActivityDAO dao;
	
	
	private final int rowsize = 9;			// 한 페이지에 보여질 게시물의 수
	private int totalRecord = 0;            // DB 상의 게시물 전체 수
	
	
	@RequestMapping("activity_list.do")
	public String list(HttpServletRequest request, Model model) {
		
		int page;  // 현재 페이지 변수 
		
		if(request.getParameter("page") !=null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}else {
			page = 1;   // 처음으로 게시물 목록 태그를 클릭한 경우
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 작업
		totalRecord = this.dao.getListCont();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<ActivityDTO> pageList = this.dao.getActivityList(dto);
		
		model.addAttribute("List", pageList);
		model.addAttribute("Paging", dto);
		
		return "activity/activity_list";
		
		
	}
	
	@RequestMapping("activity_category.do")
	public String clist(HttpServletRequest request, Model model) {
		
		String result = request.getParameter("result");
		
		int page;  // 현재 페이지 변수 
		
		if(request.getParameter("page") !=null) {
			page = Integer.parseInt(request.getParameter("page")); 
		}else {
			page = 1;   // 처음으로 게시물 목록 태그를 클릭한 경우
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 작업
		totalRecord = this.dao.getCategoryCont(result);
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord, result);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<ActivityDTO> pageList = this.dao.getCategorylist(dto);
		
		model.addAttribute("List", pageList);
		model.addAttribute("Paging", dto);
		
		return "activity/activity_list";
	}
	
//	@RequestMapping("activity_list.do")
//	public String list(Model model) {
//		
//		List<ActivityDTO> list = this.dao.getActivityList();
//		
//		model.addAttribute("List", list);
//		
//		return "activity_list";
//		
//		
//	}
	
//	@RequestMapping("activity_cont.do")
//	public String content(@RequestParam("no") int no, Model model) {
//		
//		ActivityDTO dto = this.dao.activityCont(no);
//		
//		model.addAttribute("Cont", dto);
//		
//		// System.out.println("image >>> " + dto.getA_img());
//		
//		return "activity_list";
//	}
	
//	@RequestMapping("activity_search.do")
//	public String search(@RequestParam("field") String field,
//			@RequestParam("keyword") String keyword,
//			@RequestParam("page") int nowPage, Model model) {
//		
//		// 검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
//		totalRecord = this.dao.searchActivityCount(field, keyword);
//		
//		PageDTO dto = 
//				new PageDTO(nowPage, rowsize, totalRecord, field, keyword);
//		
//		System.out.println("검색 게시물 수 >>> " + dto.getTotalRecord());
//		System.out.println("전체 페이지 수 >>> " + dto.getAllPage());
//		
//		// 한 페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드.
//		List<ActivityDTO> searchList = this.dao.searchActivityList(dto);
//		
//		model.addAttribute("searchPageList", searchList);
//		
//		model.addAttribute("paging", dto);
//		
//		return "board_search";
//		
//	}
	
	
	@RequestMapping("activity_main.do")
	public String activity_main(Model model) {
		
		List<ActivityDTO> alist = this.dao.getActivityList();
		List<SpotDTO> slist =  this.dao.getPlaceList();
		S_ReviewDTO sr_dto = this.dao.getSpotReview();
		MemberDTO u_dto = this.dao.getUserName();
		
		model.addAttribute("Alist", alist);
		model.addAttribute("Slist", slist);
		model.addAttribute("SRdto", sr_dto);
		model.addAttribute("Udto", u_dto);
		
		return "activity/activity_main";
	
	}




}
	
