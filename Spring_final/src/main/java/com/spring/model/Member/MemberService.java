package com.spring.model.Member;

public interface MemberService {
	int emailCheck(String email);						//이메일 중복 검사
	int emailJoin(MemberDTO dto);						//이메일 회원가입
	int emailLoginCheck(String email_id, String pwd);	//로그인 이메일/비번 일치 조회
	String createTempPwd(String email);					//임시 비번 생성
}
