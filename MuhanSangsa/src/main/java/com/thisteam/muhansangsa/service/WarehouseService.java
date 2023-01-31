package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.WarehouseMapper;
import com.thisteam.muhansangsa.vo.WarehouseVO;

@Service
public class WarehouseService {
	
	@Autowired
	private WarehouseMapper mapper;
	
	// 창고 등록
	public int registerWarehouse(WarehouseVO warehouse) {
		return mapper.insertWarehouse(warehouse);
	}
	
	// 창고 조회
	public List<WarehouseVO> getWarehouseList() {
		return mapper.selectWarehouseList();
	}

}















