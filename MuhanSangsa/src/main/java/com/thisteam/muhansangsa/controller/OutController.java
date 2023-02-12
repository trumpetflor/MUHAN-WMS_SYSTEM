package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.net.http.HttpResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.service.OutService;
import com.thisteam.muhansangsa.service.StockService;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.Out_scheduleListVO;
import com.thisteam.muhansangsa.vo.Out_scheduleVO;
import com.thisteam.muhansangsa.vo.Out_schedule_per_productArrVO;
import com.thisteam.muhansangsa.vo.Out_schedule_per_productVO;
import com.thisteam.muhansangsa.vo.Out_schedule_total_Arr_viewVO;
import com.thisteam.muhansangsa.vo.Out_schedule_total_viewVO;
import com.thisteam.muhansangsa.vo.PageInfo;

import com.thisteam.muhansangsa.vo.StockHistoryVO;
import com.thisteam.muhansangsa.vo.StockHistoryViewVO;
import com.thisteam.muhansangsa.vo.StockVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;
import com.thisteam.muhansangsa.vo.Privilege;




@Controller
public class OutController {
	//log4j
	private static final Logger logger = LoggerFactory.getLogger(OutController.class);
  
	@Autowired	
	private OutService service;
	// 다들... 서비스를 사용하신다면... 메서드에서 객체 생성하지 마시고... 
	// 반드시 어노테이션으로 주입하세요... - 만신창이 올림
	@Autowired 
	private StockService stockSvc;

	@Autowired	
	private EmployeesService empService;



	//========================= SEWON ======================================= 
	
	//출고 예정 목록
	@GetMapping(value = "/OutWaitingSelectList")
	public	String outWaitingSelectList(
			@RequestParam(defaultValue = "") String msg,
			Model model, HttpSession session) {
	
	model.addAttribute("msg", msg);
	String sId = (String)session.getAttribute("sId");
	
	//sId가 null일 경우 접근 차단!
	if(session.getAttribute("sId") == null) {
		model.addAttribute("msg", "잘못된 접근입니다.");
		return "fail_back";
	} 
	
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
	
	if(sId != null) { // 세션아이디가 있을 경우 시작 
		// 권한 조회 메서드
		boolean isRightUser = empService.getPrivilege(sId, 
				Privilege.WMS관리, Privilege.기본등록, Privilege.사원관리, Privilege.재고관리);
	}
		
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
		
		System.out.println("=======================" + keyword);
		
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		// 출고 예정 목록(전체,진행중,완료) 가져오기
		List<Out_scheduleListVO> outList = service.getOutList(searchType, keyword, startRow, listLimit,status);
		
		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();
		
		for(Out_scheduleListVO out : outList) {
			JSONObject jsonObject = new JSONObject(out);
			
			jsonArray.put(jsonObject);
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
	}
	
	//출고 예정 목록 중 '종결,취소' 로 상태를 변환하기 위한 JSON 작업 
	@ResponseBody
	@GetMapping(value = "/OutWaitingChangeStautsJson")
	public	void outWaitingChangeStautsJson(
			@RequestParam(defaultValue = "") String out_schedule_cd,
			@RequestParam(defaultValue = "") String out_complete,
			@RequestParam(defaultValue = "-1") int status,
			HttpSession session,
			HttpServletResponse response) {

		int result =service.outWaitingChangeStautsJson(out_schedule_cd, out_complete);
	

	try {
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(result);
	} catch (IOException e) {
		e.printStackTrace();
	}	
	
}
	
	
	
	
	
	//-------------------------------------------------------------- 23/02/09 (미주)
	// 출고 처리 관리 - 출고 처리 리스트
	@GetMapping(value = "/OutProcessingSeletList")
		public	String outProcessingSelectList(
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String keyword,
				@RequestParam(defaultValue = "1") int pageNum,
				Model model, HttpSession session) {
		
		
		// 1. sId 처리
		String sId;
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
		} else {
			model.addAttribute("msg", "로그인이 필요합니다");
			model.addAttribute("url", "/Login");
			return "redirect"; 
		}
		
		// 2. 권한 처리
		boolean isRightUser = empService.getPrivilege(sId, Privilege.WMS관리);
		if (isRightUser) {
			// 3. 접속 ip 확인 코드
			InetAddress local;
			String ip;
			try {
				local = InetAddress.getLocalHost();
				ip = local.getHostAddress();
				model.addAttribute("ip", ip);
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
			
			// 4. 페이징 처리
				int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
				int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
			
				// (1). 한 페이지에서 표시할 페이지 목록(번호) 갯수 계산
				int listCount = service.getOutTotalScheduleListCount(searchType, keyword);
				System.out.println("총 게시물 수 : " + listCount);
				// (2). 한 페이지에서 표시할 페이지 목록 갯수 설정
				int pageListLimit = 10;
				// (3). 전체 페이지 목록 수 계산
				int maxPage = listCount / listLimit 
								+ (listCount % listLimit == 0 ? 0 : 1); 
				// (4). 시작 페이지 번호 계산
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
			
			// 5. 출고 처리 목록 가져오기 (키워드 검색 & 페이징 처리)
			List<Out_schedule_total_viewVO> outTotalScheduleList = service.getOutTotalScheduleList(searchType, keyword, startRow, listLimit);
	//		// ---------------------------------------------------------------------------
			
			model.addAttribute("outTotalScheduleList", outTotalScheduleList);
			model.addAttribute("pageInfo", pageInfo);
			
			return "out/out_processing_seletList";
			
		}else {
			model.addAttribute("msg", "출고 관리 권한이 없습니다!");
			return "fail_back";
		}// 권한 판별 if문	
			
	}//outProcessingSelectList()
	
	// 출고 처리 항목 수정 페이지
	@GetMapping(value =  "/outScheduleModifyForm")
	public String outScheduleModifyForm(
			@RequestParam("out_schedule_cd") String out_schedule_cd,
			Model model, HttpSession session) {
		
		
		// 1. sId 처리
		String sId;
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
		} else {
			model.addAttribute("msg", "로그인이 필요합니다");
			model.addAttribute("url", "/Login");
			return "redirect"; // 어떻게 alert 후에 보내지? => 해결 by. 하원
		}
		// 2. 권한 처리
		boolean isRightUser = empService.getPrivilege(sId, Privilege.WMS관리);
		if (isRightUser) {
			// 3. 접속 ip 확인 코드
			InetAddress local;
			String ip;
			try {
				local = InetAddress.getLocalHost();
				ip = local.getHostAddress();
				model.addAttribute("ip", ip);
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
			
			System.out.println("넘어왔니 출고번호" + out_schedule_cd);
			// 4. 출고 번호에 해당하는 정보 조회 (출고 수정을 위한 목록 조회)
			
				// (1). 출고 정보 상단에 해당하는 정보 조회
				List<Out_schedule_total_viewVO> outModifyFixedList = service.getOutModifyFixedList(out_schedule_cd);
				model.addAttribute("outModifyFixedList", outModifyFixedList);
				
				// (2). 출고 정보 하단 = 수정에 해당하는 목록 조회
				List<Out_schedule_total_viewVO> outModifyList = service.getOutModifyList(out_schedule_cd);
				model.addAttribute("outModifyList", outModifyList);
			
			return "out/out_modifyForm";
		}else {
			model.addAttribute("msg", "출고 관리 권한이 없습니다!");
			return "fail_back";
		} // 권한 판별 if()

	}// outScheduleModifyForm()
	
	
	// 출고 처리 항목 수정 내용 비즈니스 로직 실행
	@GetMapping(value = "/outScheduleModifyPro")
	public void outScheduleModifyPro(
			@ModelAttribute Out_schedule_total_Arr_viewVO totalArr, 
			Model model, HttpServletResponse response ) {
		System.out.println("잘 분리된 total " + totalArr);
		System.out.println("비즈니스 로직으로 이동 성공했지롱!");

		for(int i = 0; i < totalArr.getOut_schedule_cd().length; i++) {
			
			// 1. 수정항목 arrVO 에서 VO로 데이터 분류하여 넣는 작업 
			Out_schedule_total_viewVO total = new Out_schedule_total_viewVO();

			total.setOut_schedule_cd(totalArr.getOut_schedule_cd()[i]);
			total.setCust_name(totalArr.getCust_name()[i]);
			total.setProduct_name(totalArr.getProduct_name()[i]);
			total.setOut_schedule_qty(totalArr.getOut_schedule_qty()[i]);
			total.setOut_qty(totalArr.getOut_qty()[i]);
			total.setOut_date(totalArr.getOut_date()[i]);
			total.setRemarks(totalArr.getRemarks()[i]);
			
			System.out.println("잘 분리된 total " + total);
			
			// 2. 출고 처리 항목 수정 비즈니스 로직
			service.setOutScheduleModifyPro(total);
			
		}
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('출고 처리 항목 수정 완료!');");
			out.println("opener.document.location.reload();");
			out.println("self.close();");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} // outScheduleModifyPro()
	
	//-------------------------------------------------------------- 23/02/09 (미주)


















//======================================= hawon =================================================
	
	// 출고 등록
	@GetMapping(value = "/OutInsertForm")
	public String outInsertForm(@RequestParam(defaultValue = "") String msg, Model model, HttpSession session) {
		model.addAttribute("msg", msg);

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

		// 권한 조회 메서드
		boolean isRightUser = empService.getPrivilege(sId, Privilege.WMS관리);

		if (isRightUser) {

			// 현재 날짜 구하기
			LocalDate now = LocalDate.now();
			// 포맷 정의
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd00");
			int formatedNow = Integer.parseInt(now.format(formatter));
			model.addAttribute("now", now);

			return "out/out_insertForm";

		} else {
			
			model.addAttribute("msg", "권한이 없습니다.");
			return "fail_back";

		}
	}

	@PostMapping(value = "/OutInsertFormPro")
	public	String OutInsertFormPro(
									@ModelAttribute Out_scheduleVO out_schedule,
									@ModelAttribute Out_schedule_per_productArrVO out_product_Arr
									,Model model) {
		
		out_schedule.setOut_complete("0");//진행상테 미완료
		int insertCount2 =0;
		
		System.out.println(out_schedule);
		System.out.println(out_product_Arr);
		//1. 출고예정번호(out_schedule_cd) 생성을 위한 오늘날짜 가져오기
		
			 // 현재 날짜 구하기
	        LocalDate now = LocalDate.now();
	        // 포맷 정의 
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	        int today = Integer.parseInt(now.format(formatter));
	   
	        //출고예정코드 생성
	        String out_schedule_cd =service.createOut_schedule_cd(today);
	        out_schedule.setOut_schedule_cd(out_schedule_cd);
	        
	        // 신규 출고예정 insert작업 
	        int insertCount1 =  service.registerOutSchedule(out_schedule);
	        System.out.println("신규 출고 발주서 생성 >> " + insertCount1);

	        for(int i = 0; i <out_product_Arr.getP_out_date().length; i++) {
	        	
	        	Out_schedule_per_productVO osp = new Out_schedule_per_productVO();
	        	
	        	osp.setOut_schedule_cd(out_schedule_cd);
	        	osp.setProduct_cd(out_product_Arr.getProduct_cd()[i]);//상품코드
	        	osp.setOut_date(out_product_Arr.getP_out_date()[i]);//납기일자
	        	osp.setOut_schedule_qty(out_product_Arr.getOut_schedule_qty()[i]);//출고예정수량
	        	osp.setStock_cd(out_product_Arr.getStock_cd()[i]);//재고번호
	        	osp.setRemarks(out_product_Arr.getP_remarks()[i]);//적요
	        	osp.setOut_complete("0");//진행상테 미완료
	        	osp.setOut_qty(0);//출고수량
	        	
//	 	       // 신규 출고예정품목 insert작업 
	  	      insertCount2 =  service.registerOutScheduleProduct(osp);
	         }

	        if(insertCount1 > 0 &&insertCount2 >0) {
	        	model.addAttribute("msg", "등록에 성공하였습니다");
	        	model.addAttribute("url", "/OutWaitingSelectList");
	        	return "redirect";
	        }else {
	        	model.addAttribute("msg", "일시적인 오류로 등록에 실패했습니다.");
	        	return "fail_back";
	        }
	       
	}
	
	@ResponseBody
	@GetMapping(value = "/Search_emp.ajax")
	public void Search_emp(@RequestParam(defaultValue = "") String keyword,
							HttpServletResponse response) {
			
		List<Emp_viewVO> empList = service.searchEmp(keyword);
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

	
	//품목검색 ajax요청 받는 서블릿주소
	@GetMapping(value = "/findProduct_StockExist.ajax")
	public String findProduct_stockExist(Model model, @RequestParam(defaultValue = "") String keyword) {
		System.out.println("keyword:"+keyword);
			List<Stock_viewVO> product = service.getproduct_stockExist(keyword);
			model.addAttribute("product", product);
		
		return "out/productList_StockExist";
	}
	
	
	//품목검색에서 검색 요청 ajax
	@ResponseBody
	@GetMapping(value = "/findProduct_StockExist_search.ajax")
	public void findProduct_search(Model model, @RequestParam(defaultValue = "") String keyword,HttpServletResponse response) {
		System.out.println("keyword:"+keyword);
		List<Stock_viewVO> product = service.getproduct_stockExist(keyword);
		JSONArray productList = new JSONArray();
		for( Stock_viewVO pro: product) {
			productList.put(new JSONObject(pro));
		}
		
	      try {
		      response.setCharacterEncoding("UTF-8");
		      response.getWriter().print(productList); // toString() 생략됨
		      System.out.println("productList: " + productList);
	   } catch (IOException e) {
	      e.printStackTrace();
	   }
	}
 	//========================= HAWON 끝 ======================================= 
  
	// ================================== JAKYOUNG ============================================
	@ResponseBody
	@PostMapping(value = "/OutProcessing")
	public void outProcess(
			@RequestBody String osppArr,
			Model model,
			HttpSession session,
			HttpServletResponse response
			) {
		
		System.out.println("출고 처리 osppArr : " + osppArr);
		
		// com.google.gson.Gson 객체를 활용하여 JSON 데이터 파싱할 경우
		Gson gson = new Gson();
		
		// JSON 데이터(배열 내부에 객체가 저장되어 있는 JSON 문자열)을 파싱하여 저장할
		// 자바의 객체로 변환하기 위해 Gson 객체의 fromJson() 메서드 활용
		// => gson.fromJson(JSON 데이터, 파싱할클래스명.class);
		// => 단, List 등의 복합 객체일 경우 별도의 클래스를 통해 타입을 지정해야함
		//    ex) new TypeToken<List<BoardVO>>(){}.getType()
		List<Out_schedule_per_productVO> osppLIst = 
				gson.fromJson(osppArr, new TypeToken<List<Out_schedule_per_productVO>>(){}.getType());
		
		System.out.println(osppLIst);
		
//		StockService stockSvc = new StockService(); // ㅎ............... 널포인터.. 내 4시간 돌려내...

		for(Out_schedule_per_productVO ospp : osppLIst) {
			System.out.println("StockController : " + ospp);
			
			int stockUpdateCount = stockSvc.outStockQty(ospp); // stock 테이블 재고 수량 수정
			System.out.println(stockUpdateCount);
			
			int osppUpdateCount = service.modifyOutQty(ospp); // out_schedule_per_product 테이블 출고 수량 수정
			
			if(osppUpdateCount > 0) {
				System.out.println("출고 수량 조정 완료");
			}
			
			// out_schedule_total_viewVO 객체 생성 (다 때려넣은 거 뽑아놓기)
			Out_schedule_total_viewVO outTotalView = service.getOutScheduleTotal(ospp);
			Out_scheduleVO outSchedule = service.getEmpNum(outTotalView.getOut_schedule_cd());
			
			if(outTotalView.getOut_schedule_qty() == outTotalView.getOut_qty()) {
				int updateCount = service.changeOutComplete(ospp);
			}
			
			if(stockUpdateCount > 0) { // 재고 히스토리 추가
				StockHistoryVO stockHistory = new StockHistoryVO();
				
				stockHistory.setStock_cd(outTotalView.getStock_cd());
				stockHistory.setStock_control_type_cd("1"); // 출고
				stockHistory.setProduct_cd(ospp.getProduct_cd());
				stockHistory.setSource_stock_cd(0);
				stockHistory.setTarget_stock_cd(0);
				stockHistory.setQty(ospp.getOut_qty());
				stockHistory.setEmp_num(outSchedule.getEmp_num());
				stockHistory.setRemarks(outTotalView.getRemarks());
				
				int sHinsertCount = stockSvc.addOutHistory(stockHistory);
				
				if(sHinsertCount > 0) {
					System.out.println("재고 이력 추가 완료");
					try {
						response.setCharacterEncoding("UTF-8");
						response.getWriter().print("true"); // toString() 생략됨
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
			}
			
			
		}
		
	}
	
	
	
	
	
	
	
	// ================================== JAKYOUNG 끝 =========================================
  
  
  
  
  
  
}













