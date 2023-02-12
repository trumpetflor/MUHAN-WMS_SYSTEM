package com.thisteam.muhansangsa.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.InMapper;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InVO;
import com.thisteam.muhansangsa.vo.InWatingRegister_nomalVO;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.inRegisterVO;




@Service
public class InService {

	@Autowired
	private InMapper mapper;
	
	// ======================== yeram ==============================
	// 입고예정목록
	public List<inProcessingVO> getInProList() {
		return mapper.selectInProList();
	}
	
	// 입고처리 폼(입고버튼)
	public List<inRegisterVO> getInRegisterList(ArrayList<String> in_schedule_cd,
			ArrayList<String> product_name,
			ArrayList<String> in_date) {
		return mapper.selectInRegisterList(in_schedule_cd, product_name,in_date);
	}
	
	
	
	
	
	
	// ======================== yeram ==============================
	
	
	
	// ======================== sangwoo ============================
	
	// 거래처 리스트 구하기
	public List<ClientVO> getClientList(String keyword, String searchType) {
		return mapper.getClientList(keyword, searchType);
	}
	
	// 담당자 리스트 구하기
	public List<EmployeesVO> getEmployeeList(String keyword, String searchType) {
		return mapper.getEmployeeList(keyword, searchType);
	}
	
	// 
	public List<InVO> getInList() {
		return mapper.getInList();
	}
	
	// 품목 리스트 구하기
	public List<ProductVO> getProductList(String business_no) {
		return mapper.getProductList(business_no);
	}
	
	// 입고예정번호에 쓰일 마지막 인덱스번호 구하러 가기
	public String getLastNum() {
		return mapper.getLastNum();
	}

	public int insertRegister(InWatingRegister_nomalVO nomalVO) {
		return 0;
	}
	
	// 입고예정번호 인덱스번호 추출
	public String createIn_schedule_cd(int today) {
		String index = mapper.in_schedule_cd_Index(today);
		
		String indexCode = today + "-" + index;
		return indexCode;
	}

	public int registInScheduleTop(InWatingRegister_nomalVO in_schedule) {
		return mapper.registInScheduleTop(in_schedule);
	}

	public int registInScheduleBottom(InVO isp) {
		return mapper.registInScheduleBottom(isp);
	}

	public List<InVO> getInSchedultList(String searchType, String keyword, int startRow, int listLimit, int status) {
		return mapper.selectInScheduleList(searchType, keyword, startRow, listLimit, status);
	}

	public int inWaitingChangeStautsJson(String in_schedule_cd, String in_complete) {
		return mapper.inWaitingChangeStautsJson(in_schedule_cd, in_complete);
	}

	public List<inProcessingVO> getProQtyList(String in_schedule_cd) {
		return mapper.getProQtyList(in_schedule_cd);
	}



	// ======================== sangwoo ============================



}







