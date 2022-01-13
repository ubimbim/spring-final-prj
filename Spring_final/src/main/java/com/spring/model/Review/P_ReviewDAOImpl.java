package com.spring.model.Review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class P_ReviewDAOImpl implements P_ReviewDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<P_ReviewDTO> PRList(String str) {
		return this.sqlSession.selectList("pr_list", str);
	}

	@Override
	public int insertPR(P_ReviewDTO dto) {
		return this.sqlSession.insert("pr_add", dto);
	}

	@Override
	public int updatePR(P_ReviewDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePR(int no) {
		return this.sqlSession.delete("pr_del", no);
	}


	
}
