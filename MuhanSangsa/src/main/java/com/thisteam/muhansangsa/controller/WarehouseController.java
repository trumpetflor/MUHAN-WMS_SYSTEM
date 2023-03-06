package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.service.WarehouseService;
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
			List<WarehouseVO> whList = service.getWarehouseList();
			
			model.addAttribute("whList", whList);
			
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
		// 구분,위치 값 들고와서 searchType에 in,out,pl로 count 검색하고
		// mapper에서 +1로 들고오기~
		// (count+1) < 10 => 00 + (count+1), (count+1) < 100 => 0+ (count+1), else => +(count+1)
		// String wh_cd = in/out/pl + count;
		// setwh_cd(wh_cd)
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
			List<WarehouseVO> whList = service.getWarehouseList();
			
			model.addAttribute("whList", whList);
			
			return "Warehouse/warehouse_list";
		} else {
			model.addAttribute("msg", "창고 조회 권한이 없습니다.");
			
			return "fail_back";
		}
		
		
	}
	
	// 창고 수정 폼
	@GetMapping(value = "/WarehouseModifyForm")
	public String modify(@ModelAttribute WarehouseVO warehouse,
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
		List<WarehouseVO> whList = service.getWarehouseDetail(wh_cd);
		System.out.println(whList);
		model.addAttribute("whList", whList);
		
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













