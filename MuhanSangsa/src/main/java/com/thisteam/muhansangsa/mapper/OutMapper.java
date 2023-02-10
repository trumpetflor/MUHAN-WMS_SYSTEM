package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;
import com.thisteam.muhansangsa.vo.Out_scheduleListVO;

import com.thisteam.muhansangsa.vo.Out_schedule_total_viewVO;
import com.thisteam.muhansangsa.vo.Out_scheduleVO;
import com.thisteam.muhansangsa.vo.Out_schedule_per_productVO;


public interface OutMapper {

	// ======================================== hawon =================================================
	List<Emp_viewVO> selectEmp(String keyword);

	
	List<Stock_viewVO> selectProductStockExist(@Param("keyword") String keyword);
  
  
  int insertRegisterOutSchedule(@Param("out_schedule") Out_scheduleVO out_schedule);


	int insertRegisterOutScheduleProduct(@Param("osp") Out_schedule_per_productVO osp);


	String getMaxOut_schedule_codeIndex(@Param("today")int today);
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


	//출고 예정 목록 중 '종결,취소' 로 상태를 변환하기 위한 JSON 작업
	int outWaitingChangeStatusJson(
			@Param("out_schedule_cd") String out_schedule_cd, 
			@Param("out_complete") String out_complete);

      
      
      


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

	// (1). 출고 수정 정보 상단에 해당하는 정보 조회 (고정된 값)
	List<Out_schedule_total_viewVO> selectOutModifyFixedList(String out_schedule_cd);
	
	// (2). 출고 수정 정보 하단에 해당하는 정보 조회 (수정 가능한 값)
	List<Out_schedule_total_viewVO> selectOutModifyList(String out_schedule_cd);

	// 출고 처리 항목 수정 내용 비즈니스 로직 실행
	void updateOutScheduleModifyPro(
			@Param("total") Out_schedule_total_viewVO total);

	
      
	//==========================================================================23/02/09 미주  
      







}



