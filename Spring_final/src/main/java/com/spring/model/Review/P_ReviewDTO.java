package com.spring.model.Review;

import lombok.Data;

@Data
public class P_ReviewDTO {
	
	private int pr_no;
	private int p_no;
	private String user_id;
	private String pr_cont;
	private String pr_date;
	private int pr_grade;
	private String pr_img;
	private String pr_upload;
}
