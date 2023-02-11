package com.thisteam.muhansangsa.service;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.InMapper;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InRegisterTotalVO;
import com.thisteam.muhansangsa.vo.InVO;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.StockHistoryVO;
import com.thisteam.muhansangsa.vo.StockWhVO;
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
	public List<InRegisterTotalVO> getInRegisterList(ArrayList<String> in_schedule_cd,
			ArrayList<String> product_name,
			ArrayList<String> in_date) {
		return mapper.selectInRegisterList(in_schedule_cd, product_name,in_date);
	}
	
	// 입고예정코드 품목 목록
	public List<inProcessingVO> getSelectedProList(String in_schedule_cd) {
		return mapper.selectSelectedProList(in_schedule_cd);
	}
	
	// 입고예정 관련 목록
	public List<InVO> getSelectedInList(String in_schedule_cd) {
		return mapper.selectSelectedInList(in_schedule_cd);
	}
	
//	// 재고번호 max 검색
//	public int getMaxStockCd() {
//		return mapper.selectMaxStockCd();
//	}
	
	// 재고 목록
	public List<StockWhVO> getStockList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectStockList(searchType, keyword, startRow, listLimit);
	}
	
	// 창고선반 목록
	public List<StockWhVO> getWhLocList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectWhLocList(searchType, keyword, startRow, listLimit);
	}

	// 입고 등록
	public void inRegister(inRegisterVO inRegister) {
		mapper.updateinRegister(inRegister);
		mapper.updateWhLoc(inRegister);
	}
	
	// 미입고 수량 확인
	public int[] getNoInQty() {
		return mapper.selectNoInQty();
	}
	
	// 진행상태 변경
	public void updateInComplete() {
		mapper.updateInComplete();
	}
	
	// 선반코드 조회
	public int getWhLocCd(String wh_loc_in_area) {
		return mapper.selectWhLocCd(wh_loc_in_area);
	}
	
	// 재고코드 신규 생성
	public int insertStockCd(int product_cd, int wh_loc_in_area_cd, int stock_qty) {
		return mapper.insertStockCd(product_cd, wh_loc_in_area_cd, stock_qty);
	}
	
	// 입고 예정 수정 작업
	public int modifyInSchedule(InVO inList) {
		return mapper.updateInSchedule(inList);
	}
	
	// 입고처리품목 수정
	public void modifyInProcessing(inProcessingVO inProcessing) {
		mapper.updateInProcessing(inProcessing);
	}
	
	// 작업자코드 =>InVO
	public String getInEmpNum(String in_schedule_cd) {
		return mapper.selectInEmpNum(in_schedule_cd);
	}
	
	// 비고 => inVO
	public String getInRemarks(String in_schedule_cd) {
		return mapper.selectInRemarks(in_schedule_cd);
	}
	
	// 재고 이력 등록
	public int registerHistory(StockHistoryVO stock) {
		return mapper.insertHistory(stock);
	}
	
	
	// ======================== yeram ==============================
	
	
	
	// ======================== sangwoo ============================
	
	public List<ClientVO> getClientList(String keyword, String searchType) {
		return mapper.getClientList(keyword, searchType);
	}

	public List<EmployeesVO> getEmployeeList(String keyword, String searchType) {
		return mapper.getEmployeeList(keyword, searchType);
	}

	public List<InVO> getInList() {
		return mapper.getInList();
	}
	public List<ProductVO> getProductList(String business_no) {
		return mapper.getProductList(business_no);
	}











	











	// ======================== sangwoo ============================




}







