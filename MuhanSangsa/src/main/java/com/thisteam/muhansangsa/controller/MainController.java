package com.thisteam.muhansangsa.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	
	@GetMapping(value = "/About")
	public String about(@RequestParam(defaultValue = "") String msg,
			Model model, HttpSession session) {
		
		// 접속 ip 확인 코드
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		//로그인 id 는 sId = emp_email  
		String id = (String)session.getAttribute("sId");
		model.addAttribute("msg", msg);
		
		// 세션 아이디 
		if(id == null || id.equals("")) { //실패 시
			model.addAttribute("msg", "로그인이 필요한 페이지입니다");
			return "fail_back";
			
		} 
		
		return "about";
		
	}
	
	}//end of MainController
















