package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.service.InService;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InRegisterTotalVO;
import com.thisteam.muhansangsa.vo.InVO;
import com.thisteam.muhansangsa.vo.InWatingRegisterVO;
import com.thisteam.muhansangsa.vo.InWatingRegister_nomalVO;
import com.thisteam.muhansangsa.vo.PageInfo;
import com.thisteam.muhansangsa.vo.Privilege;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.StockHistoryVO;
import com.thisteam.muhansangsa.vo.StockWhVO;
import com.thisteam.muhansangsa.vo.WarehouseVO;
import com.thisteam.muhansangsa.vo.inProcessingArrVO;
import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.inRegisterArrVO;
import com.thisteam.muhansangsa.vo.inRegisterVO;


@Controller
public class InController {
	//log4j
	private static final Logger logger = LoggerFactory.getLogger(InController.class);
	
	@Autowired
	private InService service;
	@Autowired
	private EmployeesService empService; // 사원 서비스
	
	// ======================== yeram ==============================
	// 입고예정목록 조회
	@GetMapping(value = "/InProcessing")
	public String inProcessingList(Model model, HttpSession session) {
		
		// 세션 아이디
        String sId;
        if (session.getAttribute("sId") != null) {
           sId = (String) session.getAttribute("sId");
        } else {
           model.addAttribute("msg", "로그인이 필요합니다");
           model.addAttribute("url", "/Login");
           return "redirect"; 
        }

        // 아이피 주소
        try {
           InetAddress local = InetAddress.getLocalHost();
           String ip = local.getHostAddress();
           model.addAttribute("ip", ip);
           logger.info("접속 ip : " + ip);
        } catch (UnknownHostException e) {
           e.printStackTrace();
        }
		
        // 로그인 여부
		if(sId != null && !sId.equals("")) {  // 세션 아이디 있을 경우
			System.out.println("sId : " + sId);
		} else {
			model.addAttribute("msg", "로그인을 해주세요.");
			return "fail_back";
		}
		
		// 권한 조회 메서드
		boolean isRightUser = empService.getPrivilege(sId, Privilege.WMS관리);
		System.out.println("거래처등록 권한: " + isRightUser);
		//		    isRightUser = true; // 임시

		if(isRightUser) { // 권한 존재할 경우
			model.addAttribute("priv", "1"); 
			// 조회
//			List<inProcessingVO> inProList = service.getInProList();
//			
//			model.addAttribute("inProList", inProList);
			
			return "in/in_processing";
		} else {
			model.addAttribute("msg", "입고 조회 권한이 없습니다.");
			return "fail_back";
		}

        
	}
	
	// 입고예정목록 조회2
	@ResponseBody
	@GetMapping(value = "/InProcessingListJson")
	public void inProcessingListJson(
			@RequestParam(defaultValue = "1") int pageNum, // 현재 페이지 번호
			@RequestParam(defaultValue = "") String searchType, // 검색 타입
			@RequestParam(defaultValue = "") String keyword, // 검색어
			@RequestParam(defaultValue = "-1") int status, // 탭
			Model model,
			HttpSession session,
			HttpServletResponse response
			) {


		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산

		// 입고 목록 가져오기
		List<inProcessingVO> inProList = service.getInProList(searchType, keyword, startRow, listLimit, status);

		// 페이징 처리 
		//1. 검색어에 해당하는 정보의 갯수 계산
		int listCount = service.getInProListCount(searchType, keyword, status);

		// 2. 한 페이지에서 표시할 페이지 숫자의 갯수 설정
		int pageListLimit = 10; // 한 페이지에서 표시할 페이지 수를 10개로 제한
		// 3. 전체 페이지 목록 수 계산
		int maxPage = listCount / listLimit 
				+ (listCount % listLimit == 0 ? 0 : 1); 

		// 4. 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

		// 5. 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;

		// 6. 만약, 끝 페이지 번호(endPage)가 전체(최대) 페이지 번호(maxPage) 보다
		//    클 경우, 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);		

		System.out.println(pageInfo);

		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();

		for(inProcessingVO inList : inProList) {
			System.out.println(inList);
			JSONObject jsonObject = new JSONObject(inList);
			System.out.println("입고 코드 : " + jsonObject.get("in_schedule_cd"));
			
			jsonArray.put(jsonObject);
		}

		JSONObject jsonObjectPage = new JSONObject(pageInfo);
		System.out.println("시작 페이지 : " + jsonObjectPage.get("startPage"));
		jsonArray.put(jsonObjectPage);

		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	// 입고처리 폼(입고버튼)
	@GetMapping(value = "/InRegister")
	public String register(
//			List<inRegisterVO> inRegisterList,
			String[] inRegisterList,
			Model model,
			HttpServletResponse response,
			HttpSession session) {
		System.out.println("inRegisterList : " + Arrays.toString(inRegisterList));
		
		// 세션 아이디
        String sId;
        if (session.getAttribute("sId") != null) {
           sId = (String) session.getAttribute("sId");
        } else {
           model.addAttribute("msg", "로그인이 필요합니다");
           model.addAttribute("url", "/Login");
           return "redirect"; 
        }

        // 아이피 주소
        try {
           InetAddress local = InetAddress.getLocalHost();
           String ip = local.getHostAddress();
           model.addAttribute("ip", ip);
           logger.info("접속 ip : " + ip);
        } catch (UnknownHostException e) {
           e.printStackTrace();
        }
		
		
		ArrayList<String> in_schedule_cd = new ArrayList<String>();
		ArrayList<String> product_name = new ArrayList<String>();
		ArrayList<String> in_date = new ArrayList<String>();
//		ArrayList<Date> in_date = new ArrayList<Date>();
		
		for(int i = 0; i<inRegisterList.length; i++) {
			String a = inRegisterList[i];
			String b = a.split("/")[0];
			String c = a.split("/")[1];
			String d = a.split("/")[2];
			
			in_schedule_cd.add(b);
			product_name.add(c);
			in_date.add(d);
		}
			
		// ================================보완
//		for(inRegisterVO inList : inRegisterList) {
//		
//			in_schedule_cd.add(inList.getIn_schedule_cd());
//			product_name.add(inList.getProduct_name());
//			in_date.add(inList.getIn_date());
//		}
			
		System.out.println("in_schedule_cd :" + in_schedule_cd);
		System.out.println("product_name :" + product_name);
		System.out.println("in_date :" + in_date);
		
		List<InRegisterTotalVO> resultList = service.getInRegisterList(in_schedule_cd, product_name, in_date);
		
		System.out.println("add 전 : " + resultList);
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
					String wh_loc = inRegister.getWh_loc_in_area();
					int wh_loc_in_area_cd = service.getWhLocCd(wh_loc);
					int stock_qty = inRegister.getIn_qty();
					
					int insertStockCount = service.insertStockCd(product_cd, wh_loc_in_area_cd, stock_qty);
					int newStockCd = service.getMaxStockCd();
					inRegister.setStock_cd(newStockCd);
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
						Model model,
						HttpSession session) {
		
		// 세션 아이디
        String sId;
        if (session.getAttribute("sId") != null) {
           sId = (String) session.getAttribute("sId");
        } else {
           model.addAttribute("msg", "로그인이 필요합니다");
           model.addAttribute("url", "/Login");
           return "redirect"; // 어떻게 alert 후에 보내지? => 해결 by. 하원
        }

        // 아이피 주소
        try {
           InetAddress local = InetAddress.getLocalHost();
           String ip = local.getHostAddress();
           model.addAttribute("ip", ip);
           logger.info("접속 ip : " + ip);
        } catch (UnknownHostException e) {
           e.printStackTrace();
        }
		
		
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
		System.out.println("proArr.getIn_schedule_cd().length = " +proArr.getIn_schedule_cd().length);
		
		for(int i = 0; i <= proArr.getIn_schedule_cd().length; i ++) {
			System.out.println(i+"번째 수정~");
			inProcessingVO inProcessing = new inProcessingVO();
			inProcessing.setIn_schedule_cd(proArr.getIn_schedule_cd()[0]);
			inProcessing.setProduct_cd(proArr.getProduct_cd()[i]);
			// 품목명 자동 변경
			inProcessing.setIn_schedule_qty(proArr.getIn_schedule_qty()[i]);
			inProcessing.setIn_date(proArr.getIn_date()[i]);
			inProcessing.setRemarks(proArr.getRemarks()[i]);
			inProcessing.setOriginal_cd(proArr.getOriginal_cd()[i]);
			inProcessing.setOriginal_date(proArr.getOriginal_date()[i]);
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
		
		// 페이징 처리 
		//1. 검색어에 해당하는 정보의 갯수 계산
		int listCount = service.getWhLocListCount(searchType, keyword);

		// 2. 한 페이지에서 표시할 페이지 숫자의 갯수 설정
		int pageListLimit = 10; // 한 페이지에서 표시할 페이지 수를 10개로 제한
		// 3. 전체 페이지 목록 수 계산
		int maxPage = listCount / listLimit 
				+ (listCount % listLimit == 0 ? 0 : 1); 

		// 4. 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;

		// 5. 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;

		// 6. 만약, 끝 페이지 번호(endPage)가 전체(최대) 페이지 번호(maxPage) 보다
		//    클 경우, 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);		
		System.out.println(pageInfo);

		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();
		
		for(StockWhVO whLoc : whLocList) {
			System.out.println(whLoc);
			JSONObject jsonObject = new JSONObject(whLoc);
			System.out.println(jsonObject.get("wh_area"));
			
			jsonArray.put(jsonObject);
		}
		
		JSONObject jsonObjectPage = new JSONObject(pageInfo);
		System.out.println("시작 페이지 : " + jsonObjectPage.get("startPage"));
		jsonArray.put(jsonObjectPage);
		
		
		
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
	public String waiting(Model model,HttpSession session) {
		// 세션 아이디
				String sId;
				if (session.getAttribute("sId") != null) {
					sId = (String) session.getAttribute("sId");
				} else {
					model.addAttribute("msg", "로그인이 필요합니다");
					model.addAttribute("url", "/Login");
					return "redirect";
				}
		
		return "in/in_waiting_form";
	}
	
	@ResponseBody
	@GetMapping(value = "/InWaitingSelectListJson")
	public void InWaitingSelectListJson(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "-1") int status,
			Model model,
			HttpSession session,
			HttpServletResponse response
			) {
		
		int listLimit = 10;
		int startRow = (pageNum - 1) * listLimit;
		
		List<InVO> inScheduleList = service.getInSchedultList(searchType, keyword,startRow,listLimit,status);
		
		JSONArray jsonArray = new JSONArray();
		
		for(InVO in : inScheduleList) {
			JSONObject jsonObject = new JSONObject(in);
			
			jsonArray.put(jsonObject);
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@ResponseBody
	@GetMapping(value = "/InWaitingChangeStautsJson")
	public void inWaitingChangeStautsJson(
			@RequestParam(defaultValue = "") String in_schedule_cd,
			@RequestParam(defaultValue = "") String in_complete,
			@RequestParam(defaultValue = "1") int status,
			HttpSession session,
			HttpServletResponse response
			) {
		int result = service.inWaitingChangeStautsJson(in_schedule_cd, in_complete);
		
		try {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@GetMapping(value = "/inProQtyAjax")
	public String inProQtyAjax(@RequestParam String in_schedule_cd, Model model) {
		model.addAttribute("in_schedule_cd", in_schedule_cd);
		System.out.println("예정 번호 : " + in_schedule_cd);
		return "in/in_inProQtyAjax?in_schedule_cd=" + in_schedule_cd;
	}
	
	@ResponseBody
	@GetMapping(value = "/inProQtySearch")
	public void inProQtySearch(
			@RequestParam(defaultValue = "") String in_schedule_cd, 
			Model model,
			HttpServletResponse response) {
		List<inProcessingVO> ProQtyList = service.getProQtyList(in_schedule_cd);
		System.out.println(ProQtyList);
		
		JSONArray array = new JSONArray();
		
		for(inProcessingVO proqty : ProQtyList) {
			JSONObject object = new JSONObject(proqty);
			
			array.put(object);
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(array);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping(value = "/inProQtyAjax2")
	public String inProQtyAjax2(@RequestParam(defaultValue = "") String in_schedule_cd, Model model) {
		
		System.out.println("나왔으면 좋겠다");
		
		List<inProcessingVO> ProQtyList = service.getProQtyList(in_schedule_cd);
		System.out.println(ProQtyList);
		
		
		model.addAttribute("in_array", ProQtyList);
		
		return"in/inProQtyAjax2";
	}
	
	@GetMapping(value = "/InWaitingInsertForm")
	public String waitingInsert(Model model) {
		String lastNum = service.getLastNum();
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		int formatNow = Integer.parseInt(localDate.format(formatter));
		String in_schedule_cd = (formatNow + "-" + lastNum);
		
		model.addAttribute("now",localDate);
//		System.out.println(lastNum);
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
	
	// 입고 예정 등록 insert 작업
	@PostMapping(value = "/inWaitingRegistPro")
	public String in_RegistPro(@ModelAttribute InWatingRegisterVO in_schedule_per,
			@ModelAttribute InWatingRegister_nomalVO in_schedule,
			Model model) {
//		System.out.println("regist : " + in_schedule_per);
//		System.out.println("in_ schedule : " + in_schedule);
		
		// 현재 날짜 구해서 in_schedule_cd 만들기
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		int today = Integer.parseInt(now.format(formatter));
		
		String in_schedule_cd = service.createIn_schedule_cd(today);
		in_schedule.setIn_schedule_cd(in_schedule_cd);
		// ---------------------------------------------
		
		// in_schedule 상단 데이터 insert
		int insertTopSchedule = service.registInScheduleTop(in_schedule);
		System.out.println("입고예정 상단 insert = " + insertTopSchedule);
		int insertBottomSchedule = 0;
		for(int i = 0; i < in_schedule_per.getProduct_cd().length; i++) {
			InVO isp = new InVO();
			
			isp.setIn_schedule_cd(in_schedule_cd);
			isp.setProduct_cd(in_schedule_per.getProduct_cd()[i]);
			isp.setIn_schedule_qty(in_schedule_per.getIn_schedule_qty()[i]);
			isp.setIn_date(in_schedule_per.getIn_date_detail()[i]);
			isp.setIn_schedule_qty(in_schedule_per.getIn_schedule_qty()[i]);
			isp.setRemarks(in_schedule_per.getRemarks()[i]);
			isp.setIn_complete("0");
			isp.setIn_qty(0);
			
			insertBottomSchedule = service.registInScheduleBottom(isp);
		}
		
		if(insertTopSchedule > 0 && insertBottomSchedule > 0) {
			model.addAttribute("msg", "입고 예정 등록에 성공하였습니다");
			model.addAttribute("url", "//InSchedule");
			return "redirect";
		} else {
			model.addAttribute("msg", "일시적인 오류로 등록에 실패했습니다.");
        	return "fail_back";
		}
		
//		for(int i = 0; i < register.getBusiness_no().length; i++) {
//			InWatingRegister_nomalVO nomalVO = new InWatingRegister_nomalVO();
//			
//			nomalVO.setBusiness_no(register.getBusiness_no()[i]);
//			nomalVO.setEmp_num(register.getEmp_num()[i]);
//			nomalVO.setIn_date(register.getIn_date()[i]);
//			nomalVO.setProduct_cd(register.getProduct_cd()[i]);
//			nomalVO.setProduct_name(register.getProduct_name()[i]);
//			nomalVO.setIn_schedule_qty(register.getIn_schedule_qty()[i]);
//			nomalVO.setIn_date_detail(register.getIn_date_detail()[i]);
//			nomalVO.setRemarks(register.getRemarks()[i]);
//			System.out.println(nomalVO);
			
			
//			int result = service.insertRegister(nomalVO);
			
			
//		}
		
	}
	
	
	// ======================== sangwoo ============================
  
}
