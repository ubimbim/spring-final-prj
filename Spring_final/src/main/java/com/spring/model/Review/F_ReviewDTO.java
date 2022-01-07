package com.spring.model.Review;

import lombok.Data;

@Data
public class F_ReviewDTO {
	private int fr_no;
	private int f_no;
	private String user_id;
	private String fr_cont;
	private String fr_date;
	private int fr_grade;
	private String fr_img;
	private String fr_upload;
}
