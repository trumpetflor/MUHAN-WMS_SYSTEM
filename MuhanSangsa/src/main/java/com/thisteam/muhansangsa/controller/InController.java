package com.thisteam.muhansangsa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	@GetMapping(value = "/InProcessing")
	public String processing(Model model) {
		
		List<inProcessingVO> inProList = service.getInProList();
		
		model.addAttribute("inProList", inProList);
		
		return "in/in_processing";
	}
	
	@GetMapping(value = "/InRegisterForm")
	public String register(String[] in_schedule_cd, Model model) {
		//일단 in_register_view => VO 만들어야함
		//체크박스에 체크된 입고예정코드를 받아와서 검색해서
		
		List<inRegisterVO> inRegisterList = service.getInRegisterList(in_schedule_cd);
		
		model.addAttribute("inRegisterList", inRegisterList);
		
		return "in/in_register_form";
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
