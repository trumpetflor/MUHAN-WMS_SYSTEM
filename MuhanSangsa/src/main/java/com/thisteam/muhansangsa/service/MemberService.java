package com.thisteam.muhansangsa.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.MemberMapper;
import com.thisteam.muhansangsa.vo.EmployeesVO;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;
	
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

	// 권한 업데이트
	public int getPrivCd(EmployeesVO employee) {
		return mapper.updatePrivCo(employee);
	}


}















