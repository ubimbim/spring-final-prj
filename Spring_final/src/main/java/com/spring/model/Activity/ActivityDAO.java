package com.spring.model.Activity;

import java.util.List; 

import com.spring.model.Member.MemberDTO;
import com.spring.model.Review.S_ReviewDTO;

public interface ActivityDAO {	
	
	// 재연님 파트
	int getListCont();
	
	List<ActivityDTO> getActivityList (PageDTO dto);
	
	int getCategoryCont (String result);  // 카테고리에 해당하는 레코드  수 확인
	
	List<ActivityDTO> getCategorylist(PageDTO dto);
	
	int insertActivity (ActivityDTO dto);
	
	ActivityDTO activityCont(int no);
	
	void readCount(int no);
	
	int updateActivity(ActivityDTO dto);
	
	int deleteActivity(int no);
	
	void updateSequence(int no);
	
	int searchActivityCount(String field, String keyword);
	
	List<ActivityDTO> searchActivityList(PageDTO dto);
	
	// 유빈 님 파트
	public List<ActivityDTO> getActivityList();
	
	public List<SpotDTO> getPlaceList();
	
	public S_ReviewDTO getSpotReview();
	
	public MemberDTO getUserName();
	
	
	// 메인페이지 추천 리스트
	List<ActivityDTO> getActivityList(com.spring.model.Place.PageDTO dto);
	
}
