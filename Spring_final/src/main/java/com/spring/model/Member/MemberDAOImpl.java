package com.spring.model.Member;

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
		if(this.sqlSession.selectOne("m_check", U_id) != null) { //1이 반환되면 기가입자, 0이 반환되면 미가입자
			return 1;
		}else {
			return 0;
		}		
	}	
	
	@Override
	public int insertMember(MemberDTO dto) {
		
		return this.sqlSession.insert("m_join", dto);
		
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

	@Override
	public MemberDTO getCont(String U_id) {
		return this.sqlSession.selectOne("m_content", U_id);
	}

	@Override
	public int editUser(MemberDTO dto, String id, String pwd, String email, String phone) {
		
		dto.setU_pwd(pwd);
		dto.setU_email(email);
		dto.setU_phone(phone);
		dto.setU_id(id);
		
		return this.sqlSession.update("m_update", dto);
		
	}

	@Override
	public int deleteUser(String id) {
		return this.sqlSession.delete("m_delete", id);
	}


}
