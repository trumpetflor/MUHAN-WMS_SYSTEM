package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.thisteam.muhansangsa.service.InService;
import com.thisteam.muhansangsa.vo.inProcessingVO;

@Controller
public class InController {
	
	private static final Logger logger = LoggerFactory.getLogger(InController.class);
	
	@Autowired
	private InService service;
	
	
	// ======================== yeram ==============================
	
	@GetMapping(value = "/InScheduleInsert")
	public String processing(Model model) {
		
		List<inProcessingVO> inProList = service.getInProList();
		
		model.addAttribute("inProList", inProList);
		
		return "in/in_processing";
	}
	
	@GetMapping(value = "/InRegisterForm")
	public String register(Model model) {
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
	
}
