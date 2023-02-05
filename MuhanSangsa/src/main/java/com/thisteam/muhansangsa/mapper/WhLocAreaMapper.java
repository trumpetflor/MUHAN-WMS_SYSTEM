package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.WhLocAreaVO;

public interface WhLocAreaMapper {

	// 창고 구역 내 위치 목록 조회
	List<WhLocAreaVO> selectWhLocAreaList(int wh_area_cd);

	// 창고 구역 내 위치 등록
	int insertWhLocArea(WhLocAreaVO whLocArea);

	// 창고 구역 내 위치 수정
	int updateWhLocArea(
			@Param("whLocArea") WhLocAreaVO whLocArea, 
			@Param("newWhLocArea") String newWhLocArea);

	// 창고 구역 내 위치 삭제
	int deleteWhLocArea(WhLocAreaVO whLocArea);


}
