package com.thisteam.muhansangsa.mapper;

import java.util.List;

import com.thisteam.muhansangsa.vo.WhAreaVO;

public interface WhAreaMapper {

	// 창고 구역 목록 조회
	List<WhAreaVO> selectWhAreaList(String wh_cd);

	
	
}
