package com.thisteam.muhansangsa.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	// 입고처리 폼(입고버튼)
	@PostMapping(value = "/InRegister")
//	@RequestMapping(value = "/InRegister", method = {RequestMethod.GET, RequestMethod.POST})
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
		System.out.println("in_schedule_cd :" + in_schedule_cd);
		System.out.println("product_name :" + product_name);
		System.out.println("in_date :" + in_date);
		
		List<inRegisterVO> resultList = service.getInRegisterList(in_schedule_cd, product_name, in_date);
		
		System.out.println(resultList);
		model.addAttribute("resultList", resultList);
		
		
//		try {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("window.open('InRegisterForm','InRegisterForm','width=1000, height=920,location=no,status=no,scrollbars=yes');");
//			out.println("</script>");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		return "in/in_register_form";
		
	}
	
	@GetMapping("/InRegisterForm")
	public String registerForm() {
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
