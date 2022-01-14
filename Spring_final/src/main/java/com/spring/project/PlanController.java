package com.spring.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Plan.CartDAO;
import com.spring.model.Plan.CartDTO;
import com.spring.model.Plan.EachPlanDTO;
import com.spring.model.Plan.PlanDAO;
import com.spring.model.Plan.WholePlanDTO;

@Controller
public class PlanController {

	@Autowired
	private CartDAO cdao;

	
	@Autowired 
	private PlanDAO pdao;
	
	@RequestMapping("plan_list.do")
	public String plan_list(HttpServletRequest request, Model model) {
			
	
	  return "plan/plan_list";

	  
	}
	
	@RequestMapping("plan_make.do")
	public String plan_make() {
		
		return "plan/plan_make";
		
	}

	@RequestMapping("plan_detail.do")
	public String plan_detail(Model model, @RequestParam("Planner_no") int no) {
		
		WholePlanDTO wpdto = pdao.getWholePlanCont(no);
		List<EachPlanDTO> epdto = new ArrayList<EachPlanDTO>();
		epdto = pdao.getEachPlanList(no);
		int EPlistSize = epdto.size();		
		
		model.addAttribute("WPdto", wpdto); //플랜 제목, 시작/끝 날짜, 설명 가져올 수 있음.
		model.addAttribute("EPdto", epdto); //각각의 gps 좌표 가져올 수 있음.
		model.addAttribute("size", EPlistSize);
		
		return "plan/plan_detail";

	}

	@RequestMapping("prod_cart.do")
	public void cartadd(@RequestParam("userid") String userid, @RequestParam("id") String prodid, 
			CartDTO dto, HttpServletResponse response) throws IOException {
		System.out.println("상품 id >> " + prodid);
		
		int res = this.cdao.insertCart(dto, userid, prodid);
		System.out.println("res >>> " + res);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('찜 완료!')");
			out.println("location.href='activity_main.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('찜 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}
