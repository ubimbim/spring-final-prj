package com.spring.model.Member;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public int emailCheck(String email) {
		int count = mDAO.emailCheck(email);
		return count;
	}

	@Override
	public int emailJoin(MemberDTO dto) {
		int res = mDAO.emailJoin(dto);
		return res;
	}

	@Override
	public int emailLoginCheck(String email_id, String pwd) {
		int res = mDAO.emailLoginCheck(email_id, pwd);
		return res;
	}

	@Override
	public String createTempPwd(String email) {
		UUID tempPwd = UUID.randomUUID();
		MemberDTO dto = new MemberDTO();
		dto.setU_email(email);
		dto.setU_pwd(tempPwd.toString());
		int res = mDAO.updateTempPwd(dto);
		if(res > 0) {
			System.out.println("임시 비밀번호 DB 업데이트 성공");
			return tempPwd.toString();
		}else {
			System.out.println("임시 비밀번호 DB 업데이트 실패");
			return null;
		}
		
	}

}
