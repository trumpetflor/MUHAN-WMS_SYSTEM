package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.inRegisterVO;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InVO;

public interface InMapper {
	
	// ======================== yeram ==============================
	// 입고예정 목록
	List<inProcessingVO> selectInProList();
	
	// 입고처리 폼
	List<inRegisterVO> selectInRegisterList(@Param("in_schedule_cd")String[] in_schedule_cd);
	
	// ======================== yeram ==============================
	
	
	List<ClientVO> getClientList();

	List<EmployeesVO> getEmployeeList();

	List<InVO> getInList();



	



}













