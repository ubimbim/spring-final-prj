package com.spring.model.Plan;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class WholePlanDTO {
	private int Planner_no;	
	private String Title;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date Start_date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date Last_date;
	
	private String Description;
	private String U_id;
}
