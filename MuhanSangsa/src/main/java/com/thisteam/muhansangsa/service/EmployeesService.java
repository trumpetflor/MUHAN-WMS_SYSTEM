package com.thisteam.muhansangsa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.EmployeesMapper;

@Service
public class EmployeesService {

	@Autowired
	private EmployeesMapper mapper;
	
	
	//=============================== 인사관리 : 로그인(세원) =========================================
	//로그인, 패스워드 확인 
	// 파라미터 : 이메일(id 역할)
	public String getPass(String emp_email) {
		return mapper.selectPass(emp_email);
	}

}
















