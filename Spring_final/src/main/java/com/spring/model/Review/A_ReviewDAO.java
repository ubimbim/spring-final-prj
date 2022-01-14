package com.spring.model.Review;

import java.util.List;



public interface A_ReviewDAO {
	
	List<A_ReviewDTO> ARList(String str);
	int insertAR(A_ReviewDTO dto);
	int updateAR(A_ReviewDTO dto);
	int deleteAR(int no);

	
}
