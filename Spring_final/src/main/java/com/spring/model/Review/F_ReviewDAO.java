package com.spring.model.Review;

import java.util.List;

public interface F_ReviewDAO {
	List<F_ReviewDTO> FRList();
	int insertFR(F_ReviewDTO dto);
	int updateFR(F_ReviewDTO dto);
	int deleteFR(int no);
}
