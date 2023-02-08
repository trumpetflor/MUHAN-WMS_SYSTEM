package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.OutMapper;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;

@Service
public class OutService {

	@Autowired
	OutMapper mapper;
	//=====================================================================================================
	//==============================================hawon ================================================
	public List<Emp_viewVO> searchEmp(String keyword) {
		// TODO Auto-generated method stub
		return mapper.selectEmp(keyword);
	}
	
	//재고리스트에 있는 상품 검색
	public List<Stock_viewVO> getproduct_stockExist() {
		// TODO Auto-generated method stub
		return mapper.selectProductStockExist();
	}
	
	
	
	//=====================================================================================================

}















