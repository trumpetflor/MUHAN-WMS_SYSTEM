package com.thisteam.muhansangsa.mapper;

import java.util.List;

import com.thisteam.muhansangsa.vo.WarehouseVO;

public interface WarehouseMapper {
	
	// 창고 등록
	int insertWarehouse(WarehouseVO warehouse);
	
	// 창고 조회
	List<WarehouseVO> selectWarehouseList();

}













