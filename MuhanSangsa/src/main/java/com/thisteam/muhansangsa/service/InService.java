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
import com.thisteam.muhansangsa.vo.InWatingRegister_nomalVO;
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
	// 입고예정목록 조회
	public List<inProcessingVO> getInProList(String searchType, String keyword, int startRow, int listLimit, int status) {
		return mapper.selectInProList(searchType, keyword, startRow, listLimit, status);
	}
	
	// 목록 갯수 계산 (페이징 처리)
	public int getInProListCount(String searchType, String keyword, int status) {
		return mapper.selectInProListCount(searchType, keyword, status);
	}
	
	// 입고처리 폼(입고버튼)
	public List<InRegisterTotalVO> getInRegisterList(ArrayList<String> in_schedule_cd,
			ArrayList<String> product_name,
			ArrayList<String> in_date) {
		return mapper.selectInRegisterList(in_schedule_cd, product_name, in_date);
	}
	
	// 입고예정코드 품목 목록
	public List<inProcessingVO> getSelectedProList(String in_schedule_cd) {
		return mapper.selectSelectedProList(in_schedule_cd);
	}
	
	// 입고예정 관련 목록
	public List<InVO> getSelectedInList(String in_schedule_cd) {
		return mapper.selectSelectedInList(in_schedule_cd);
	}
	
	// 재고번호 max 검색
	public int getMaxStockCd() {
		return mapper.selectMaxStockCd();
	}
	
	// 재고 목록
	public List<StockWhVO> getStockList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectStockList(searchType, keyword, startRow, listLimit);
	}
	
	// 창고선반 목록
	public List<StockWhVO> getWhLocList(String searchType, String keyword) {
		return mapper.selectWhLocList(searchType, keyword);
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
	public int getWhLocCd(String wh_loc) {
		return mapper.selectWhLocCd(wh_loc);
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







