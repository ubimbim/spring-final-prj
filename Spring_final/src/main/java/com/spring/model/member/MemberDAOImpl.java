package com.spring.model.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	//카카오 가입시 기존 가입자 체크
	@Override
	public int checkMember(String U_id) {
		if(this.sqlSession.selectOne("check", U_id) != null) { //1이 반환되면 기가입자, 0이 반환되면 미가입자
			return 1;
		}else {
			return 0;
		}		
	}	
	
	@Override
	public int insertMember(MemberDTO dto) {
		
		return this.sqlSession.insert("join", dto);
		
	}

	@Override
	public int updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(int U_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int emailCheck(String email) {
		int count = sqlSession.selectOne("email_check", email);
		return count;
	}

	@Override
	public int emailJoin(MemberDTO dto) {
		
		return this.sqlSession.insert("emailJoin", dto);
	}

	@Override
	public int emailLoginCheck(String email_id, String pwd) {
		String DB_pwd = sqlSession.selectOne("login_check", email_id);
		if(DB_pwd.equals(pwd)) {
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public int updateTempPwd(MemberDTO dto) {
		int res = this.sqlSession.update("tempPwd", dto);
		return res;
	}

}
