package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.service.WarehouseService;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.PageInfo;
import com.thisteam.muhansangsa.vo.Privilege;
import com.thisteam.muhansangsa.vo.WarehouseVO;

@Controller
public class WarehouseController {
	
	//log4j
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Autowired
	private WarehouseService service;
	@Autowired
	private EmployeesService empService; // 사원 서비스
	
	// 창고 등록 폼
	@GetMapping(value = "/WarehouseInsertForm")
	public String insert(HttpSession session, Model model) {
		
		// 세션 아이디
		String sId = "";
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
		} else {
			model.addAttribute("msg", "로그인이 필요합니다");
			model.addAttribute("url", "/Login");
			return "redirect"; 
		}

		// 아이피 주소
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);

		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		// 로그인 여부
		if(sId != null && !sId.equals("")) {  // 세션 아이디 있을 경우
			System.out.println("sId : " + sId);
		} else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		// 권한 조회 메서드
		boolean isRightUser = empService.getPrivilege(sId, Privilege.창고등록);
		System.out.println("거래처등록 권한: " + isRightUser);
		//		    isRightUser = true; // 임시

		if(isRightUser) { // 권한 존재할 경우
			model.addAttribute("priv", "1"); 
			
			// 물류팀 직원 목록
			List<String> employees = service.getLogiEmployeesList();
			
			model.addAttribute("employees", employees);
			
			return "Warehouse/warehouse_insert_form";
		} else {
			model.addAttribute("msg", "창고 등록 권한이 없습니다.");
			
			return "fail_back";
		}
		
		
	}
	
	// 창고 등록 작업
	@PostMapping(value = "/WarehouseInsertPro")
	public String insertPro(@ModelAttribute WarehouseVO warehouse,
							Model model) {
		System.out.println("수정 전:"+warehouse);
		// 창고 내부
		if(warehouse.getWh_addr1() == null) {
			warehouse.setWh_addr("");
		} else {
			warehouse.setWh_addr(warehouse.getWh_addr1()+", "+warehouse.getWh_addr2());
		}
		
		// 창고 코드 부여
		String keyword = "";
		String wh_cd = "";
		String gubun = warehouse.getWh_gubun();
		if(gubun.equals("2")) { // 공장
			keyword = "pl";
			int count = service.getCodeCount(keyword);
			if(count < 10) {
				wh_cd = "PL_00"+count;
			} else if(count<100) {
				wh_cd = "PL_0"+count;
			} else {
				wh_cd = "PL_"+count;
			}
			warehouse.setWh_cd(wh_cd);
		} else if(gubun.equals("1")) { // 창고
			if(warehouse.getWh_location().equals("1")) { // 내부
				keyword = "in";
				int count = service.getCodeCount(keyword);
				if(count < 10) {
					wh_cd = "WH_IN_00"+count;
				} else if(count<100) {
					wh_cd = "WH_IN_0"+count;
				} else {
					wh_cd = "WH_IN_"+count;
				}
				warehouse.setWh_cd(wh_cd);
			} else { // 외부
				keyword = "out";
				int count = service.getCodeCount(keyword);
				if(count < 10) {
					wh_cd = "WH_OUT_00"+count;
				} else if(count<100) {
					wh_cd = "WH_OUT_0"+count;
				} else {
					wh_cd = "WH_OUT_"+count;
				}
				warehouse.setWh_cd(wh_cd);
			}
		}
		System.out.println("수정 후 : "+warehouse);
		// 창고 등록
		int insertCount = service.registerWarehouse(warehouse);
		
		if(insertCount > 0) { // 성공
			return "redirect:/WarehouseList";
		} else { // 실패
			model.addAttribute("msg", "등록 실패!");
			return "fail_back";
		}

	}
	
	// 창고 조회
	@GetMapping(value = "/WarehouseList")
	public String list(Model model, HttpSession session) {
		
		// 세션 아이디
		String sId = "";
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
		} else {
			model.addAttribute("msg", "로그인이 필요합니다");
			model.addAttribute("url", "/Login");
			return "redirect"; // 어떻게 alert 후에 보내지? => 해결 by. 하원
		}

		// 아이피 주소
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);

		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		// 로그인 여부
		if(sId != null && !sId.equals("")) {  // 세션 아이디 있을 경우
			System.out.println("sId : " + sId);
		} else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		// 권한 조회 메서드
		boolean isRightUser = empService.getPrivilege(sId, Privilege.창고등록);
		System.out.println("거래처등록 권한: " + isRightUser);
		//		    isRightUser = true; // 임시

		if(isRightUser) { // 권한 존재할 경우
			model.addAttribute("priv", "1"); 
			// 조회
//			List<WarehouseVO> whList = service.getWarehouseList();
			
//			model.addAttribute("whList", whList);
			
			return "Warehouse/warehouse_list2";
		} else {
			model.addAttribute("msg", "창고 조회 권한이 없습니다.");
			
			return "fail_back";
		}
		
		
	}
	
	
	// 거래처 목록 조회2
	@ResponseBody
	@GetMapping(value = "/WarehouseListJson")
	public void WarehouseListJson(
			@RequestParam(defaultValue = "1") int pageNum, // 현재 페이지 번호
			@RequestParam(defaultValue = "") String searchType, // 검색 타입
			@RequestParam(defaultValue = "") String keyword, // 검색어
			Model model,
			HttpSession session,
			HttpServletResponse response
			) {

		// ------------------------- 쌤이랑 한 부분 --------------------------------------------

		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 7개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산

		// 거래처 목록 가져오기
		List<WarehouseVO> whList = service.getWarehouseList(searchType, keyword, startRow, listLimit);

		// 페이징 처리 
		//1. 검색어에 해당하는 거래처 정보(ClientVO)의 갯수 계산
		int listCount = service.getWhListCount(searchType, keyword);

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

		for(WarehouseVO warehouse : whList) {
			System.out.println(warehouse);
			if(warehouse.getWh_gubun().equals("1")) {
				warehouse.setWh_gubun("창고");
			} else {
				warehouse.setWh_gubun("공장");
			}
			if(warehouse.getWh_use().equals("1")) {
				warehouse.setWh_use("사용");
			} else {
				warehouse.setWh_use("미사용");
			}
			JSONObject jsonObject = new JSONObject(warehouse);
			System.out.println("창고 코드 : " + jsonObject.get("wh_cd"));
			
			System.out.println(warehouse);
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
	
	// 창고 수정 폼
	@GetMapping(value = "/WarehouseModifyForm")
	public String modify(
//			@ModelAttribute WarehouseVO warehouse,
						@RequestParam String wh_cd,
						Model model,
						HttpSession session) {
		
		// 세션 아이디
		String sId = "";
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
		} else {
			model.addAttribute("msg", "로그인이 필요합니다");
			model.addAttribute("url", "/Login");
			return "redirect"; // 어떻게 alert 후에 보내지? => 해결 by. 하원
		}

		// 아이피 주소
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);

		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		// 조회
		WarehouseVO warehouse = service.getWarehouseDetail(wh_cd);
		System.out.println("주소:" +warehouse.getWh_addr());
		if(warehouse.getWh_addr() != null && !warehouse.getWh_addr().equals("") && !warehouse.getWh_addr().equals(null) && warehouse.getWh_addr() != "") {
			warehouse.setWh_addr1(warehouse.getWh_addr().split(", ")[0]);
			warehouse.setWh_addr2(warehouse.getWh_addr().split(", ")[1]);
		} else {
			warehouse.setWh_addr1(" ");
			warehouse.setWh_addr2(" ");
		}
		System.out.println(warehouse);
		model.addAttribute("warehouse", warehouse);
		
		// 물류팀 직원 목록
		List<String> employees = service.getLogiEmployeesList();
		model.addAttribute("employees", employees);
		
		return "Warehouse/warehouse_modify_form";
	}
	
	// 창고 수정 작업
	@PostMapping(value = "/WarehouseModifyPro")
	public void modifyPro(@ModelAttribute WarehouseVO warehouse,
							Model model,
							HttpServletResponse response) {
		System.out.println(warehouse);
		if(warehouse.getWh_addr1() == null) {
			warehouse.setWh_addr("");
		} else {
			warehouse.setWh_addr(warehouse.getWh_addr1()+", "+warehouse.getWh_addr2());
		}
		System.out.println(warehouse);
		int modifyCount = service.modifyWarehouse(warehouse);
		try {
			
			if(modifyCount > 0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('창고 수정이 완료되었습니다!');");
				out.println("opener.document.location.reload();");
				out.println("self.close();");
				out.println("</script>");
				
			} else {
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패!!');");
				out.println("opener.document.location.reload();");
				out.println("self.close();");
				out.println("</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	// 물류팀직원확인
	@GetMapping(value = "/WarehouseCheckMan")
	public void checkMan(@RequestParam String wh_man_name,
						HttpServletResponse response
						) {
		try {
			Boolean isChecked = service.WarehouseCheckMan(wh_man_name);
			
			if(!isChecked) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("true");
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("false");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 창고코드 중복 확인
	@GetMapping(value = "/WarehouseCheckCode")
	public void CheckCode(@RequestParam String wh_cd,
						HttpServletResponse response) {
		try {
			Boolean isChecked = service.WarehouseCheckCode(wh_cd);
			
			if(isChecked) { // 중복
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("true");
			} else { // 중복아님
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("false");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}













