package com.thisteam.muhansangsa.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.thisteam.muhansangsa.service.WMSWhService;
import com.thisteam.muhansangsa.service.WarehouseService;
import com.thisteam.muhansangsa.vo.WarehouseVO;
import com.thisteam.muhansangsa.vo.WhAreaVO;
import com.thisteam.muhansangsa.vo.WhLocAreaVO;

@Controller
public class WMSWhController {
	
	@Autowired
	private WMSWhService service;
	@Autowired
	private WarehouseService whService;
	
	@GetMapping(value = "WmsWarehouse")
	public String wmsWarehouse(
			Model model,
			HttpSession session
			) {
		
		List<WarehouseVO> whList = null; // 창고 목록
		List<WhAreaVO> whaList = null; // 창고 구역 목록
		HashMap<String, List<WhAreaVO>> whWhaList = null; // 특정 창고에 해당하는 창고 구역의 목록
		List<WhLocAreaVO> whlaList = null; // 창고 구역 내 위치 목록
		HashMap<String, List<WhLocAreaVO>> whWhlaList = null; // 특정 창고 구역에 해당하는 창고 구역 내 위치 목록
		
		// 창고 가져오기
		whList = whService.getWarehouseList();
		
		whWhaList = new HashMap<String, List<WhAreaVO>>(); // <창고 코드, 창고 코드에 해당하는 창고 구역 목록>
		whWhlaList = new HashMap<String, List<WhLocAreaVO>>(); // <창고 구역, 창고 구역에 해당하는 위치 목록>
		
		for(WarehouseVO wh : whList) { // 모든 창고 목록에 접근
			
			String wh_cd = wh.getWh_cd(); // 창고 코드 변수에 저장
			String wh_name = wh.getWh_name(); // 창고 이름 변수에 저장
			
			whaList = service.getWhAreaList(wh_cd); // 해당 창고의 창고 구역 가져오기
			whWhaList.put(wh_name, whaList); // 특정 창고에 해당하는 창고 구역 목록을 저장
			
			for(WhAreaVO wha : whaList) { // 모든 창고 구역 목록에 접근
				
				int wh_area_cd = wha.getWh_area_cd(); // 창고 구역 코드 변수에 저장
				String wh_area = wha.getWh_area(); // 창고 구역 변수에 저장
				
				whlaList = service.getWhLocAreaList(wh_area_cd); // 해당 창고 구역 내 위치 가져오기
				
				whWhlaList.put(wh_area, whlaList); // 특정 창고 구역에 해당하는 창고 구역 내 위치 목록을 저장
				
			}
			
		
		}
		
		model.addAttribute("whList", whList);
		model.addAttribute("whWhaList", whWhaList);
		model.addAttribute("whWhlaList", whWhlaList);
		
		// Wms_wh_viewVO 사용
//		List<Wms_wh_viewVO> whViewList = service.getWhViewList();
//		
//		model.addAttribute("whViewList", whViewList);
		
		return "wms_wh/wms_list";
		
	}
	
	

}














