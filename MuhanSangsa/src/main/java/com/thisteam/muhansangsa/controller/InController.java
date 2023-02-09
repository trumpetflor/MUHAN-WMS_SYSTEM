package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thisteam.muhansangsa.service.InService;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InVO;
import com.thisteam.muhansangsa.vo.StockWhVO;
import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.inRegisterVO;


@Controller
public class InController {
	
	
	@Autowired
	private InService service;
	
	
	// ======================== yeram ==============================
	// 입고예정목록
	@GetMapping(value = "/InProcessing")
	public String processing(Model model) {
		
		List<inProcessingVO> inProList = service.getInProList();
		
		model.addAttribute("inProList", inProList);
		
		return "in/in_processing";
	}
	
	// 입고처리 폼(입고버튼)
	@GetMapping(value = "/InRegister")
	public String register(String[] inRegisterList, Model model, HttpServletResponse response, RedirectAttributes rttr) {
		System.out.println("inRegisterList : " + Arrays.toString(inRegisterList));
		
		ArrayList<String> in_schedule_cd = new ArrayList<String>();
		ArrayList<String> product_name = new ArrayList<String>();
		ArrayList<String> in_date = new ArrayList<String>();
		
		for(int i = 0; i<inRegisterList.length; i++) {
			String a = inRegisterList[i];
			String b = a.split("/")[0];
			String c = a.split("/")[1];
			String d = a.split("/")[2];
			
			in_schedule_cd.add(b);
			product_name.add(c);
			in_date.add(d);
		}
//		System.out.println("in_schedule_cd :" + in_schedule_cd);
//		System.out.println("product_name :" + product_name);
//		System.out.println("in_date :" + in_date);
		
		List<inRegisterVO> resultList = service.getInRegisterList(in_schedule_cd, product_name, in_date);
		
//		System.out.println("add 전 : " + resultList);
		model.addAttribute("resultList", resultList);
		
		return "in/in_register_form";
		
	}
	
	// 입고처리 저장 버튼
	@GetMapping("/InRegisterPro")
	public void registerPro() {
		
	}
	
	// 입고처리 수정 페이지
	@GetMapping("/InProcessingModifyForm")
	public String modify(@RequestParam("in_schedule_cd") String in_schedule_cd,
			Model model) {
		
		// 입고예정 리스트
		List<InVO> inList = service.getSelectedInList(in_schedule_cd);
		
		// 입고품목 리스트
		List<inProcessingVO> proList = service.getSelectedProList(in_schedule_cd);
		
		model.addAttribute("inList", inList);
		model.addAttribute("proList", proList);
		
		return "in/in_processing_modify";
	}
	
	// 재고번호 생성
	@GetMapping(value = "/NewStockCd")
	public void insertStockCd(HttpServletResponse response) {
		
		try {
			int newStockCd = service.getMaxStockCd() + 1;
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(newStockCd);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 재고 조회 페이지
	@GetMapping(value = "/In/StockSelectList")
	public String stockSelectList() {
		return "in/stockList_inPage";
	}
	
	// 재고 목록 조회
	@ResponseBody
	@GetMapping(value = "StockListJsonIn")
	public void stockListJson_in(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum,
			Model model,
			HttpSession session,
			HttpServletResponse response
			) {
		
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		// 거래처 목록 가져오기
		List<StockWhVO> stockList = service.getStockList(searchType, keyword, startRow, listLimit);
		
		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();
		
		for(StockWhVO stock : stockList) {
//			stock.setAddr(stock.getAddr().split("/")[0]); // 도로명 주소만 가져오기
//			stock.setRemarks(stock.getRemarks().replace("\r\n", "<br>")); // 출력 시 줄바꿈 처리
			System.out.println(stock);
			JSONObject jsonObject = new JSONObject(stock);
			System.out.println(jsonObject.get("stock_cd"));
			
			jsonArray.put(jsonObject);
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 선반 조회 페이지
	@GetMapping(value = "/In/WhLocSelectList")
	public String LocSelectList() {
		return "in/whLocList_inPage";
	}
	
	// 선반 목록 조회
	@ResponseBody
	@GetMapping(value = "WhLocListJsonIn")
	public void whLocListJson_in(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum,
			Model model,
			HttpSession session,
			HttpServletResponse response
			) {
		
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		// 선반 목록 가져오기
		List<StockWhVO> whLocList = service.getWhLocList(searchType, keyword, startRow, listLimit);
		
		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();
		
		for(StockWhVO whLoc : whLocList) {
			System.out.println(whLoc);
			JSONObject jsonObject = new JSONObject(whLoc);
			System.out.println(jsonObject.get("wh_area"));
			
			jsonArray.put(jsonObject);
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	// ======================== yeram ==============================
	

	// ======================== sangwoo ============================
	@GetMapping(value = "/InSchedule")
	public String waiting(Model model) {
		List<InVO> inList = service.getInList();
		model.addAttribute("inList", inList);
		return "in/in_waiting_form";
	}
	
	@GetMapping(value = "/InWaitingInsertForm")
	public String waitingInsert(Model model) {
		List<ClientVO> clientList = service.getClientList();
		List<EmployeesVO> employeeList = service.getEmployeeList();
		model.addAttribute("clientList",clientList);
		model.addAttribute("empList", employeeList);
		return "in/in_waiting_insert";
	}
	
	
	
	
	// ======================== sangwoo ============================
  
}
