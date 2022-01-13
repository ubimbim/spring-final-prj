package com.spring.model.Review;

import java.util.List;

public interface P_ReviewDAO {
	
	List<P_ReviewDTO> PRList(String str);
	int insertPR(P_ReviewDTO dto);
	int updatePR(P_ReviewDTO dto);
	int deletePR(int no);

	
}
