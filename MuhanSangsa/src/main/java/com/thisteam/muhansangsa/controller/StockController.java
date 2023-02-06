package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.service.StockService;
import com.thisteam.muhansangsa.vo.Privilege;
import com.thisteam.muhansangsa.vo.Stock_viewVO;
import com.thisteam.muhansangsa.vo.WarehouseVO;
import com.thisteam.muhansangsa.vo.WhAreaVO;
import com.thisteam.muhansangsa.vo.Wms_wh_viewVO;

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
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
		}else {
			model.addAttribute("msg", "로그인이 필요합니다");
			return "fail_back";
		}
		
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
	
	//재고 조정 페이지
	@GetMapping(value = "/StockAdjustment")
	public String stock_adjustment(int[] stock_cd, Model model,HttpSession session){
		
		
		if(stock_cd == null) {
			model.addAttribute("msg", "잘못된 접근입니다. ");
			return "fail_back";
		}
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		if(session.getAttribute("sId") != null) {
			String sId = (String)session.getAttribute("sId");
				//권한 조회 메서드
				boolean isRightUser = service_emp.getPrivilege(sId,Privilege.창고등록);
				isRightUser = true;//TODO: 로그인되면 지우기
				
				//권한이 존재하면 작업시작
				if(isRightUser) {
						System.out.println("stock :  "+Arrays.toString(stock_cd));
						List<Stock_viewVO> stockList = service.getSelectedStock(stock_cd);
						System.out.println("stockList : "+ stockList);
						
						model.addAttribute("stockList",stockList);
						return "stock/stock_adjustment";
					
				}else {
						model.addAttribute("msg", "잘못된 접근입니다. ");
						return "fail_back";
						
				}
				
		}else {
			model.addAttribute("msg", "로그인이 필요합니다");
			return "fail_back";
		}
		

		
	}
	
	
	
	@ResponseBody
	@GetMapping(value = "/StockAdjust_loc.ajax")
	public void ajax(Stock_viewVO vo, HttpServletResponse response){
		vo.getProduct_cd();
		System.out.println("vo.getProduct_cd(): "+ 	vo.getProduct_cd());
		
		//상품번호(product_cd) 받아와서 재고 테이블에서 검색하는 작업
		 List<Stock_viewVO> productLoc = service.getProductAtSameLoc(vo.getProduct_cd());
		 
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
	
	//새 위치 추가(새 재고번호 생성)
	@GetMapping(value = "/Search_location.ajax")
	public String Search_location(Model model,Stock_viewVO stock,HttpSession session){
		
		if(session.getAttribute("sId") != null) {
			String sId = (String)session.getAttribute("sId");
				//권한 조회 메서드
				boolean isRightUser = service_emp.getPrivilege(sId,Privilege.창고등록);
				isRightUser = true;//TODO: 로그인되면 지우기
				
				//권한이 존재하면 작업시작
				if(isRightUser) {
						System.out.println("product_cd : "+ stock.getProduct_cd());
						
						//새 위치 추가 페이지
						List<WarehouseVO> warehouseList = service.getWarehouseList();
					
						
						
						model.addAttribute("warehouseList", warehouseList);
						model.addAttribute("product_cd", stock.getProduct_cd());
						model.addAttribute("stock_cd", stock.getStock_cd());
						
						System.out.println("warehouseList:" + warehouseList);
	
						
						return "stock/stock_location";
					
				}else {
						model.addAttribute("msg", "잘못된 접근입니다. ");
						return "fail_back";
						
				}
				
		}else {
			model.addAttribute("msg", "로그인이 필요합니다");
			return "fail_back";
		}
		
	}
	
	
	//wh_cd 코드가 있는 창고 내 구역 값 가져오기
	@ResponseBody
	@GetMapping(value = "/searchWarehouseArea.ajax")
	public void searchWarehouseArea(Model model,Wms_wh_viewVO wh_cd,HttpServletResponse response ){
		wh_cd.getWh_cd();
		//창고 내 구역 찾기
		List<WhAreaVO> whAreaList = service.getWarehouseAraList(wh_cd.getWh_cd());
		JSONArray whArea = new JSONArray();
		for(WhAreaVO area : whAreaList ) {
			whArea.put(new JSONObject(area));
		}
		
		System.out.println("JSONArray whArea: "+ whArea);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(whArea); // toString() 생략됨
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//wh_cd 코드가 있는 창고 내 구역 값 가져오기
	@ResponseBody
	@GetMapping(value = "/searchWhAreaLocation.ajax")
	public void searchWhAreaLocation(HttpServletResponse response,Stock_viewVO stock){
		stock.getProduct_cd();
		stock.getWh_area_cd();
//		System.out.println("stock.getProduct_cd():"+stock.getProduct_cd());
//		System.out.println("stock.getWh_area_cd():"+stock.getWh_area_cd());
		
		//이미 선반에 있는 상품코드 제외하고 창고 구역 내 선반 찾기
		List<Wms_wh_viewVO> whAreaLocList = service.getWhAreaLocationList(stock.getProduct_cd(),stock.getWh_area_cd());
		
		//JSONArray데이터로 변환
		JSONArray whLoc = new JSONArray();
		for(Wms_wh_viewVO loc : whAreaLocList ) {
			whLoc.put(new JSONObject(loc));
		}
		
		System.out.println("JSONArray whArea: "+ whLoc);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(whLoc); // toString() 생략됨
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@ResponseBody
	@PostMapping(value = "/addNewLocation_productPro")
	public void addNewLocation_product(HttpServletResponse response,  Stock_viewVO stock){
		
		System.out.println("넘어온값 : "+stock.getProduct_cd()+"/"+stock.getWh_loc_in_area_cd());
		//새 재고번호 생성
		int insertCount = service.InsertNewStockCd(stock.getProduct_cd(),stock.getWh_loc_in_area_cd());
		System.out.println("새 재고번호 생성insertCount: "+insertCount);
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(insertCount); // toString() 생략됨
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//상품 정보와 재고 위치 가져오는 서블릿주소 - stock_list.jsp인데 아직 안함...!(productInfo 함수)
	@ResponseBody
	@GetMapping(value = "/getProduct_StockInfo.ajax")
	public void getProduct_StockInfo(Stock_viewVO vo, HttpServletResponse response){
		vo.getProduct_cd();
		System.out.println("vo.getProduct_cd(): "+ 	vo.getProduct_cd());
		
		//상품번호(product_cd) 받아와서 재고 테이블에서 검색하는 작업
		 List<Stock_viewVO> productLoc = service.getProductAtSameLoc(vo.getProduct_cd());
		 
		 // 
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
