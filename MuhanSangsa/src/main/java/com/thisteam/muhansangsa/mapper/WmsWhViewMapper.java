package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.Wms_wh_viewVO;

public interface WmsWhViewMapper {

	// 창고 구역 내 위치 목록 조회
	List<Wms_wh_viewVO> selectWhViewList();

	// 창고, 창고 구역, 창고 구역 내 위치 조회
//	Wms_wh_viewVO selectWhView(
//			@Param("wh_cd") String wh_cd, 
//			@Param("wh_area_cd") int wh_area_cd, 
//			@Param("wh_loc_in_area_cd") int wh_loc_in_area_cd);

	// 창고, 창고 구역, 창고 구역 내 위치 이름 조회
	List<Wms_wh_viewVO> selectWhNameList(
			@Param("wh_cd") String wh_cd, 
			@Param("wh_area_cd") int wh_area_cd, 
			@Param("wh_loc_in_area_cd") int wh_loc_in_area_cd);
	

}
