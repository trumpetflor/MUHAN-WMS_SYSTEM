package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thisteam.muhansangsa.service.OutService;
import com.thisteam.muhansangsa.service.ProductService;
import com.thisteam.muhansangsa.vo.Emp_viewVO;

@Controller
public class OutController {
	
	@Autowired	
	private OutService service ;
	
	//========================= SEWON ======================================= out_insertForm
	
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
	
	//==============================================================================================
	//======================================= hawon =================================================
	
	
	@ResponseBody
	@GetMapping(value = "/Search_emp.ajax")
	public void Search_emp(@RequestParam(defaultValue = "") String keyword,
							HttpServletResponse response) {
			
		List<Emp_viewVO> empList =  service.searchEmp(keyword);
		JSONArray empArr = new JSONArray();
		for(Emp_viewVO emp : empList) {
			empArr.put(new JSONObject(emp));
			
		}
	      try {
			      response.setCharacterEncoding("UTF-8");
			      response.getWriter().print(empArr); // toString() 생략됨
			      System.out.println("empList: " + empArr);
		   } catch (IOException e) {
		      e.printStackTrace();
		   }
	
	
	}
}













