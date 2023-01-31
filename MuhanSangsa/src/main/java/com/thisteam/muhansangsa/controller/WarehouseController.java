package com.thisteam.muhansangsa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.thisteam.muhansangsa.service.WarehouseService;
import com.thisteam.muhansangsa.vo.WarehouseVO;

@Controller
public class WarehouseController {
	
	@Autowired
	private WarehouseService service;
	
	// 창고 등록 폼
	@GetMapping(value = "/WarehouseInsertForm")
	public String insert() {
//		System.out.println("/////////////////insertForm/////////////////");
		return "Warehouse/warehouse_insert_form";
	}
	
	// 창고 등록 작업
	@PostMapping(value = "/WarehouseInsertPro")
	public String insertPro(@ModelAttribute WarehouseVO warehouse, Model model) {
//		System.out.println("/////////////////insertPro/////////////////");
//		System.out.println(warehouse);
		int insertCount = service.registerWarehouse(warehouse);
		
		if(insertCount > 0) { // 성공
			// 창고.... 조회로 가야하나?
			return "redirect:/";
		} else { // 실패
			model.addAttribute("msg", "가입 실패!");
			return "fail_back";
		}
		
	}
	
	// 창고 조회
	@GetMapping(value = "/WarehouseList")
	public String list(Model model) {
//		System.out.println("/////////////////List/////////////////");
		
		List<WarehouseVO> whList = service.getWarehouseList();
//		System.out.println(whList);
		model.addAttribute("whList", whList);
		
		
		return "Warehouse/warehouse_list";
	}
	
	
}













