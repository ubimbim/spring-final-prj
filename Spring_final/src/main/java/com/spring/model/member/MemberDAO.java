package com.spring.model.member;

public interface MemberDAO {
	
	int checkMember(String U_id);			//회원가입 여부 조회
	int insertMember(MemberDTO dto); 			//회원가입
	int updateMember(MemberDTO dto);			//회원정보수정
	int deleteMember(int U_id);					//회원탈퇴	
	
}
