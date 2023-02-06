package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.StockMapper;
import com.thisteam.muhansangsa.vo.StockHistoryVO;
import com.thisteam.muhansangsa.vo.StockHistoryViewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;
import com.thisteam.muhansangsa.vo.WarehouseVO;
import com.thisteam.muhansangsa.vo.WhAreaVO;
import com.thisteam.muhansangsa.vo.Wms_wh_viewVO;

@Service
public class StockService {

	@Autowired
	private StockMapper mapper;

	public List<Stock_viewVO> getStockList(String searchType, String keyword,int startRow, int listLimit) {
		// TODO Auto-generated method stub
		return mapper.selectStockList(searchType, keyword, startRow, listLimit);
	}

	// 재고이력 목록 조회 
	public List<StockHistoryViewVO> getStockHistoryList(int stock_cd) {
		return mapper.selectHistoryList(stock_cd);
	}

	// 이동 & 조정수량 입력을 통한 재고 수량 변경
	public int setStockQty(int stock_cd, int totalStockQty) {
		System.out.println("서비스로 넘어온 " + totalStockQty );
		return mapper.updateStockQty(stock_cd, totalStockQty);
	}

	// sId를 통한 사원번호 조회
	public String getEmpNum(String sId) {
		return mapper.selectEmpNum(sId);
	}
	
	// 재고 이력 페이지를 위한 stockHistoryVO 타입 리스트 생성 
	public List<StockHistoryVO> setStockHistory(StockHistoryVO stockHistory) {
		return mapper.insertStockHistory(stockHistory);
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
