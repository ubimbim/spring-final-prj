package com.spring.model.Place;

import java.util.List;

public interface PlaceDAO {
	
	int getListCount();
	
	List<PlaceDTO> getPlaceList(PageDTO dto);
	
	int getCategoryCont(String result); 
	
	List<PlaceDTO> getCategoryList(PageDTO dto);
	
}
