package com.spring.project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.member.MemberDTO;
import com.spring.model.member.MemberService;

@Controller
public class ProjectController {
	
	@Autowired
	private MemberService msvc;	
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("kakao_login.do")
	public String kakaoLogin() {
		return "user/kakao_login";
	}
	
	@RequestMapping("kakao_signUp.do")
	public String kakaoSignUp() {
		return "user/kakao_signUp";
	}
	
	@RequestMapping("email_login.do")
	public String emailLogin() {
		return "user/email_login";
	}
	
	@RequestMapping("sign_up.do")
	public String emailSignUp() {
		return "user/email_join";
	}
	
	@PostMapping("id_valid_check.do")
	@ResponseBody
	public int idCheck(@RequestParam("email") String email) {
		
		int count = msvc.emailCheck(email);
		
		return count;
	}
	
	@RequestMapping("sign_up_ok.do")
	public void emailSignUpOk(MemberDTO dto, HttpServletResponse response) throws IOException {
		int res = msvc.emailJoin(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(res > 0) {
			out.println("<script>");
			out.println("alert('회원가입을 축하합니다! 가입한 이메일로 로그인 해주시기 바랍니다!!')");
			out.println("location.href='main.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원가입에 실패했습니다...')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("email_login_ok.do")
	public void emailLoginOk(@RequestParam("U_email") String email_id, 
			@RequestParam("U_pwd") String pwd,
			HttpServletResponse response) throws IOException {
		
		int check = msvc.emailLoginCheck(email_id, pwd);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		
		
		if(check == 1) {
			session.setAttribute("email_id", email_id);
			System.out.println("세션 생성 성공! 세션ID >>> " + "${email_id}" );
			out.println("<script>");
			out.println("alert('로그인 성공!! 환영합니다!!')");
			out.println("location.href='main.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 확인해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}		
	}
	
	@RequestMapping("email_logout.do")
	public String emailLogout() {
		session.invalidate();
		return "main";
	}
	
	@RequestMapping("find_password.do")
	public String findPwd() {
		return "user/find_pwd";
	}
	
	@PostMapping("find_password_ok.do")
	public void findPwdOk(@RequestParam("U_email") String email, HttpServletResponse response) throws IOException {
		String tempPwd = msvc.createTempPwd(email);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(tempPwd != null) {
			out.println("<script>");
			out.println("alert('임시비밀번호는 " + tempPwd + " 입니다. ')");
			out.println("location.href='email_login.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('가입된 이메일이 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
}
