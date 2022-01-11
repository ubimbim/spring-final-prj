package com.spring.model.Activity;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCart(CartDTO dto) {
		
		return this.sqlSession.insert("cartadd", dto);
		
	}

}
