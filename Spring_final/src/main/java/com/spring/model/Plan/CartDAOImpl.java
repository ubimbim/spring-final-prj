package com.spring.model.Plan;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCart(CartDTO dto, String userid, String prodid) {
		
		dto.setU_id(userid);
		dto.setProd_no(prodid);
		
		System.out.println("찜한 유저 id >> " + dto.getU_id());
		System.out.println("찜한 상품 id >> " + dto.getProd_no());
		
		return this.sqlSession.insert("cartadd", dto);
		
	}

}
