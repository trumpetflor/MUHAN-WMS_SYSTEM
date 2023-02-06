package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.StockMapper;
import com.thisteam.muhansangsa.vo.Stock_viewVO;
import com.thisteam.muhansangsa.vo.WarehouseVO;
import com.thisteam.muhansangsa.vo.WhAreaVO;
import com.thisteam.muhansangsa.vo.Wms_wh_viewVO;

@Service
public class StockService {

	@Autowired
	StockMapper mapper;

	public List<Stock_viewVO> getStockList(String searchType, String keyword,int startRow, int listLimit) {
		// TODO Auto-generated method stub
		return mapper.selectStockList(searchType, keyword, startRow, listLimit);
	}
	
	//��ǰ �˻�
	public List<Stock_viewVO> getProductAtSameLoc(String product_cd) {
		
		return mapper.selectProductInLoc(product_cd);
	}
	
	


	public List<WarehouseVO> getWarehouseList() {
		// TODO Auto-generated method stub
		return mapper.selectWarehouseList();
	}

	public List<WhAreaVO> getWarehouseAraList(String wh_cd) {
		// TODO Auto-generated method stub
		return mapper.selectWarehouseAraList(wh_cd);
	}

	public List<Stock_viewVO> getSelectedStock(int[] stock_cd) {
		// TODO Auto-generated method stub
	
		return mapper.selectSelectedStock(stock_cd);
	}

	public List<Wms_wh_viewVO> getWhAreaLocationList(String product_cd, int wh_area_cd) {
		// TODO Auto-generated method stub
		return mapper.selectWhAreaLocationList(product_cd, wh_area_cd);
	}

	public int InsertNewStockCd(String product_cd, String wh_loc_in_area_cd) {
		// TODO Auto-generated method stub
		return mapper.insertNewStock(product_cd,wh_loc_in_area_cd);
	}
	
	
	
	
}
