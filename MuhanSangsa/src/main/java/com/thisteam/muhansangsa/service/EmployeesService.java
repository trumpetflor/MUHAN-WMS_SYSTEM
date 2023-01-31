package com.thisteam.muhansangsa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.EmployeesMapper;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Privilege;


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

	
	//=============================== 인사관리 : 로그인(세원) =========================================
	//로그인, 패스워드 확인 
	// 파라미터 : 이메일(id 역할)
	public String getPass(String emp_email) {
		return mapper.selectPass(emp_email);
	}


	// ================================ hawon ================================
	//---------------------------------------------------------------------------------------------------------------------
	//-------------------------------------------사원조회/상세정보조회 시작------------------------------------------------

	public boolean getPrivilege(String sId,Privilege... requiredPermissions) {

		boolean isRightUser = false;
	
	
		String priv_cp = mapper.getPrivilege(sId);
		priv_cp = "00111";
		System.out.println("priv_cp: " + priv_cp);
		
		StringBuffer buffer = new StringBuffer(priv_cp);
		priv_cp = buffer.reverse().toString();
		
		
		for(int i = 0; i < requiredPermissions.length; i++) {
			
			isRightUser = (priv_cp.charAt(requiredPermissions[i].getCode()) == '1') ? true : false;
			System.out.println("isRightUser: " + isRightUser);
		}
		

		return isRightUser;
	}
	
	

	public List<Emp_viewVO> getMemberList(String searchType, String keyword) {
		
		return mapper.selectMemberList(searchType,keyword) ;
		
	}
	

	public int updateMember(EmployeesVO emp) {
		
		return mapper.updateMember(emp) ;
	}
	

	public Emp_viewVO getEmployee(String emp_email) {
		
		Emp_viewVO emp = mapper.selectEmployee(emp_email);
		
		return emp;
	}
	//-------------------------------------------사원조회/상세정보조회 시작------------------------------------------------
	//---------------------------------------------------------------------------------------------------------------------

	public List<Map<String, String>> getDeptInfo_count(int dept_cd) {
		// TODO Auto-generated method stub
	
		return mapper.selectDeptInfo_count(dept_cd);
	}

	public List<Emp_viewVO> getDeptmemberComposition(int dept_cd) {
		// TODO Auto-generated method stub
		return mapper.selectDeptMember(dept_cd);
	}







}







