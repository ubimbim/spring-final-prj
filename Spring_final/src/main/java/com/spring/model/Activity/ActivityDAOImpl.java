package com.spring.model.Activity;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Member.MemberDTO;
import com.spring.model.Review.S_ReviewDTO;

@Repository
public class ActivityDAOImpl implements ActivityDAO {
	
	//재연님 파트
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCont() {
		return this.sqlSession.selectOne("count");
	}

	@Override
	public List<ActivityDTO> getActivityList(PageDTO dto) {
		
		return this.sqlSession.selectList("all",dto);
		
		
	}

	@Override
	public int insertActivity(ActivityDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ActivityDTO activityCont(int no) {
		
		return this.sqlSession.selectOne("content", no);
	}

	@Override
	public void readCount(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateActivity(ActivityDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteActivity(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSequence(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int searchActivityCount(String field, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}
//
//	@Override
//	public List<ActivityDTO> searchActivityList(PageDTO dto) {
//		if(dto.getField().equals("snow")) {
//			return this.sqlSession.selectList("snowList", dto);
//		}else if(dto.getField().equals("cont")) {
//			return this.sqlSession.selectList("contList", dto);
//		}else if(dto.getField().equals("title_cont")) {
//			return this.sqlSession.selectList("titleCont", dto);
//		}else {
//			return this.sqlSession.selectList("writerList", dto);
//		}
//	}

	@Override
	public int getCategoryCont(String result) {
		return this.sqlSession.selectOne("category", result);
	}

	@Override
	public List<ActivityDTO> searchActivityList(PageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ActivityDTO> getCategorylist(PageDTO dto) {
		if(dto.getCategory().equals("아웃도어")) {                   //아웃도어와 같은 이름을 가져옴
			return this.sqlSession.selectList("outdoor", dto);
		}else if(dto.getCategory().equals("스노우클링/다이빙")) {
			return this.sqlSession.selectList("snow", dto);
		}else if(dto.getCategory().equals("서핑")) {
			return this.sqlSession.selectList("surfing", dto);
	    }else {
			return this.sqlSession.selectList("writerList", dto);
		}
	}
	
	//유빈님 파트
	@Override
	public List<ActivityDTO> getActivityList() {
		
		return this.sqlSession.selectList("act_recommend");
		
	}
	
	@Override
	public List<SpotDTO> getPlaceList() {
		
		return this.sqlSession.selectList("spot_recommend");

	}

	@Override
	public S_ReviewDTO getSpotReview() {
		
		return this.sqlSession.selectOne("spot_review");
		
	}

	@Override
	public MemberDTO getUserName() {
		
		return this.sqlSession.selectOne("user_name");
		
	}
	
	

}

