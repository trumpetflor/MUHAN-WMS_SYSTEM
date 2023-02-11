package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thisteam.muhansangsa.service.InService;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InRegisterTotalVO;
import com.thisteam.muhansangsa.vo.InVO;
import com.thisteam.muhansangsa.vo.InWatingRegisterVO;
import com.thisteam.muhansangsa.vo.InWatingRegister_nomalVO;
import com.thisteam.muhansangsa.vo.Out_scheduleVO;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.StockHistoryVO;
import com.thisteam.muhansangsa.vo.StockWhVO;
import com.thisteam.muhansangsa.vo.inProcessingArrVO;
import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.inRegisterArrVO;
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
	public String register(String[] inRegisterList, Model model, HttpServletResponse response) {
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
		
		List<InRegisterTotalVO> resultList = service.getInRegisterList(in_schedule_cd, product_name, in_date);
		
//		System.out.println("add 전 : " + resultList);
		model.addAttribute("resultList", resultList);
		
		return "in/in_register_form";
		
	}
	
	// 입고처리 저장 버튼
	@PostMapping("/InRegisterPro")
	public void registerPro(@ModelAttribute inRegisterArrVO voArr,
							Model model,
							HttpServletResponse response
							) {
		System.out.println(voArr);
		try {
			int insertStockHistory = 0;
			for(int i = 0; i < voArr.getIn_schedule_cd().length; i ++) {
				inRegisterVO inRegister = new inRegisterVO();
				inRegister.setIn_schedule_cd(voArr.getIn_schedule_cd()[i]);
				inRegister.setProduct_cd(voArr.getProduct_cd()[i]);
//				vo.setProduct_name(voArr.getProduct_name()[i]);
				inRegister.setIn_qty(voArr.getIn_qty()[i]);
				inRegister.setIn_date(voArr.getIn_date()[i]);
				System.out.println(voArr.getStock_cd()[i]);
				System.out.println(voArr.getIn_date()[i]);
				int stock_cd = voArr.getStock_cd()[i];
				//선반명 분리
				String whLoc = voArr.getWh_loc_in_area()[i];
				String wh_loc_in_area = whLoc.split("_")[1];
				System.out.println("선반명 : " + wh_loc_in_area);
				inRegister.setWh_loc_in_area(wh_loc_in_area);
				// 재고테이블에 신규 재고번호생성
				if(stock_cd == 0) {
					int product_cd = inRegister.getProduct_cd();
					int wh_loc_in_area_cd = service.getWhLocCd(inRegister.getWh_loc_in_area());
					int stock_qty = inRegister.getIn_qty();
					
					int newStockcd = service.insertStockCd(product_cd, wh_loc_in_area_cd, stock_qty);
					inRegister.setStock_cd(newStockcd);
				} else {
					inRegister.setStock_cd(voArr.getStock_cd()[i]);
				}

				// 입고 처리 등록
				service.inRegister(inRegister);
				
				
				
				// 재고 이력 등록
				StockHistoryVO stock = new StockHistoryVO();
				stock.setStock_cd(inRegister.getStock_cd());
				stock.setStock_control_type_cd("0");
				stock.setProduct_cd(inRegister.getProduct_cd());
				stock.setSource_stock_cd(0);
				stock.setTarget_stock_cd(0);
				stock.setQty(inRegister.getIn_qty());
				// 작업자코드 =>InVO
				String emp_num = service.getInEmpNum(inRegister.getIn_schedule_cd());
				stock.setEmp_num(emp_num);
				// 오늘 날짜
//				LocalDate now = LocalDate.now();
//				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
//				int formatedNow = Integer.parseInt(now.format(formatter));
//				stock.setStock_date(formatedNow);
				// 비고 => inVO
				String remarks = service.getInRemarks(inRegister.getIn_schedule_cd());
				stock.setRemarks(remarks);

				System.out.println("재고수정 내용~ " + stock);
		        insertStockHistory = service.registerHistory(stock);
			}
			System.out.println("재고수정..됐니? : " + insertStockHistory);
			
			// 미입고수량 = 0 되면 진행 상태 1로 바꾸기
			int[] checkArr = service.getNoInQty();
			System.out.println(checkArr);
			if(checkArr != null) {
				for(int i = 0; i < checkArr.length; i++) {
					if(checkArr[i] == 0) {
						// 진행상태 바꾸기
						service.updateInComplete();
					}
				}
			}
			
			
//			if(insertStockHistory > 0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록 처리가 완료되었습니다!');");
				out.println("opener.document.location.reload();");
				out.println("self.close();");
				out.println("</script>");
//			} else {
//				response.setContentType("text/html; charset=UTF-8");
//				PrintWriter out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('입고 처리에 실패했습니다!');");
//				out.println("opener.document.location.reload();");
//				out.println("self.close();");
//				out.println("</script>");
//			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
	
	// 입고 예정 수정 작업
	@PostMapping(value = "/InProcessingModifyPro")
	public void modifyPro(@ModelAttribute InVO inList,
			@ModelAttribute inProcessingArrVO proArr,
			@RequestParam("remarks2") String remarks2, 
			HttpServletResponse response) {
		System.out.println("inList : " + inList);
		System.out.println("proList : " + proArr);
		// 비고란 중복
		inList.setRemarks(remarks2);
		int modifyInCount = service.modifyInSchedule(inList);
		System.out.println(modifyInCount);
		
		for(int i = 0; i < proArr.getIn_schedule_cd().length; i ++) {
			inProcessingVO inProcessing = new inProcessingVO();
			inProcessing.setIn_schedule_cd(proArr.getIn_schedule_cd()[i]);
			inProcessing.setProduct_cd(proArr.getProduct_cd()[i]);
			// 품목명 자동 변경
			inProcessing.setIn_schedule_qty(proArr.getIn_schedule_qty()[i]);
			inProcessing.setIn_date(proArr.getIn_date()[i]);
			inProcessing.setRemarks(proArr.getRemarks()[i]);
			// 입고품목 테이블 수정
			service.modifyInProcessing(inProcessing);
		}
		
		try {
			if(modifyInCount > 0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 처리가 완료되었습니다!');");
				out.println("opener.document.location.reload();");
				out.println("self.close();");
				out.println("</script>");
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 처리에 실패했습니다!');");
				out.println("opener.document.location.reload();");
				out.println("self.close();");
				out.println("</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 재고번호 생성
//	@GetMapping(value = "/NewStockCd")
//	public void insertStockCd(HttpServletResponse response) {
//		
//		try {
//			int newStockCd = service.getMaxStockCd() + 1;
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print(newStockCd);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//	}
	
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
		return "in/in_waiting_insert";
	}
	
	
	@GetMapping(value = "/inClientSearchAjax")
	public String inClientSerachAjax() {
		return "in/in_ClientSearchAjax";
	}
	
	@ResponseBody
	@GetMapping(value = "/inClientSearch")
	public void inClientSearchAjax(@RequestParam(defaultValue = "") String keyword,
									@RequestParam(defaultValue = "") String searchType,
									Model model,
									HttpServletResponse response) {
		
		List<ClientVO> clientList = service.getClientList(keyword, searchType);
		
//		System.out.println(clientList);
		JSONArray array = new JSONArray();
		
		for(ClientVO client : clientList) {
			JSONObject object = new JSONObject(client);
			
			array.put(object);
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(array);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping(value = "/inEmpSearchAjax")
	public String inEmpSerachAjax() {
		return "in/in_EmpSearchAjax";
	}
	
	@ResponseBody
	@GetMapping(value = "/inEmpSearch")
	public void inEmpSearchAjax(@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String searchType,
			Model model,
			HttpServletResponse response) {
		
		List<EmployeesVO> empList = service.getEmployeeList(keyword, searchType);
		
//		System.out.println(clientList);
		JSONArray array = new JSONArray();
		
		for(EmployeesVO emp : empList) {
			JSONObject object = new JSONObject(emp);
			
			array.put(object);
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(array);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping(value = "/inProSearchAjax")
	public String inProductSerachAjax(@RequestParam(defaultValue = "0") String business_no,
			@RequestParam(defaultValue = "0") int indexNum,
			Model model) {
//		System.out.println(business_no);
//		System.out.println("모달창으로 가는중 " + indexNum);
		model.addAttribute("business_no", business_no);
		model.addAttribute("num", indexNum);
		return "in/in_ProductSearchAjax";
	}
	
	@ResponseBody
	@GetMapping(value = "/inProductSearch")
	public void inProductSearchAjax(@RequestParam(defaultValue = "") String business_no,
			@RequestParam(defaultValue = "0") int indexNum,
			Model model,
			HttpServletResponse response) {
		List<ProductVO> proList = service.getProductList(business_no);
//		System.out.println("모달 결과창으로"+indexNum);
//		System.out.println(clientList);
		JSONArray array = new JSONArray();
		
		for(ProductVO emp : proList) {
			JSONObject object = new JSONObject(emp);
			
			array.put(object);
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(array);
			model.addAttribute("num",indexNum);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping(value = "/inWaitingRegistPro")
	public String in_RegistPro(@ModelAttribute InWatingRegisterVO register, 
			@RequestParam(defaultValue = "") String hire_date, 
			Model model) {
		System.out.println(register);
		System.out.println("날짜 : " + hire_date );
//		System.out.println(jsonData);
		
		for(int i = 0; i < register.getBusiness_no().length; i++) {
			InWatingRegister_nomalVO nomalVO = new InWatingRegister_nomalVO();
			
			nomalVO.setBusiness_no(register.getBusiness_no()[i]);
		}
		
		
		return "";
	}
	
	
	// ======================== sangwoo ============================
  
}
