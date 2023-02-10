package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.OutMapper;

import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;
import com.thisteam.muhansangsa.vo.Out_scheduleListVO;

@Service
public class OutService {
	
	@Autowired
	private OutMapper mapper;


	//============================================== sewon ================================================
	//출고 예정 목록 조회 페이지 조회용(JSON)
	//stats(전체,진행중,완료) 로 상태 구분하기
	public List<Out_scheduleListVO> getOutList(String searchType, String keyword, int startRow, int listLimit, int status) {
		return mapper.selectOutList(searchType, keyword, startRow, listLimit, status);
	}


	//출고 예정 목록 중 '종결,취소' 로 상태를 변환하기 위한 JSON 작업
	public int outWaitingChangeStautsJson(String out_schedule_cd, String out_complete) {
//		System.out.println("out_schedule_cd::::::::::::::::::"+out_schedule_cd);
//		System.out.println("out_complete::::::::::::::::::"+out_complete);
		
		return mapper.outWaitingChangeStatusJson(out_schedule_cd,out_complete);
	}
	

	//=====================================================================================================
  
  
  
  
  
  
  
  
  
  
  
	//==============================================hawon ================================================
	public List<Emp_viewVO> searchEmp(String keyword) {
		// TODO Auto-generated method stub
		return mapper.selectEmp(keyword);
	}
	
	//재고리스트에 있는 상품 검색
	public List<Stock_viewVO> getproduct_stockExist() {
		// TODO Auto-generated method stub
		return mapper.selectProductStockExist();
	}
	
	//=====================================================================================================






}















