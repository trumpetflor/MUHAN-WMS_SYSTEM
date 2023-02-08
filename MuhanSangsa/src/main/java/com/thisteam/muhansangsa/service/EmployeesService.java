package com.thisteam.muhansangsa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.EmployeesMapper;
import com.thisteam.muhansangsa.vo.DepartmentVO;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Privilege;
import com.thisteam.muhansangsa.vo.WorksVO;


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

	
	//=============================== sewon=========================================
	// ----------------------------로그인----------------------------------- 
	//로그인, 패스워드 확인 
	// 파라미터 : 이메일(id 역할)
	public String getPass(String emp_email) {
		return mapper.selectPass(emp_email);
	}

	
	//----------------------------마이페이지----------------------------------- 

	
	//마이페이지 뿌리기
	public EmployeesVO getMypageInfo(String id) {
		return mapper.selectMypageInfo(id);
	}

	
	
	//수정
	public int updateMypageMember(EmployeesVO employees) {
		
		return mapper.updateMypageMember(employees) ;
	}

	//------------------사원 상세조회------------------------------------

	//상세조회 수정(update)
	public int updateDetailEmp(EmployeesVO employees) {
		return mapper.updateDetail(employees);
	}



	   // ================================ hawon ================================
	   //---------------------------------------------------------------------------------------------------------------------
	   //-------------------------------------------사원조회/상세정보조회 시작------------------------------------------------

	   public boolean getPrivilege(String sId,Privilege... requiredPermissions) {

	      boolean isRightUser = false;
	   
	      
	      String priv_cp = mapper.getPrivilege(sId);
	      System.out.println("sId: " + sId);
	      System.out.println("priv_cp: " + priv_cp);

	      
	      //2진수인 priv_cp의 순서 reverse
//	      StringBuffer buffer = new StringBuffer(priv_cp);
//	      priv_cp = buffer.reverse().toString();
	      
	      
	      for(int i = 0; i < requiredPermissions.length; i++) {
	         isRightUser = (priv_cp.charAt(requiredPermissions[i].getCode()) == '1') ? true : false;
	         isRightUser = (priv_cp.charAt(requiredPermissions[i].getCode()) == '1') ? true : false;
//	         System.out.println("getCode :  "+requiredPermissions[i].getCode());
	    
	      }
	      

	      return isRightUser;
	   }
	   
	   

	   public List<Emp_viewVO> getMemberList(String searchType, String keyword,int startRow, int listLimit) {
	      
	      return mapper.selectMemberList(searchType,keyword,startRow,listLimit) ;
	      
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
	   //부서 및 재직상태 변경을 위한 테이블 컬럼 가져오기
	   public List<DepartmentVO> getdeptList() {
	      
	      return mapper.selectDeptList();
	   }

	   public List<WorksVO> getworkList() {
	      
	      return  mapper.selectWorkList();
	   }











	}





















