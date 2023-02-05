package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.WhAreaVO;

public interface WhAreaMapper {

	// 창고 구역 목록 조회
	List<WhAreaVO> selectWhAreaList(String wh_cd);

	// 창고 구역 등록
	int insertWhArea(WhAreaVO whArea);

	// 창고 구역 수정
	int updateWhArea(
			@Param("whArea") WhAreaVO whArea, 
			@Param("newWhArea") String newWhArea);

	// 창고 구역 삭제
	int deleteWhArea(WhAreaVO whArea);


	
	
}
