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
		}else if(dto.getCategory().equals("수상액티비티")) {
			return this.sqlSession.selectList("sea", dto);
		}else if(dto.getCategory().equals("크루즈/요트")) {
			return this.sqlSession.selectList("yacht", dto);
		}else if(dto.getCategory().equals("골프")) {
			return this.sqlSession.selectList("golf", dto);
		}else if(dto.getCategory().equals("실내액티비티")) {
			return this.sqlSession.selectList("indoor", dto);
		}else if(dto.getCategory().equals("익스트림액티비티")) {
			return this.sqlSession.selectList("extreme", dto);
		}else if(dto.getCategory().equals("이색체험")) {
			return this.sqlSession.selectList("uniq", dto);
			
		}else if(dto.getCategory().equals("제주시")) {
			return this.sqlSession.selectList("jeju", dto);
		}else if(dto.getCategory().equals("서귀포")) {
			return this.sqlSession.selectList("seogwipo", dto);
		}else if(dto.getCategory().equals("표선")) {
			return this.sqlSession.selectList("pyoseon", dto);
		}else if(dto.getCategory().equals("중문")) {
			return this.sqlSession.selectList("jungmun", dto);
		}else if(dto.getCategory().equals("함덕/구좌")) {
			return this.sqlSession.selectList("hamdokri", dto);
		}else if(dto.getCategory().equals("성산/우도")) {
			return this.sqlSession.selectList("seogsan", dto);
		}else if(dto.getCategory().equals("한림/협재")) {
			return this.sqlSession.selectList("hallim", dto);
		}else if(dto.getCategory().equals("애월")) {
			return this.sqlSession.selectList("aewoleup", dto);
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
	
	// 메인페이지 추천 리스트
	@Override
	public List<ActivityDTO> getActivityList(com.spring.model.Place.PageDTO dto) {
		return this.sqlSession.selectList("acti_main_all",dto);
	}
	
	

}

