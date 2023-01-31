package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.DepartmentVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.GradeVO;

public interface EmployeesMapper {

	//---------------------------------------------------인사 관리 (사원 등록)--------------------------
	
	// 사원 등록 비즈니스 로직
	int insertEmployee(EmployeesVO employee);
	
	// 사원 번호를 위한 부서코드 추출 
	String selectDepartmentCode(String dept_Cd);

	// 사원 번호를 위한 idx 추출
	String selectIdx(EmployeesVO employee);

	//---------------------------------------------------인사 관리 (사원 등록)--------------------------

	
	//=============================== 인사관리 : 로그인(세원) =========================================
	// 로그인, 패스워드 확인
	// 파라미터 : 이메일(id 역할)
	String selectPass(String emp_email);
	



	// =============================== hawon ===============================
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













