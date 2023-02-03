package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.StockMapper;
import com.thisteam.muhansangsa.vo.Stock_viewVO;

@Service
public class StockService {

	@Autowired
	StockMapper mapper;

	public List<Stock_viewVO> getStockList(String searchType, String keyword,int startRow, int listLimit) {
		// TODO Auto-generated method stub
		return mapper.selectStockList(searchType, keyword, startRow, listLimit);
	}
	
	
	
	
}
