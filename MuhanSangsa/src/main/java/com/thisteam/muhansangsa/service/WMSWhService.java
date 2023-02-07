package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.WhAreaMapper;
import com.thisteam.muhansangsa.mapper.WhLocAreaMapper;
import com.thisteam.muhansangsa.mapper.WmsWhViewMapper;
import com.thisteam.muhansangsa.vo.WhAreaVO;
import com.thisteam.muhansangsa.vo.WhLocAreaVO;
import com.thisteam.muhansangsa.vo.Wms_wh_viewVO;

@Service
public class WMSWhService {

	@Autowired
	WmsWhViewMapper whViewMapper;
	@Autowired
	WhAreaMapper areaMapper;
	@Autowired
	WhLocAreaMapper locMapper;
	
	// 창고 구역 가져오기
	public List<WhAreaVO> getWhAreaList(String whCd) {
		return areaMapper.selectWhAreaList(whCd);
	}
	
	// 창고 구역 내 위치 가져오기
	public List<WhLocAreaVO> getWhLocAreaList(int wh_area_cd) {
		return locMapper.selectWhLocAreaList(wh_area_cd);
	}

	// Wms_wh_view 목록 가져오기
	public List<Wms_wh_viewVO> getWhViewList() {
		return whViewMapper.selectWhViewList();
	}

	// 창고 구역 등록
	public int registWhArea(WhAreaVO whArea) {
		return areaMapper.insertWhArea(whArea);
	}

	// 창고 구역 내 위치 등록
	public int registWhLocArea(WhLocAreaVO whLocArea) {
		return locMapper.insertWhLocArea(whLocArea);
	}

	// 창고 구역 수정
	public int modifyWhArea(WhAreaVO whArea, String newWhArea) {
		return areaMapper.updateWhArea(whArea, newWhArea);
	}

	// 창고 구역 내 위치 수정
	public int modifyWhLocArea(WhLocAreaVO whLocArea, String newWhLocArea) {
		return locMapper.updateWhLocArea(whLocArea, newWhLocArea);
	}

	// 창고 구역 삭제
	public int deleteWhArea(int whAreaCd) {
		return areaMapper.deleteWhArea(whAreaCd);
	}

	// 창고 구역 내 위치 삭제
	public int deleteWhLocArea(int whLocArea) {
		return locMapper.deleteWhLocArea(whLocArea);
	}
	
	
}
