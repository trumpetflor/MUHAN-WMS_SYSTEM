package com.thisteam.muhansangsa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.thisteam.muhansangsa.service.MemberService;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Privilege;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@GetMapping(value = "/employees")
	public String emp_view(Model model, HttpSession session){
		
		session.getAttribute("sId");
		String sId = (String)session.getAttribute("sId");
		//TODO: 로그인 기능 완성되면 지울 것
		sId="admin@muhan.com";
		if(sId != null) { 
			//1. 권한 확인
			 Boolean priv = service.getPrivilege(sId, Privilege.사원관리);
		
			//2.
			service.getMemberList();
			
			
			model.addAttribute("sId", sId);
			System.out.println("sId   : "+sId);
			
		}
		
		return "emp_List";
	}
	
	@GetMapping(value = "/employeesUpdate")
	public String emp_update(Model model, HttpSession session){
		
		session.getAttribute("sId");
		
		String sId = (String)session.getAttribute("sId");
		sId="admin@muhan.com";
		if(sId != null) {
		
			 
			 
		}
		
		return "";
	}
	

	
	@PostMapping(value = "/employeesUpdate")
	public String emp_updatePro(Model model, HttpSession session, EmployeesVO employees){
		
		session.getAttribute("sId");
		
		String sId = (String)session.getAttribute("sId");
		if(sId != null) {
			
			
			//1. 권한 확인
				 
			int updateCount  = service.updateMember(employees);
			return "";
			
			 
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
	
	}
	
	//사원 상세조회 뷰페이지
	@GetMapping(value = "/employeesDetail")
	public String emp_detail(Model model, HttpSession session){
		
	
		//조회할 사원을 식별한 이메일
		String emp_email = (String)model.getAttribute("emp_email");
		
		//접속한 사람 세션아이디
		String sId = (String)session.getAttribute("sId");
		
		sId="admin@muhan.com";
		System.out.println("sId   : "+sId);
		
		if(sId != null) {
			
				//1. 권한 확인
				boolean isRightUser = service.getPrivilege(sId,Privilege.사원조회);
			
				if(isRightUser) {//권한이 있을 경우
					
					//2.사원 조회
					EmployeesVO emp = service.getEmployee(emp_email);
					model.addAttribute("emp", emp);
					return "emp_detail";
					
					
				}else {
					model.addAttribute("msg", "권한이 없습니다");
					return "fail_back";
				}

			
		}else {
			
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
	
		}
	}
	
	
}//end of MemberController













