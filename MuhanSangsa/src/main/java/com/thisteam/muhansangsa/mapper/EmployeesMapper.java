package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.DepartmentVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.GradeVO;

public interface EmployeesMapper {

	
	//---------------------------------------------------------------------------------------------------------------------
	//-------------------------------------------사원조회/상세정보조회 시작------------------------------------------------
	List<Emp_viewVO> selectMemberList(@Param("searchType") String searchType, 
										@Param("keyword") String keyword);
	   
	//권한 조회
	String getPrivilege(@Param("id")String sId);

	int updateMember(EmployeesVO emp);

	//사원 상세조회
	Emp_viewVO selectEmployee(String emp_email);

	//-------------------------------------------사원조회/상세정보조회 끝------------------------------------------------
	//---------------------------------------------------------------------------------------------------------------------



}













