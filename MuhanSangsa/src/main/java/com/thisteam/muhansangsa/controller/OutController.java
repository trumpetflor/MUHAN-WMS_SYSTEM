package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thisteam.muhansangsa.service.OutService;
import com.thisteam.muhansangsa.vo.Out_scheduleListVO;
import com.thisteam.muhansangsa.vo.Out_scheduleVO;
import com.thisteam.muhansangsa.vo.PageInfo;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.Product_group_bottomVO;

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
	
	//출고 예정 목록
	@GetMapping(value = "/OutWaitingSelectList")
	public	String outWaitingSelectList(
			@RequestParam(defaultValue = "") String msg,
			Model model) {
	
	model.addAttribute("msg", msg);
			
	return "out/out_waiting_seletList";
}
	
	//출고 예정 목록 조회 페이지 조회용(JSON)
	//출고 예정목록은 전체, 진행중, 완료 탭으로 구분한다!
	//다만, Mapper를 여러개 사용하지 않기 위해 int status에 -1,0,1이라는 값을 줘서 상태를 구분할꺼다!!!
	@ResponseBody
	@GetMapping(value = "/OutWaitingSelectListJson")
		public	void groupBottomSelectListJson(
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String keyword,
				@RequestParam(defaultValue = "1") int pageNum,
				@RequestParam(defaultValue = "-1") int status,
				Model model,
				HttpSession session,
				HttpServletResponse response) {
		
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		// 출고 예정 목록(전체,진행중,완료) 가져오기
		List<Out_scheduleListVO> outList = service.getOutList(searchType, keyword, startRow, listLimit,status);
		
		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();
		
		for(Out_scheduleListVO out : outList) {
			JSONObject jsonObject = new JSONObject(outList);
			
			jsonArray.put(jsonObject);
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
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













