package com.thisteam.muhansangsa.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.InMapper;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InVO;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.inRegisterVO;




@Service
public class InService {

	@Autowired
	private InMapper mapper;
	
	// ======================== yeram ==============================
	// 입고예정목록
	public List<inProcessingVO> getInProList() {
		return mapper.selectInProList();
	}
	
	// 입고처리 폼(입고버튼)
	public List<inRegisterVO> getInRegisterList(ArrayList<String> in_schedule_cd,
			ArrayList<String> product_name,
			ArrayList<String> in_date) {
		return mapper.selectInRegisterList(in_schedule_cd, product_name,in_date);
	}
	
	
	
	
	
	
	// ======================== yeram ==============================
	
	
	
	// ======================== sangwoo ============================
	
	public List<ClientVO> getClientList(String keyword, String searchType) {
		return mapper.getClientList(keyword, searchType);
	}

	public List<EmployeesVO> getEmployeeList(String keyword, String searchType) {
		return mapper.getEmployeeList(keyword, searchType);
	}

	public List<InVO> getInList() {
		return mapper.getInList();
	}
	public List<ProductVO> getProductList(String business_no) {
		return mapper.getProductList(business_no);
	}



	// ======================== sangwoo ============================



}







