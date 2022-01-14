package com.spring.model.Place;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PlaceDAOImpl implements PlaceDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		
		return this.sqlSession.selectOne("p_count");
		
	}
	
	@Override
	public List<PlaceDTO> getPlaceList(PageDTO dto) {
		
		return this.sqlSession.selectList("list", dto);
		
	}

	@Override
	public int getCategoryCont(String result) {
	
		return this.sqlSession.selectOne("p_category", result);
	
	}
	
	@Override
	public List<PlaceDTO> getCategoryList(PageDTO dto) {
		
		if(dto.getCategory().equals("호텔")) {
		
			return this.sqlSession.selectList("호텔", dto);
		
		} else if(dto.getCategory().equals("펜션")) {
			
			return this.sqlSession.selectList("펜션", dto);
		
		} else if(dto.getCategory().equals("풀빌라")) {
			
			return this.sqlSession.selectList("풀빌라", dto);
	    
		} else if(dto.getCategory().equals("캠핑")) {
			
			return this.sqlSession.selectList("캠핑", dto);
	    
		} else if(dto.getCategory().equals("게하")) {
			
			return this.sqlSession.selectList("게하", dto);
	    
		} else {
			
			return this.sqlSession.selectList("writerList", dto);
		
		}
	
	}
	
	// 메인페이지 추천 리스트
	@Override
	public List<PlaceDTO> getPlaceList(com.spring.model.Activity.PageDTO dto) {
		return this.sqlSession.selectList("pl_main_all", dto);
	}


}
