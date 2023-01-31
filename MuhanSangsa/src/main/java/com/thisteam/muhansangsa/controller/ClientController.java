package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thisteam.muhansangsa.service.ClientService;
import com.thisteam.muhansangsa.vo.ClientVO;

@Controller
public class ClientController {
	
	@Autowired
	private ClientService service;
	
	@GetMapping(value = "ClientList")
	public String clientList() {
		return "client/client_list";
	}
	
	// 거래처 목록 조회
	@ResponseBody
	@GetMapping(value = "ClientListJson")
	public void clientListJson(
			Model model,
			HttpSession session,
			HttpServletResponse response
			) {
		
		// 거래처 목록 가져오기
		List<ClientVO> clientList = service.getClientList();
		
		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();
		
		for(ClientVO client : clientList) {
			client.setAddr(client.getAddr().split("/")[0]);
			System.out.println(client);
			JSONObject jsonObject = new JSONObject(client);
			System.out.println(jsonObject.get("business_no"));
			
			jsonArray.put(jsonObject);
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 거래처 등록 폼
	@GetMapping(value = "ClientInsertForm")
	public String clientInsert(
			Model model,
			HttpSession session
			) {
		
		return "client/client_insert_form";
	}
	
	// 거래처 등록 프로
	@PostMapping(value = "ClientInsertPro")
	public String clientInsertPro(
			@ModelAttribute ClientVO client,
			Model model,
			HttpSession session
			) {
		
		// 업태 및 종목을 / 로 구분
		client.setUptae(client.getUptae().replaceAll(",", "/"));
		client.setJongmok(client.getJongmok().replaceAll(",", "/"));
		
		System.out.println(client);
		
		int insertCount = service.insertClient(client);
		
		if(insertCount > 0) { // 등록 성공 시
			return "redirect:ClientList";
		} else { // 등록 실패 시
			model.addAttribute("msg", "거래처 등록 실패");
			return "fail_back";
		}
		
	}
	
}













