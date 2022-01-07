package com.spring.model.Review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class N_ReviewDAOImpl implements N_ReviewDAO {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<N_ReviewDTO> NRList() {
		return this.sqlSession.selectList("nlist");
	}

	@Override
	public int insertNR(N_ReviewDTO dto) {
		return this.sqlSession.insert("nadd", dto);
	}

	@Override
	public int updateNR(N_ReviewDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNR(int no) {
		return this.sqlSession.delete("ndel", no);
	}

}
