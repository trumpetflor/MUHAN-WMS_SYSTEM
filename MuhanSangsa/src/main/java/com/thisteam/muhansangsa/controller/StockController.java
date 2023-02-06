package com.thisteam.muhansangsa.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.service.StockService;
import com.thisteam.muhansangsa.vo.Privilege;
import com.thisteam.muhansangsa.vo.StockHistoryVO;
import com.thisteam.muhansangsa.vo.StockHistoryViewVO;
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
	
	// 재고 조정 페이지
   @GetMapping(value = "/StockAdjustment")
   public String stock_adjustment(){
      
      return "stock/stock_adjustment";
      
   }
   
   // 재고 조정 페이지 비즈니스 로직
   @PostMapping(value = "/StockModifyPro")
   public String stockModifyPro(Model model, HttpSession session,
		   @ModelAttribute StockHistoryVO stockHistory, 
		   @RequestParam("stock_cd") int stock_cd, 
		   @RequestParam("qty") String StockQty,
		   @RequestParam("MVStockQty") String MVStockQty,
		   @RequestParam("RemoveStockQty") String RemoveStockQty,
		   @RequestParam("TotalStockQty") String TotalQty) {
	   
	   int TotalStockQty = Integer.parseInt(TotalQty);
	   int mvStockQty = Integer.parseInt(MVStockQty);
	   int rmStockQty = Integer.parseInt(RemoveStockQty);
	   
	   // jquery 성공 시 주석 처리
//	   int qty = (TotalStockQty2 - mvStockQty - mvStockQty);
	   System.out.println("합계 잘 넘어오니" + TotalQty);
	   System.out.println("정보 잘 넘어오니" + stockHistory);
	   System.out.println("조정 수량 잘 넘어 오니" + RemoveStockQty);
	   System.out.println("이동 수량 잘 넘어 오니" + MVStockQty);
	   
	   // 1. emp_num, source_stock_cd 데이터 넣기
	   // 권한 작업 이후 주석 처리 해제할 것 (sId)
//	   String sId = (String)session.getAttribute("sId");
	   String sId = "admin@muhan.com";
	   String emp_num = service.getEmpNum(sId);
	   stockHistory.setEmp_num(emp_num);
	   System.out.println("조회 잘되었니 emp_num = " + emp_num);
	   stockHistory.setSource_stock_cd(stockHistory.getStock_cd()); // 보내는 재고번호 = 재고번호
	   stockHistory.setTarget_stock_cd(mvStockQty);
	   stockHistory.setQty(TotalStockQty); // 합계수량 처리
	   
	   // 2. 조정수량 & 이동수량 입력으로 해당 재고수량 강제 변경
	   // jquery로 합계 계산 완료 시 파라미터 qty로 변경해야함(진행 중)
	   int updateCount = service.setStockQty(stock_cd, TotalStockQty);
	   if(updateCount > 0) {
		  System.out.println("수량 업데이트 성공!"); 
		  // 3. 재고 이력 페이지를 위한 stockHistoryVO 타입 리스트 생성 
		   List<StockHistoryVO> stockHistroyList = service.setStockHistory(stockHistory);
		   model.addAttribute("stockHistoryList", stockHistroyList);
		   return "Inventory_History_View";
		  
	   } else {
		   
	   }
	   
	   // 3. 이동, 조정, 입고, 출고 여부 판별하여 stock_history에 insert
	   String stock_control_type = stockHistory.getStock_control_type_cd();
	   System.out.println("타입 잘 넘어오는지" + stock_control_type);
	   
	   return "Inventory_History_View";
   }
   
   
	
	// 재고 이력 페이지
	@GetMapping("/Inventory_History_View")
	public String inventoryHistoryView(Model model,  HttpSession session,
			@RequestParam("stock_cd") int stock_cd ) {
//		int stock_cd = 2000;
		
		// 1. 재고 이력 권한 조회 판별
		
		
		// 3. 재고 이력 조회 리스트 생성
		// 파라미터 : 재고번호,  리턴타입 : 리스트(StockVo)
		
		
		List<StockHistoryViewVO> stockHistoryList = service.getStockHistoryList(stock_cd);
		model.addAttribute("stockHistoryList", stockHistoryList);
		
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
		
		return "stock/stock_history_list";
	}
	
}
