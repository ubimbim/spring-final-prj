package com.spring.model.member;

public interface MemberDAO {
	
	int checkMember(String U_id);			//회원가입 여부 조회
	int insertMember(MemberDTO dto); 		//카카오 자동 회원가입
	int updateMember(MemberDTO dto);		//회원정보수정
	int deleteMember(int U_id);				//회원탈퇴
	int emailCheck(String email);			//email중복체크
	int emailJoin(MemberDTO dto);			//email로 회원가입
	int emailLoginCheck(String email_id, String pwd);	//입력받은 이메일과 DB의 비번이 일치하는지 확인 
	int updateTempPwd(MemberDTO dto);		//email로 비번 찾기 시 DB에 임시 비번 업뎃
	
}
