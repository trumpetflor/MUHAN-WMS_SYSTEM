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

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.service.StockService;
import com.thisteam.muhansangsa.vo.Privilege;
import com.thisteam.muhansangsa.vo.Stock_viewVO;

@Controller
public class StockController {

	@Autowired
	private StockService service;
	
	@Autowired
	private EmployeesService service_emp;
	
	
	
	@GetMapping(value = "/Inventory_View")
	public String inventoryView(@RequestParam(defaultValue = "") String searchType,
								@RequestParam(defaultValue = "") String keyword,
								@RequestParam(defaultValue = "1") int pageNum,
								Model model, HttpSession session){
		String sId;
		sId="admin@muhan.com";
//		if(session.getAttribute("sId") != null) {
//			sId = (String)session.getAttribute("sId");
//		}else {
//			model.addAttribute("msg", "로그인이 필요합니다");
//			return "fail_back";
//		}
		
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산

			//권한 조회 메서드
			boolean isRightUser = service_emp.getPrivilege(sId,Privilege.재고조회);
			isRightUser = true;//TODO: 로그인되면 지우기
			
			if(isRightUser) {
				List<Stock_viewVO> stockList = service.getStockList(searchType, keyword, startRow, listLimit);
				model.addAttribute("stockList", stockList);
				System.out.println("stockList: "+ stockList);
				return "stock/stock_list";
			}else {
				model.addAttribute("msg", "잘못된 접근입니다. ");
				return "fail_back";
			
			}
		
	}
	
	@GetMapping(value = "/InventoryHistory")
	public String inventoryView(){
		return "stock/stock_code_history";
				
	}
	
	
	@GetMapping(value = "/StockAdjustment")
	public String stock_adjustment(){
		
		return "stock/stock_adjustment";
		
	}
	
	@ResponseBody
	@GetMapping(value = "/StockAdjust_loc.ajax")
	public void ajax(Stock_viewVO vo, HttpServletResponse response){
		vo.getProduct_cd();
		String product_cd = "1000";
		//상품번호(product_cd) 받아와서 재고 테이블에서 검색하는 작업
		 List<Stock_viewVO> productLoc = service.getProductAtSameLoc(product_cd);
		 
		//Restful한 방식으로 클라이언트로 전송하기 위해 JSON데이터로 변환
		JSONArray arr = new JSONArray();
		for( Stock_viewVO stock : productLoc) {
			arr.put(new JSONObject(stock));
		}
		
		System.out.println("JSONArray : " + arr);
	
		
	
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(arr); // toString() 생략됨
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
