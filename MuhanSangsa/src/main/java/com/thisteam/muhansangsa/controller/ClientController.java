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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thisteam.muhansangsa.service.ClientService;
import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.PageInfo;
import com.thisteam.muhansangsa.vo.Privilege;

@Controller
public class ClientController {

	@Autowired
	private ClientService service;
	@Autowired
	private EmployeesService empService; // 사원 서비스

	@GetMapping(value = "ClientList")
	public String clientList(
			Model model,
			HttpSession session
			) {

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

		if(sId != null && !sId.equals("")) {  // 세션 아이디 있을 경우

			System.out.println("sId : " + sId);

			// 권한 조회 메서드
			boolean isRightUser = empService.getPrivilege(sId, Privilege.거래처등록);
			System.out.println("거래처등록 권한: " + isRightUser);
			//		    isRightUser = true; // 임시

			if(isRightUser) { // 권한 존재할 경우
				model.addAttribute("priv", "1"); 
			}

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
			@RequestParam(defaultValue = "1") int pageNum, // 현재 페이지 번호
			@RequestParam(defaultValue = "") String searchType, // 검색 타입
			@RequestParam(defaultValue = "") String keyword, // 검색어
			Model model,
			HttpSession session,
			HttpServletResponse response
			) {

		// ------------------------- 쌤이랑 한 부분 --------------------------------------------

		// 페이징 처리를 위한 변수 선언
		int listLimit = 7; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산

		// 거래처 목록 가져오기
		List<ClientVO> clientList = service.getClientList(searchType, keyword, startRow, listLimit);

		// 페이징 처리 
		//1. 검색어에 해당하는 거래처 정보(ClientVO)의 갯수 계산
		int listCount = service.getClientListCount(searchType, keyword);

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

		// ------------------------- 쌤이랑 한 부분 --------------------------------------------

		// 페이징 정보 객체(pageInfo)를 Model 객체에 저장
		//		model.addAttribute("pageInfo", pageInfo);

		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();

		for(ClientVO client : clientList) {
			client.setAddr(client.getAddr().split("/")[0]); // 도로명 주소만 가져오기
			client.setRemarks(client.getRemarks().replace("\r\n", "<br>")); // 출력 시 줄바꿈 처리
			System.out.println(client);
			JSONObject jsonObject = new JSONObject(client);
			System.out.println("거래처 코드 : " + jsonObject.get("business_no"));

			jsonArray.put(jsonObject); // jsonArray 객체에 ClientVO 객체 배열(clientList) 넣기
		}

		JSONObject jsonObjectPage = new JSONObject(pageInfo);
		System.out.println("시작 페이지 : " + jsonObjectPage.get("startPage"));
		jsonArray.put(jsonObjectPage); // jsonArray 객체 마지막에 PageInfo 객체(pageInfo) 넣기

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

		if(sId != null && !sId.equals("")) {  // 세션 아이디 있을 경우

			System.out.println("sId : " + sId);

			// 권한 조회 메서드
			boolean isRightUser = empService.getPrivilege(sId, Privilege.거래처등록);
			System.out.println("거래처등록 권한: " + isRightUser);
			//		    isRightUser = true; // 임시

			if(isRightUser) { // 권한 존재할 경우
				model.addAttribute("priv", "1");

				return "client/client_insert_form"; // 거래처 등록 폼
			} else { // 권한 없을 경우
				model.addAttribute("msg", "권한이 없습니다.");

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

		// 세션 아이디
		String sId;
		if(session.getAttribute("sId") != null) {
			sId = (String)session.getAttribute("sId");
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

		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		if(sId != null && !sId.equals("")) {  // 세션 아이디 있을 경우

			System.out.println("sId : " + sId);

			// 권한 조회 메서드
			boolean isRightUser = empService.getPrivilege(sId, Privilege.거래처등록);
			System.out.println("거래처등록 권한: " + isRightUser);
			//		    isRightUser = true; // 임시

			if(isRightUser) { // 권한 존재할 경우
				model.addAttribute("priv", "1");

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
					//					if(addrArr.length == 2 && addrArr[0] != null) {
					client.setAddr(addrArr[0]);
					//					} else {
					//						client.setAddr("");
					//					}
					if(addrArr.length == 2 && addrArr[1] != null) {
						client.setDetailedAddr(addrArr[1]);
					} else {
						client.setDetailedAddr("");
					}

					System.out.println(client);

					model.addAttribute("client", client); // Model 객체에 ClientVO 객체 저장

					return "client/client_detail_form";

				} else { // 거래처 코드 존재 X
					model.addAttribute("msg", "존재하지 않는 거래처 코드입니다.");
					return "fail_back";
				}

			} else { // 권한 없을 경우
				model.addAttribute("msg", "권한이 없습니다.");
				return "fail_back";
			}

		} else {
			model.addAttribute("msg", "로그인이 필요합니다");
			model.addAttribute("url", "/Login");
			return "redirect"; // 어떻게 alert 후에 보내지? => 해결 by. 하원
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

		// 세션 아이디
		String sId;
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

		if(sId != null && !sId.equals("")) {  // 세션 아이디 있을 경우

			System.out.println("sId : " + sId);

			// 권한 조회 메서드
			boolean isRightUser = empService.getPrivilege(sId, Privilege.거래처등록);
			System.out.println("거래처등록 권한: " + isRightUser);
			isRightUser = true; // 임시

			if(isRightUser) { // 권한 존재할 경우
				model.addAttribute("priv", "1");

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
	// =========================================hawon ===============================================

	//거래처 조회 페이지
	@GetMapping(value = "/Product/ClientSelectList_Out")
	public	String clientSelectList() {
		return "product/client_selectList_outPage";
	}


	// 거래처 목록 조회
	@ResponseBody
	@GetMapping(value = "ClientListJsonOut")
	public void clientListJson_out(
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

//	@RequestMapping("/downloadClientListExcel")
//	public void downloadClientExcel(@RequestParam int pageNum,
//			HttpSession session,
//			HttpServletResponse response) {
//		List<ClientVO> clientList = null;
//		if(pageNum == 1) {
//			System.out.println("현재 페이지만 다운");
//			if(session.getAttribute("stockList_currentPage") instanceof List) { //TODO session객체에 저장될 수 있는 크기 궁금,,
//				clientList = (List<ClientVO>)session.getAttribute("clientList_pageNum");
//			}
//		}else {
//			System.out.println("전체 페이지 다운");
//			clientList = service.getClientList("", "", 1, 100); //// ★★★여기서  List<XXXXVO> 객체리턴받기 밑에서 필요합니다ㅇ
//		}
//		// 현재 날짜 구하기
//		LocalDate now = LocalDate.now();
//		// 포맷 정의 
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
//		int formatedNow = Integer.parseInt(now.format(formatter));
//
//
//		// 워크북 생성
//		Workbook wb = new HSSFWorkbook();
//		sheet = wb.createSheet("재고현황");
//		Row row = null;
//		Cell cell = null;
//		int rowNo = 0;
//
//
//
//		// 테이블 헤더용 스타일
//		CellStyle headStyle = wb.createCellStyle();
//
//		// 가는 경계선
//		headStyle.setBorderTop(BorderStyle.THIN);
//		headStyle.setBorderBottom(BorderStyle.THIN);
//		headStyle.setBorderLeft(BorderStyle.THIN);
//		headStyle.setBorderRight(BorderStyle.THIN);
//
//
//
//		// 배경색 노란색
//		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
//		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//
//
//
//		// 데이터는 가운데 정렬
//		headStyle.setAlignment(HorizontalAlignment.CENTER);
//
//
//
//		// 데이터용 경계 스타일 테두리만 지정
//		CellStyle bodyStyle = wb.createCellStyle();
//		bodyStyle.setBorderTop(BorderStyle.THIN);
//		bodyStyle.setBorderBottom(BorderStyle.THIN);
//		bodyStyle.setBorderLeft(BorderStyle.THIN);
//		bodyStyle.setBorderRight(BorderStyle.THIN);
//
//
//
//		// 헤더 생성 ★★★ 여기!가 맨 윗줄이고 가로로 주르륵 나오는겁니다,,,,,,,,,
//		row = sheet.createRow(rowNo++);
//		cell = row.createCell(0);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("재고번호");
//
//		cell = row.createCell(1);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("상품코드");
//
//		cell = row.createCell(2);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("상품이름");
//
//		cell = row.createCell(3);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("창고명");
//
//		cell = row.createCell(4);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("창고코드");
//
//		cell = row.createCell(5);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("구역명");
//
//		cell = row.createCell(6);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("구역코드");
//
//		cell = row.createCell(7);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("선반명");
//
//		cell = row.createCell(8);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("선반코드");
//
//		cell = row.createCell(9);
//		cell.setCellStyle(headStyle);
//		cell.setCellValue("현재 재고");
//
//
//
//		// 데이터 부분 생성★★★ 여기서 VO객체를 바꿔주시면 될거같아요 !
//
//		for(ClientVO vo : ClientList) {
//			row = sheet.createRow(rowNo++);
//			cell = row.createCell(0);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getStock_cd());
//
//			cell = row.createCell(1);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getProduct_cd());
//
//			cell = row.createCell(2);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getProduct_name());
//
//			cell = row.createCell(3);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getWh_name());
//
//			cell = row.createCell(4);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getWh_cd());
//
//			cell = row.createCell(5);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getWh_area());
//
//			cell = row.createCell(6);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getWh_area_cd());
//
//			cell = row.createCell(7);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getWh_loc_in_area());
//
//			cell = row.createCell(8);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getWh_loc_in_area_cd());
//
//			cell = row.createCell(9);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getStock_qty());
//		}
//
//
//		// response 헤더 설정★★★ 여기서 다른건 건들지 마시고 filename= 뒷부분은 본인 페이지 관련된 이름으로 바꾸면 되는데 한글들어가면 오류나더라구요ㅠㅠ
//		response.setContentType("ms-vnd/excel");
//		response.setHeader("Content-Disposition", "attachment;filename="+formatedNow+"_client.xls");//★★filename= 뒷부분이  저장되는 파일명
//
//
//		// 엑셀 출력
//
//		try {
//			wb.write(response.getOutputStream());
//
//			wb.close();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//
//	}

}














