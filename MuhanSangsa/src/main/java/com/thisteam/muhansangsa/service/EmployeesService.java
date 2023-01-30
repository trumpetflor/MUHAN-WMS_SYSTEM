package com.thisteam.muhansangsa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.EmployeesMapper;
import com.thisteam.muhansangsa.vo.EmployeesVO;

@Service
public class EmployeesService {

	@Autowired
	private EmployeesMapper mapper;
	
	//---------------------------------------------------인사 관리 (사원 등록)--------------------------
	// 사원 등록 비즈니스 로직
	public int registerEmployee(EmployeesVO employee) {
		return mapper.insertEmployee(employee);
	}

	// 사원 번호를 위한 부서코드 추출 
	public String getDepartmentCode(String dept_Cd) {
		return mapper.selectDepartmentCode(dept_Cd);
	}

	// 사원 번호를 위한 idx 추출 
	public String getidx(EmployeesVO employee) {
		return mapper.selectIdx(employee);
	}
	
	//---------------------------------------------------인사 관리 (사원 등록)--------------------------

}















