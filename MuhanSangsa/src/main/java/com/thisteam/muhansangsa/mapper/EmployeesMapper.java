package com.thisteam.muhansangsa.mapper;

public interface EmployeesMapper {

	
	//=============================== 인사관리 : 로그인(세원) =========================================
	// 로그인, 패스워드 확인
	// 파라미터 : 이메일(id 역할)
	String selectPass(String emp_email);
	
}













