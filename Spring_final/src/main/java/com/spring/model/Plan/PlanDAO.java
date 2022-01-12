package com.spring.model.Plan;

import java.util.List;

public interface PlanDAO {
	public WholePlanDTO getWholePlanCont(int Planner_no);
	public List<EachPlanDTO> getEachPlanList(int Planner_no);
}
