package com.thisteam.muhansangsa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.vo.EmployeesVO;

@Controller
public class EmployeesController {
	
	@Autowired
	private EmployeesService service;
	
	
	//=============================== 인사관리 : 로그인(세원) =========================================
	// 로그인 페이지
	@GetMapping(value = "/Login")
	public String login() {
		return "member/login"; // login.jsp 로 포워딩
	}
	
	// 로그인 비즈니스 로직 작업
	@PostMapping(value = "/Login")
	public String loginPro(
			@ModelAttribute EmployeesVO employee, 
			Model model, 
			HttpSession session) {
		
		// 비밀번호 암호화 !!DB에 비밀번호 재설정 필요(해싱, 솔팅 다름)!!
		// 파라미터 : 이메일(id 역할)
		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder(); // 객체 생성
		String pass = service.getPass(employee.getEmp_email()); //email(id) 에 해당하는 암호화 비밀번호 가져오기
		System.out.println(pass);
		
		//암호화 비밀번호 비교
		if(pass == null || passwdEncoder.matches(employee.getEmp_passwd(), pass)) { // 실패(id 에 해당하는 pass 없거나 pass 맞지 X)
			model.addAttribute("msg", "아이디 혹은 비밀번호가 틀렸습니다");
			return "fail_back";
			
		} else { // 성공 시
			session.setAttribute("sId", employee.getEmp_email());//세션 아이디 저장
			System.out.println("sId");
			return "redirect:/"; // 메인페이지로 리다이렉트
		}
		
	}
	//=============================== 인사관리 : 로그아웃(세원) =========================================
	
	@GetMapping(value = "/Logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return "redirect:/";
	}
	
	//=============================== 인사관리 : 마이페이지(세원) =========================================
	
	//사원 목록페이지 (테스트용)
	// - 상세정보 페이지 접속차
	@GetMapping(value = "/memberList")
	public String selectMemberList() {
		return "member/list"; // login.jsp 로 포워딩
	}
	
	//마이페이지
	@GetMapping(value = "/Mypage")
	public String insert() {
		return "member/myPage";
	}

	//=============================== 인사관리 : 사원 상세페이지 (세원) =========================================
	
	//사원 상세페이지 리스트
	@GetMapping(value = "/memberListDetail")
	public String memberListDetail() {
		return "member/memberDetail";
	}	

	//사원 상세정보 수정페이지
	@GetMapping(value = "/memberListDetailModify")
	public String memberListDetailModify() {
		return "member/memberModify";
	}	
	
	
}













