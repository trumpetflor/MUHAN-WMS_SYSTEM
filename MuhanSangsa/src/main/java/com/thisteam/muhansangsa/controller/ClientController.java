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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thisteam.muhansangsa.service.ClientService;
import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.Privilege;

@Controller
public class ClientController {
	
	@Autowired
	private ClientService service;
//	@Autowired
	private EmployeesService empService; // 사원 서비스
	
	@GetMapping(value = "ClientList")
	public String clientList(
			Model model,
			HttpSession session
			) {
		
		// 접속한 ip 주소 가져오기
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		// 세션 아이디 없을 경우 쫓아내기
		String sId = (String)session.getAttribute("sId");
		
		sId = "admin@muhan.com"; // 임시 관리자 계정 설정 (주석 처리 필요)
		if(sId != null && !sId.equals("")) { 

			System.out.println("sId : "+ sId);

			return "client/client_list"; // 거래처 목록 조회 페이지
			
		} else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			
			return "fail_back";
		}
		
	}
	
	// 거래처 목록 조회
	@ResponseBody
	@GetMapping(value = "ClientListJson")
	public void clientListJson(
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
		List<ClientVO> clientList = service.getClientList(searchType, keyword, startRow, listLimit);
		
		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();
		
		for(ClientVO client : clientList) {
			client.setAddr(client.getAddr().split("/")[0]); // 도로명 주소만 가져오기
			client.setRemarks(client.getRemarks().replace("\r\n", "<br>")); // 출력 시 줄바꿈 처리
			System.out.println(client);
			JSONObject jsonObject = new JSONObject(client);
			System.out.println(jsonObject.get("business_no"));
			
			jsonArray.put(jsonObject);
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 거래처 등록 폼
	@GetMapping(value = "ClientInsertForm")
	public String clientInsert(
			Model model,
			HttpSession session
			) {
		
		// 접속한 ip 주소 가져오기
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		// 권한에 따른 접근 허용 여부 판단
		// 세션 아이디 저장
		String sId = "";
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
			System.out.println("sId : "+ sId);
		}
		
		sId = "admin@muhan.com"; // 임시 관리자 계정 설정 (주석 처리 필요)

		if(!sId.equals("")) {  // 세션 아이디 있을 경우

			//권한 조회 메서드
//			boolean isRightUser = empService.getPrivilege(sId, Privilege.거래처관리);
			
			boolean isRightUser = true; // 임시 권한 부여 (주석 처리 필요)
			
			if(isRightUser) { // 권한 존재할 경우
				return "client/client_insert_form"; // 거래처 등록 폼
			} else { // 권한 없을 경우
				model.addAttribute("msg", "거래처 관리 권한이 없습니다.");
				
				return "fail_back";
			}
		
		} else { // 세션 아이디 없을 경우
			model.addAttribute("msg", "잘못된 접근입니다.");
			
			return "fail_back";
		}
		
	}
	
	// 거래처 등록 프로
	@PostMapping(value = "ClientInsertPro")
	public String clientInsertPro(
			@ModelAttribute ClientVO client,
			Model model,
			HttpSession session
			) {
		
		// 업태 및 종목을 / 로 구분
		client.setUptae(client.getUptae().replaceAll(",", "/"));
		client.setJongmok(client.getJongmok().replaceAll(",", "/"));
		
		System.out.println(client);
		
		int insertCount = service.insertClient(client);
		
		if(insertCount > 0) { // 등록 성공 시
			return "redirect:ClientList";
		} else { // 등록 실패 시
			model.addAttribute("msg", "거래처 등록 실패");
			return "fail_back";
		}
		
	}
	
	// 거래처 코드 중복 확인
	@ResponseBody
	@GetMapping(value = "DuplicateBusinessNo")
	public void duplicateBn(
			Model model,
			HttpSession session,
			HttpServletResponse response,
			@RequestParam String business_no
			) {
		
		// 거래처 코드 확인하기
		try {
			if(service.duplicateBn(business_no) != null) { // 거래처 코드 존재 (중복 O)
				response.getWriter().print("true"); // "true" 보내기
			} else { // 거래처 코드 존재 X (중복 X)
				response.getWriter().print("false"); // "false" 보내기
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 거래처 상세조회
	@GetMapping(value = "ClientDetail")
	public String clientDetail(
			@RequestParam(defaultValue = "") String business_no,
			Model model,
			HttpSession session
			) {
		
		// 세션 아이디 저장
		String sId = "";
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
			System.out.println("sId : "+ sId);
		}
		
		sId = "admin@muhan.com"; // 임시 관리자 계정 설정 (주석 처리 필요)

		if(!sId.equals("")) {  // 세션 아이디 있을 경우

			//권한 조회 메서드
//			boolean isRightUser = empService.getPrivilege(sId, Privilege.거래처관리);
			
			boolean isRightUser = true; // 임시 권한 부여 (주석 처리 필요)
			
			if(isRightUser) { // 권한 존재할 경우
				
				// 거래처 상세 정보 조회
				if(business_no != null && !business_no.equals("")) { // 거래처 코드가 "" 아닐 경우 (존재 O)
					ClientVO client = service.getClientDetail(business_no);
					
					System.out.println(client);
					
					// 업태, 종목 ClientVO 객체에 배열로 저장
					client.setUptaeArr(client.getUptae().split("/"));
					client.setJongmokArr(client.getJongmok().split("/"));
					
					// 주소를 addr 과 detailedAddr 로 나누어 저장
					String[] addrArr = client.getAddr().split("/");
//					System.out.println(addrArr[0]);
//					System.out.println(addrArr[1]);
					client.setAddr(addrArr[0]);
					client.setDetailedAddr(addrArr[1]);
					
					System.out.println(client);
					
					model.addAttribute("client", client); // Model 객체에 ClientVO 객체 저장
					
					return "client/client_detail_form";

				} else { // 거래처 코드 존재 X
					model.addAttribute("msg", "존재하지 않는 거래처 코드입니다.");
					return "fail_back";
				}
				
			} else { // 권한 없을 경우
				model.addAttribute("msg", "거래처 관리 권한이 없습니다.");
				return "fail_back";
			}
		
		} else { // 세션 아이디 없을 경우
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
	}
		
	
	// 거래처 수정
	@PostMapping(value = "ClientModify")
	public String clientModify(
			@ModelAttribute ClientVO client,
			@RequestParam String originBn, // 기존 거래처 코드
			Model model,
			HttpSession session
			) {
		
		// 권한에 따른 접근 허용 여부 판단
		// 세션 아이디 저장
		String sId = "";
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
			System.out.println("sId : "+ sId);
		}
		
		sId = "maltesers@muhan.com"; // 임시 관리자 계정 설정 (주석 처리 필요)

		if(sId != null && !sId.equals("")) { 

			//권한 조회 메서드
//			boolean isRightUser = empService.getPrivilege(sId, Privilege.거래처관리);
			
			boolean isRightUser = true; // 임시 권한 부여 (주석 처리 필요)
			
			if(isRightUser) { // 권한 존재할 경우
				
				// 거래처 상세 정보 수정
				// 업태 및 종목을 / 로 구분
				client.setUptae(client.getUptae().replaceAll(",", "/"));
				client.setJongmok(client.getJongmok().replaceAll(",", "/"));
				
				System.out.println(client);
				
				int updateCount = service.modifyClient(originBn, client);
				
				if(updateCount > 0) { // 수정 성공 시
					return "redirect:ClientDetail?business_no=" + client.getBusiness_no();
					
				} else { // 수정 실패 시
					model.addAttribute("msg", "거래처 정보 수정에 실패했습니다.");
					return "fail_back";
				}
			} else { // 권한 없을 경우
				model.addAttribute("msg", "거래처 관리 권한이 없습니다.");
				return "fail_back";
			}
		} else { // 세션 아이디 없을 경우
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
	
	}
	
	
}














