package com.spring.project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.Activity.CartDAO;
import com.spring.model.Activity.CartDTO;

@Controller
public class PlanController {
	
	@Autowired
	private CartDAO cdao;
	
	@RequestMapping("prod_cart.do")
	public void cartadd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String prod_id = request.getParameter("id");
		// int res = this.cdao.insertCart(prod_id);
		// String user_id = request.getParameter("u_id");
		// String prod_type = request.getParameter("type");
	
		CartDTO dto = new CartDTO();
		
		if(prod_id != null) {
			dto.setA_no(prod_id);
		}
		
		int res = this.cdao.insertCart(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('찜 완료!");
			out.println("location.href='activity_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('찜 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}
