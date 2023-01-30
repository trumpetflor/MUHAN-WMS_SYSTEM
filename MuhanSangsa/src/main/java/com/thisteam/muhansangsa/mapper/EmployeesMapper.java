package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.DepartmentVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.GradeVO;

public interface EmployeesMapper {

	List<Emp_viewVO> selectMemberList(@Param("searchType") String searchType, 
										@Param("keyword") String keyword);
	   
	//권한 조회
	String getPrivilege(@Param("id")String sId);

	int updateMember(EmployeesVO emp);

	//사원상세조회
	Emp_viewVO selectEmployee(String emp_email);

	//부서조회
	DepartmentVO selectDepartmentName(String dept_cd);
	
	//직급조회
	GradeVO selectGradeName(String grade_cd);



}













