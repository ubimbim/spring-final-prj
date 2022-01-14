package com.spring.model.Review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class A_ReviewDAOImpl implements A_ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<A_ReviewDTO> ARList(String str) {
		return this.sqlSession.selectList("alist", str);
	}

	@Override
	public int insertAR(A_ReviewDTO dto) {
		return this.sqlSession.insert("aadd", dto);
	}

	@Override
	public int updateAR(A_ReviewDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAR(int no) {
		return this.sqlSession.delete("adel", no);
	}

	
}
