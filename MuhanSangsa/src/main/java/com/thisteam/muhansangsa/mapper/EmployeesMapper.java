package com.thisteam.muhansangsa.mapper;

import com.thisteam.muhansangsa.vo.EmployeesVO;

public interface EmployeesMapper {

	//---------------------------------------------------인사 관리 (사원 등록)--------------------------
	
	// 사원 등록 비즈니스 로직
	int insertEmployee(EmployeesVO employee);
	
	// 사원 번호를 위한 부서코드 추출 
	String selectDepartmentCode(String dept_Cd);

	// 사원 번호를 위한 idx 추출
	String selectIdx(EmployeesVO employee);

	//---------------------------------------------------인사 관리 (사원 등록)--------------------------

}













