package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.OutMapper;
import com.thisteam.muhansangsa.vo.Out_scheduleListVO;

@Service
public class OutService {
	
	@Autowired
	private OutMapper mapper;

	//출고 예정 목록 조회 페이지 조회용(JSON)
	//stats(전체,진행중,완료) 로 상태 구분하기
	public List<Out_scheduleListVO> getOutList(String searchType, String keyword, int startRow, int listLimit, int status) {
		return mapper.selectOutList(searchType, keyword, startRow, listLimit, status);
	}

}















