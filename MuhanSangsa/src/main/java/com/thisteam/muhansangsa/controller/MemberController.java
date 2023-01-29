package com.thisteam.muhansangsa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.thisteam.muhansangsa.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 페이지
	@GetMapping(value = "/Login.do")
	public String login() {
		return "member/login"; // login.jsp 로 포워딩
	}
	
	//사원 목록페이지 (테스트용)
	// - 상세정보 페이지 접속차
	@GetMapping(value = "/memberList.do")
	public String selectMemberList() {
		return "member/list"; // login.jsp 로 포워딩
	}
	
	//마이페이지
	@GetMapping(value = "/Mypage.do")
	public String insert() {
		return "member/myPage";
	}

	//사원 상세페이지 리스트
	@GetMapping(value = "/memberListDetail.do")
	public String memberListDetail() {
		return "member/memberDetail";
	}	

	//사원 상세정보 수정페이지
	@GetMapping(value = "/memberListDetailModify.do")
	public String memberListDetailModify() {
		return "member/memberModify";
	}	
}













