package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;

import com.thisteam.muhansangsa.vo.Out_scheduleListVO;
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

      
      
      

	// =================================================================================================






}



