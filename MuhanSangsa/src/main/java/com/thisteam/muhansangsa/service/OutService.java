package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.OutMapper;

import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;
import com.thisteam.muhansangsa.vo.Out_scheduleListVO;
import com.thisteam.muhansangsa.vo.Out_schedule_total_viewVO;
import com.thisteam.muhansangsa.vo.Out_scheduleVO;
import com.thisteam.muhansangsa.vo.Out_schedule_per_productVO;

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
public List<Stock_viewVO> getproduct_stockExist(String keyword) {
	// TODO Auto-generated method stub
	return mapper.selectProductStockExist(keyword);
}

//신규 출고예정 insert작업
public int registerOutSchedule( Out_scheduleVO out_schedule) {
	return mapper.insertRegisterOutSchedule(out_schedule);
	
	//재고리스트에 있는 상품 검색
	public List<Stock_viewVO> getproduct_stockExist() {
		// TODO Auto-generated method stub
		return mapper.selectProductStockExist();
	}





	//==========================================================================23/02/09 미주
	
	// 출고 관리 목록 조회 (출고번호에 해당하는 세부 항목 조회)
	public List<Out_schedule_total_viewVO> getOutTotalScheduleList(
			String searchType, String keyword, int startRow,int listLimit) {
		return mapper.selectOutTotalScheduleList(searchType, keyword, startRow, listLimit);
	}

	// 출고 관리 목록 페이징 처리
	public int getOutTotalScheduleListCount(String searchType, String keyword) {
		return mapper.selectOutTotalScheduleListCount(searchType, keyword);
	}


	// (1). 출고 수정 정보 상단에 해당하는 정보 조회 (고정된 값)
	public List<Out_schedule_total_viewVO> getOutModifyFixedList(String out_schedule_cd) {
		return mapper.selectOutModifyFixedList(out_schedule_cd);
	}
	
	// (2). 출고 수정 정보 하단에 해당하는 정보 조회 (수정 가능한 값)
	public List<Out_schedule_total_viewVO> getOutModifyList(String out_schedule_cd) {
		return mapper.selectOutModifyList(out_schedule_cd);
	}

	// 출고 처리 항목 수정 내용 비즈니스 로직 실행
	public void setOutScheduleModifyPro(Out_schedule_total_viewVO total) {
		mapper.updateOutScheduleModifyPro(total);
	}





//==========================================================================23/02/09 미주








// 신규 출고예정품목 insert작업 
public int registerOutScheduleProduct(Out_schedule_per_productVO ospList) {
	return mapper.insertRegisterOutScheduleProduct(ospList);
	
}

//출고예정코드 생성
public String createOut_schedule_cd(int today) {
	String index = mapper.getMaxOut_schedule_codeIndex(today);
	//생성된 코드
	String createdCode = today+"-"+index;
	
	return createdCode;
}



	
	
	
	
	
	






}















