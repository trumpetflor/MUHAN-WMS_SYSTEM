package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.EmployeesVO;

public interface EmployeesMapper {

	List selectMemberList();
	
	//권한 조회
	String getPrivilege(@Param("id")String sId);

	int updateMember(EmployeesVO emp);

	//사원상세조회
	EmployeesVO selectEmployee(String emp_email);



}













