package com.spring.model.Review;

import java.util.List;

public interface N_ReviewDAO {
	List<N_ReviewDTO> NRList();
	int insertNR(N_ReviewDTO dto);
	int updateNR(N_ReviewDTO dto);
	int deleteNR(int no);
}
