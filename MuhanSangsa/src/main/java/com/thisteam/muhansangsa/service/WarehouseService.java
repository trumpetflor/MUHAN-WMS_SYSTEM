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
	public List<WarehouseVO> getWarehouseList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectWarehouseList(searchType, keyword, startRow, listLimit);
	}
	
	// 목록 갯수 계산 (페이징 처리)
	public int getWhListCount(String searchType, String keyword) {
		return mapper.selectWhListCount(searchType, keyword);
	}
	
	// 창고 권한
	public String getWhPrivilege(String sId) {
		return mapper.selectWhPrivilege(sId);
	}
	
	// 창고 상세정보
	public WarehouseVO getWarehouseDetail(String wh_cd) {
		return mapper.selectWarehouseDetail(wh_cd);
	}
	
	// 창고 수정
	public int modifyWarehouse(WarehouseVO warehouse) {
		return mapper.updateWarehouse(warehouse);
	}
	
	// 물류팀 직원 확인
	public Boolean WarehouseCheckMan(String wh_man_name) {
		Boolean isChecked = false;
		
		String checkMan = mapper.selectWarehouseMan(wh_man_name);
		if(checkMan == null || checkMan.equals("")) {
			isChecked = false;
		} else {
			isChecked = true;
		}
		
		return isChecked;
		
	}

	// 창고 코드 중복 확인
	public Boolean WarehouseCheckCode(String wh_cd) {
		Boolean isChecked = false;
		
		String checkCode = mapper.selectWarehouseCode(wh_cd);
		if(checkCode == null || checkCode.equals("")) { // 중복 아님
			isChecked = false;
		} else { // 중복임
			isChecked = true;
		}
		
		return isChecked;
	}
	
	// 창고 코드 갯수
	public int getCodeCount(String keyword) {
		return mapper.selectCodeCount(keyword)+1;
	}
	
	// 물류팀 직원 목록
	public List<String> getLogiEmployeesList() {
		return mapper.selectLogiEmployeesList();
	}

}















