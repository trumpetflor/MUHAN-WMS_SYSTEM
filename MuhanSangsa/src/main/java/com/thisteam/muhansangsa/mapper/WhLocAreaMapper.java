package com.thisteam.muhansangsa.mapper;

import java.util.List;

import com.thisteam.muhansangsa.vo.WhLocAreaVO;

public interface WhLocAreaMapper {

	// 창고 구역 내 위치 목록 조회
	List<WhLocAreaVO> selectWhLocAreaList(int wh_area_cd);

}
