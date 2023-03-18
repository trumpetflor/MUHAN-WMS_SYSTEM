package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.WarehouseVO;

public interface WarehouseMapper {
	
	// 창고 등록
	int insertWarehouse(WarehouseVO warehouse);
	
	// 창고 조회
	List<WarehouseVO> selectWarehouseList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit,
			@Param("status") int status);
	
	// 목록 갯수 계산 (페이징 처리)
	int selectWhListCount(
				@Param("searchType") String searchType,
				@Param("keyword") String keyword,
				@Param("status") int status);
	
	// 창고 권한
	String selectWhPrivilege(String sId);
	
	// 창고 상세정보
	WarehouseVO selectWarehouseDetail(String wh_cd);
	
	// 창고 수정
	int updateWarehouse(WarehouseVO warehouse);
	
	// 물류팀 직원 확인
	String selectWarehouseMan(String wh_man_name);
	
	// 창고코드 중복 확인
	String selectWarehouseCode(String wh_cd);
	
	// 창고 코드 갯수 확인
	int selectCodeCount(String keyword);
	
	// 물류팀 직원 목록
	List<String> selectLogiEmployeesList();

}













