package com.thisteam.muhansangsa.mapper;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InRegisterTotalVO;
import com.thisteam.muhansangsa.vo.InVO;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.StockHistoryVO;
import com.thisteam.muhansangsa.vo.StockWhVO;
import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.inRegisterVO;

public interface InMapper {
	
	// ======================== yeram ==============================
	// 입고예정 목록
	public List<inProcessingVO> selectInProList();
	
	// 입고처리 폼(입고버튼)
	public List<InRegisterTotalVO> selectInRegisterList(@Param("in_schedule_cd")ArrayList<String> in_schedule_cd,
			@Param("product_name")ArrayList<String> product_name,
			@Param("in_date")ArrayList<String> in_date);
	
	// 입고예정 품목 목록
	public List<inProcessingVO> selectSelectedProList(String in_schedule_cd);
	
	// 입고예정 품목 목록
	public List<InVO> selectSelectedInList(String in_schedule_cd);

	// 재고번호 max 검색
//	public int selectMaxStockCd();

	// 재고 목록
	public List<StockWhVO> selectStockList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit
			);
	
	// 창고선반 목록
	public List<StockWhVO> selectWhLocList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit
			);
	
	// 입고 등록 - 수량, 재고코드
	public void updateinRegister(@Param("inRegister") inRegisterVO inRegister);
	
	// 입고 등록 - 창고선반
	public void updateWhLoc(@Param("inRegister") inRegisterVO inRegister);

	// 미입고 수량 확인
	public int[] selectNoInQty();
	
	// 진행상태 변경
	public void updateInComplete();
	
	// 선반 코드 조회
	public int selectWhLocCd(String wh_loc_in_area);
	
	// 재고번호 신규 생성
	public int insertStockCd(int product_cd, int wh_loc_in_area_cd, int stock_qty);
	
	// 입고 예정 수정 작업
	public int updateInSchedule(@Param("inList") InVO inList);	
	
	// 입고처리품목 수정
	public void updateInProcessing(@Param("inProcessing") inProcessingVO inProcessing);
	
	// 작업자코드 =>InVO
	public String selectInEmpNum(String in_schedule_cd);
	
	// 비고 => inVO
	public String selectInRemarks(String in_schedule_cd);
	
	// 재고 이력 입력
	public int insertHistory(@Param("stock") StockHistoryVO stock);
	
	
	
	// ======================== yeram ==============================
	
	// ======================== sangwoo ============================
	List<ClientVO> getClientList(@Param("keyword") String keyword, @Param("searchType") String searchType);

	List<EmployeesVO> getEmployeeList(@Param("keyword") String keyword, @Param("searchType") String searchType);

	List<InVO> getInList();

	List<ProductVO> getProductList(String businese_no_ajax);


























	



}













