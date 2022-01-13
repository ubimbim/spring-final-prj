package com.spring.model.Plan;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlanDAOImpl implements PlanDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public WholePlanDTO getWholePlanCont(int Planner_no) {
		return this.sqlSession.selectOne("wp_select", Planner_no);		
	}

	@Override
	public List<EachPlanDTO> getEachPlanList(int Planner_no) {		
		return this.sqlSession.selectList("EP_list", Planner_no);
	}

}
