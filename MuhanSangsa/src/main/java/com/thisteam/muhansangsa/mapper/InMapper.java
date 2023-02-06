package com.thisteam.muhansangsa.mapper;

import java.util.List;

import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InVO;

public interface InMapper {
	
	// 입고처리 목록
	List<inProcessingVO> selectInProList();

	List<ClientVO> getClientList();

	List<EmployeesVO> getEmployeeList();

	List<InVO> getInList();

	



}













