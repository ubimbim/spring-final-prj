package com.spring.model.Review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class F_ReviewDAOImpl implements F_ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<F_ReviewDTO> FRList() {
		return this.sqlSession.selectList("flist");
	}

	@Override
	public int insertFR(F_ReviewDTO dto) {
		return this.sqlSession.insert("fadd", dto);
	}

	@Override
	public int updateFR(F_ReviewDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFR(int no) {
		return this.sqlSession.delete("fdel", no);
	}

}
