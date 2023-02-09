package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;
import com.thisteam.muhansangsa.vo.out_modify_viewVO;
import com.thisteam.muhansangsa.vo.Out_scheduleListVO;
import com.thisteam.muhansangsa.vo.Out_schedule_total_viewVO;

public interface OutMapper {

	// ======================================== hawon =================================================
	List<Emp_viewVO> selectEmp(String keyword);

	
	List<Stock_viewVO> selectProductStockExist();

	// =================================================================================================







	// ======================================== sewon =================================================
	//출고 예정 목록 조회 페이지 조회용(JSON)
	//stats(전체,진행중,완료) 로 상태 구분하기
	List<Out_scheduleListVO> selectOutList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit, 
			@Param("status") int status);





	//==========================================================================23/02/09 미주
	
	// 출고 관리 목록 조회 (출고번호에 해당하는 세부 항목 조회)
	List<Out_schedule_total_viewVO> selectOutTotalScheduleList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	// 출고 관리 목록 페이징 처리
	int selectOutTotalScheduleListCount(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword);

	// 출고 수정을 위한 목록 조회
	List<out_modify_viewVO> selectOutModifyList(String out_schedule_cd);
	
      
	//==========================================================================23/02/09 미주  
      







}



