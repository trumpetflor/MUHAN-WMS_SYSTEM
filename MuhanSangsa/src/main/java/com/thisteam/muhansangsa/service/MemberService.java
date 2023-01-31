package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.EmployeesMapper;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Privilege;



@Service
public class MemberService {

	@Autowired
	EmployeesMapper mapper;
	
	//권한 조회 메서드
	public boolean getPrivilege(String sId,Privilege... requiredPermissions) {

		boolean isRightUser = false;
	
		//만약 00111 로 리턴된다면 기본등록, 사원조회, 사원관리 권한 있는 것 !
		String priv_cp = mapper.getPrivilege(sId);
		priv_cp = "00111";
		System.out.println("priv_cp: " + priv_cp);
		//2진수로 저장된 priv_cp를 문자열순서로 변경
		StringBuffer buffer = new StringBuffer(priv_cp);
		priv_cp = buffer.reverse().toString();
		
		
		for(int i = 0; i < requiredPermissions.length; i++) {
			
			isRightUser = (priv_cp.charAt(requiredPermissions[i].getCode()) == '1') ? true : false;
			System.out.println("isRightUser: " + isRightUser);
		}
		
		//최종 사용 가능 여부 리턴
		return isRightUser;
	}
	
	
	//사원 리스트 조회
	public List<Emp_viewVO> getMemberList(String searchType, String keyword) {
		
		return mapper.selectMemberList(searchType,keyword) ;
		
	}
	
	//사원 리스트 조회
	public int updateMember(EmployeesVO emp) {
		
		return mapper.updateMember(emp) ;
	}
	
	
	
	//사원 상세조회
	public Emp_viewVO getEmployee(String emp_email) {
		
		Emp_viewVO emp = mapper.selectEmployee(emp_email);
		
		return emp;
	}

}















