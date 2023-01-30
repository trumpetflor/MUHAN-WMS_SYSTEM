package com.thisteam.muhansangsa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.thisteam.muhansangsa.service.ClientService;

@Controller
public class ClientController {
	
	@Autowired
	private ClientService service;
	
	// 거래처 목록 조회
	@GetMapping(value = "ClientList")
	public String clientList(
			Model model,
			HttpSession session
			) {
		
		
		
		return "client/client_list";
	}
	
	// 거래처 등록 폼
	@GetMapping(value = "ClientInsertForm")
	public String clientInsert(
			Model model,
			HttpSession session
			) {
		
		return "client/client_insert_form";
	}
	
}













