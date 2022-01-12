package com.spring.model.Plan;

import java.sql.Date;

import lombok.Data;

@Data
public class EachPlanDTO {
	private int Plan_no;
	private int Planner_no;
	private Date Day;
	private String Category;
	private String Category_no;
	private Float X;
	private Float Y;
	private String name;
}
