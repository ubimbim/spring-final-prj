package com.spring.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.Activity.ActivityDAO;
import com.spring.model.Activity.ActivityDTO;
import com.spring.model.Member.MemberDAO;
import com.spring.model.Member.MemberDTO;
import com.spring.model.Place.PlaceDAO;
import com.spring.model.Place.PlaceDTO;

@Controller
public class trvlrController {

	@Autowired	
	private MemberDAO mdao; 
	
	@GetMapping("mypage.do") 
	public String Mypage(Model model, @RequestParam("id") String id) {
		MemberDTO dto = this.mdao.getCont(id);
		
		model.addAttribute("cont", dto);
		
		return "user/mypage";
	}
	
	 @RequestMapping("user_edit.do") 
	 public void edit(
			 @RequestParam("id") String id, @RequestParam("phone") String phone, @RequestParam("pwd") String pwd,
			 @RequestParam("email") String email, MemberDTO dto, HttpServletResponse response) throws IOException {
		 
		 int res = this.mdao.editUser(dto, id, pwd, email, phone);
		 
		 response.setContentType("text/html; charset=utf-8");
			
		 PrintWriter out = response.getWriter();
		
		 if(res>0) {
			out.println("<script>");
			out.println("alert('정보를 수정했습니다.')");
			out.println("location.href='mypage.do?id="+id+"'");
			out.println("</script>");
		 } else {
			out.println("<script>");
			out.println("alert('정보를 수정하지 못했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		 }
	 } 
	
	@RequestMapping("user_delete.do") 
	public void delete(@RequestParam("id") String id, HttpServletResponse response) throws IOException {
		
		int res = this.mdao.deleteUser(id);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('탈퇴가 완료되었습니다.')");
			out.println("location.href='main.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('탈퇴가 완료되지 않았습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	/*
	 * @RequestMapping("search.do") public String search(@RequestParam("keyword")
	 * String keyword,
	 * 
	 * @RequestParam("page") int nowPage, Model model) {
	 * 
	 * totalRecord = this.Adao.searchActCount(keyword); // count 세고 결과에 따라 페이징하기.
	 * 
	 * List<ActivityDTO> searchList = this.Adao.getActSearchList(keyword);
	 * 
	 * return keyword; }
	 */
	
	@RequestMapping("myplan.do")
	public String Myplan(Model model) {
		return "myplan";
	}
	
}
