package com.thisteam.muhansangsa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thisteam.muhansangsa.service.WarehouseService;
import com.thisteam.muhansangsa.vo.WarehouseVO;

@Controller
public class WarehouseController {
	
	@Autowired
	private WarehouseService service;
	
	// 창고 등록 폼
	@GetMapping(value = "/WarehouseInsertForm")
	public String insert(HttpSession session, Model model) {
//		System.out.println("/////////////////insertForm/////////////////");
		
		// 권한 = 물류팀
//		String sId = (String)session.getAttribute("sId");
//		System.out.println(sId);
//		String privilege = service.getWhPrivilege(sId);
//		
//		if(privilege != "03") { // 권한 없음
//			model.addAttribute("msg", "물류팀만 가능합니다!");
//			return "fail_back";
//		} else { // 물류팀
			return "Warehouse/warehouse_insert_form";
//		}
		
	}
	
	// 창고 등록 작업
	@PostMapping(value = "/WarehouseInsertPro")
	public String insertPro(@ModelAttribute WarehouseVO warehouse,
							Model model,
							HttpSession session) {
//		System.out.println("/////////////////insertPro/////////////////");
//		System.out.println(warehouse);
		
		// 권한 = 물류팀
		String sId = (String)session.getAttribute("sId");
		String privilege = service.getWhPrivilege(sId);
		
		if(privilege != "03") { // 권한 없음
			model.addAttribute("msg", "물류팀만 가능합니다!");
			return "fail_back";
		} else { // 물류팀
			
			// 창고 등록
			int insertCount = service.registerWarehouse(warehouse);
			
			if(insertCount > 0) { // 성공
				return "redirect:/WarehouseList";
			} else { // 실패
				model.addAttribute("msg", "등록 실패!");
				return "fail_back";
			}
			
		}
		
	}
	
	// 창고 조회
	@GetMapping(value = "/WarehouseList")
	public String list(Model model, HttpSession session) {
//		System.out.println("/////////////////List/////////////////");
		
		// 권한 = 물류팀
//		String sId = (String)session.getAttribute("sId");
//		String privilege = service.getWhPrivilege(sId);
		
//		if(privilege != "03") { // 권한 없음
//			model.addAttribute("msg", "물류팀만 가능합니다!");
//			return "fail_back";
//		} else { // 물류팀
			
			// 조회
			List<WarehouseVO> whList = service.getWarehouseList();
	//		System.out.println(whList);
			model.addAttribute("whList", whList);
			
			return "Warehouse/warehouse_list";
//		}
		
	}
	
	// 창고 수정 폼
	@GetMapping(value = "/WarehouseModifyForm")
	public String modify(@ModelAttribute WarehouseVO warehouse,
						@RequestParam String wh_cd,
						Model model) {
		
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
	public void check(@RequestParam String wh_man_name,
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
	
}













