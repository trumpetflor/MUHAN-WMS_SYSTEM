package com.thisteam.muhansangsa.mapper;

import java.util.List;

import com.thisteam.muhansangsa.vo.WarehouseVO;

public interface WarehouseMapper {
	
	// 창고 등록
	int insertWarehouse(WarehouseVO warehouse);
	
	// 창고 조회
	List<WarehouseVO> selectWarehouseList();
	
	// 창고 권한
	String selectWhPrivilege(String sId);
	
	// 창고 상세정보
	List<WarehouseVO> selectWarehouseDetail(String wh_cd);
	
	// 창고 수정
	int updateWarehouse(WarehouseVO warehouse);
	
	// 물류팀 직원 확인
	String selectWarehouseMan(String wh_man_name);

}













