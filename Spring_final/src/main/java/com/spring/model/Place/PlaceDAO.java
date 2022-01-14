package com.spring.model.Place;

import java.util.List;



public interface PlaceDAO {
	
	int getListCount();
	
	List<PlaceDTO> getPlaceList(PageDTO dto);
	
	int getCategoryCont(String result); 
	
	List<PlaceDTO> getCategoryList(PageDTO dto);
	
	// 메인페이지 추천 리스트
	List<PlaceDTO> getPlaceList(com.spring.model.Activity.PageDTO dto);
	

}
