package com.thisteam.muhansangsa.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	

}
