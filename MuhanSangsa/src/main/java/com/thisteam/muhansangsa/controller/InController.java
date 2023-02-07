package com.thisteam.muhansangsa.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.thisteam.muhansangsa.service.InService;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InVO;
import com.thisteam.muhansangsa.vo.inProcessingVO;
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
	
	// 입고처리 폼
	@GetMapping(value = "/InRegister")
	public String register(String[] inRegisterList, Model model, inRegisterVO vos) {
		System.out.println("inRegisterList : " + Arrays.toString(inRegisterList));
		
		String[] listA = {};
//		String[] listB = {};
//		String[] listC = {};
		
		for(int i = 0; i<inRegisterList.length; i++) {
			String a = inRegisterList[i];
			listA[i] = a.split("/")[0];
//			listB = a.split("/");
//			listC = a.split("/");
		}
		System.out.println("listA :" +Arrays.toString(listA));
//		System.out.println("listB :" +Arrays.toString(listB));
//		System.out.println("listC :" +Arrays.toString(listC));
		
//		String[] codeList = {};
//		String list = "";
//		String[] proList;
//		String[] dateList;
//		String list="";
//		for(String list : inRegisterList) {
//			System.out.println("list : " +list);
////			for(int i=0; i<list.length(); i++) {
////				codeList[i] = list[i].split("/", 1);
////			}
//			codeList = list.split("/");
////			System.out.println(code);
//			System.out.println("codeList :" +Arrays.toString(codeList));
//		}
//		String list = inRegisterList[0];
//		String list2 = inRegisterList[1];
//		String code = list.split("/")[0];
//		String code2 = list2.split("/")[0];
		
//		for(int i =0; i<inRegisterList.length; i++) {
//			listA = inRegisterList[
//		}
//		System.out.println("list : " + list);
//		System.out.println("code : " + code);
//		System.out.println("list2 : " + list2);
//		System.out.println("code2 : " + code2);
//		for(int i =0; i<inRegisterList.length; i++) {
//			System.out.println("inRegisterList : " + inRegisterList[i]);
//			list = 
////			for(int j=0; j<)
////			listA[i] = inRegisterList[i].split("/")[0];
////			listB[i] = inRegisterList[i].split("/")[1];
////			listC[i] = inRegisterList[i].split("/")[2];
//			
////			list = inRegisterList[i];
////			for(int j = 0; j)
//		}
//		for(int i = 0; i<list.length(); i++	) {
//			codeList[i] = list.split("/")[0];
//		}
//		System.out.println("codeList :" +Arrays.toString(listA));
//		System.out.println("codeList :" +Arrays.toString(listB));
//		System.out.println("codeList :" +Arrays.toString(listC));
		
//		String[] codeList = list("/");
		
//		for(List<inRegisterVO> inList : inRegiseterList) {
//			System.out.println(inList);
//		}
//		List<inRegisterVO> resultList = service.getInRegisterList(inRegisterList);
//		System.out.println("in_schedule_cd : " + resultList);
//		model.addAttribute("inRegisterList", resultList);
		
		return "in/in_register_form";
	}
	
	// 입고처리 저장 버튼
	@GetMapping("/InRegisterPro")
	public void registerPro() {
		
	}
	
	// 입고처리 수정 페이지
	@GetMapping("/InProcessingModifyForm")
	public String modify() {
		
		
		return "in/in_processing_modify";
	}
	
	
	
	
//	@GetMapping(value = "/InWaiting")
//	public void waiting(HttpServletResponse response) {
//		try {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
////			out.print("<jsp:include page='in_waiting_form.jsp'></jsp:include>");
////			out.print("&lt;jsp:include page='in_waiting_form.jsp'&gt;&lt;/jsp:include&gt;");
////			out.print("<%@include file='in_waiting_form.jsp'%>");
//			out.print("&lt;%@include file='in_waiting_form.jsp'%&gt;");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
	
//	@PostMapping(value = "/InWaiting")
//	public void waiting(HttpServletResponse response) {
//		try {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print("<jsp:include page='in_waiting_form.jsp'></jsp:include>");
////			out.print("&lt;jsp:include page='in_waiting_form.jsp'&gt;&lt;/jsp:include&gt;");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
	
//	@GetMapping(value = "/InWaiting")
//	public String waiting() {
//		return "<jsp:include page='in_waiting_form.jsp'></jsp:include>";
//	}
	
//	@PostMapping(value = "/InWaiting")
//	public String waiting(Locale locale) {
//		logger.info("InWaiting", locale);
//		
//		return "in_waiting_form";
//	}
	
	
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
		List<ClientVO> clientList = service.getClientList();
		List<EmployeesVO> employeeList = service.getEmployeeList();
		model.addAttribute("clientList",clientList);
		model.addAttribute("empList", employeeList);
		return "in/in_waiting_insert";
	}
	
	
	
	
	// ======================== sangwoo ============================
  
}
