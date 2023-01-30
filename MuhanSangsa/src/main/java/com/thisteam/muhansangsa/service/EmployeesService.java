package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.EmployeesMapper;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Privilege;



@Service
public class EmployeesService {

	@Autowired
	EmployeesMapper mapper;
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
}















