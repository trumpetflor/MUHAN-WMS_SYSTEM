package com.thisteam.muhansangsa.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Privilege;

@Controller
public class EmployeesController {
	
	@Autowired
	EmployeesService service;
	
	@GetMapping(value = "/employees")
	public String emp_view(@RequestParam(defaultValue = "") String searchType,
							@RequestParam(defaultValue = "") String keyword,
							Model model, HttpSession session){
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		session.getAttribute("sId");
		String sId = (String)session.getAttribute("sId");
		
//		sId="admin@muhan.com";
		if(sId != null) { 

			//권한 조회 메서드
			boolean isRightUser = service.getPrivilege(sId,Privilege.사원관리);
			isRightUser = true;//TODO:
			if(isRightUser) {
				
				//권한 있을 시에 조회 수행
				List<Emp_viewVO> empList= service.getMemberList(searchType,keyword);
				model.addAttribute("empList", empList);
			}
		
			System.out.println("sId   : "+sId);
			
		}else {
			model.addAttribute("msg", "권한이 없습니다");
			return "fail_back";
		}
		
		return "emp_List";
	}
	
	@GetMapping(value = "/employees_search")
	public String emp_view_sch( @RequestParam(defaultValue = "") String searchType,
							@RequestParam(defaultValue = "") String keyword,
							Model model, HttpSession session){
	
		String ip;
		try {
			InetAddress local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		
		session.getAttribute("sId");
		String sId = (String)session.getAttribute("sId");

		sId="admin@muhan.com";
		if(sId != null) { 
			//권한 조회 메서드
			boolean isRightUser = service.getPrivilege(sId,Privilege.사원관리);
			isRightUser = true;//TODO:
			if(isRightUser) {
				
				//권한 있을 시에 조회 수행
				List<Emp_viewVO> empList= service.getMemberList(searchType,keyword);
				model.addAttribute("empList", empList);
			}
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
			
			
			//1.수정
				 
			int updateCount  = service.updateMember(employees);
			return "";
			
			 
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
	
	}
	
	//상세조회
	@GetMapping(value = "/employeesDetail")
	public String emp_detail(Model model, HttpSession session){
		
		String ip;
		
		try {
			InetAddress local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		//접속자 아이디
		String emp_email = (String)model.getAttribute("emp_email");
		
		//세션아이디
		String sId = (String)session.getAttribute("sId");
		
//		sId="admin@muhan.com";
		System.out.println("sId   : "+sId);
		
		if(sId != null) {
			
				//1.권한 조회 
				boolean isRightUser = service.getPrivilege(sId,Privilege.사원관리);
				isRightUser = true;//TODO:
				if(isRightUser) {
					
					//2. 권한 있을 시에 조회 수행
					Emp_viewVO emp= service.getEmployee(emp_email);
					model.addAttribute("emp", emp);
					return "emp_detail";
				}else {
					model.addAttribute("msg", "잘못된 접근입니다");
					return "fail_back";
				
				}
					
					
			}else {
				model.addAttribute("msg", "잘못된 접근입니다");
				return "fail_back";
			}
			
		
		
	}
	
	
}//end of MemberController













