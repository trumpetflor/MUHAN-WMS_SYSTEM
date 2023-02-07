package com.thisteam.muhansangsa.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thisteam.muhansangsa.service.OutService;

@Controller
public class OutController {
	
	@Autowired	
	private OutService service ;
	
	//========================= HAWON ======================================= 
	
	//출고 등록
	@GetMapping(value = "/OutInsertForm")
		public	String outInsertForm(
				@RequestParam(defaultValue = "") String msg,
				Model model) {
		model.addAttribute("msg", msg);
		
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
		
		return "out/out_insertForm";
		
	}	
	
	
	//========================= SEWON ======================================= 
	
	//출고예정목록
	@GetMapping(value = "/OutWaitingSelectList")
		public	String outWaitingSelectList(
				@RequestParam(defaultValue = "") String msg,
				Model model) {
		model.addAttribute("msg", msg);
		
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
		
		return "out/out_waiting_seletList";
		
	}
	
	
	//출고 처리목록
	@GetMapping(value = "/OutProcessingSeletList")
		public	String outProcessingSelectList(
				@RequestParam(defaultValue = "") String msg,
				Model model) {
		model.addAttribute("msg", msg);
		
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
		
		return "out/out_processing_seletList";
		
	}
	
	
	
	
}













