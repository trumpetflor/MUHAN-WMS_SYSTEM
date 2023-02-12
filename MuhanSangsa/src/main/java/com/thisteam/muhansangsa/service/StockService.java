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

	// ---------------------23/02/11 페이징 처리 추가
	// 재고이력 목록 조회 
	public List<StockHistoryViewVO> getStockHistoryList(int stock_cd, String keyword, String searchType, int startRow, int listLimit) {
		System.out.println("서비스로 넘어온 " + stock_cd + listLimit + keyword+ searchType);
		return mapper.selectHistoryList(stock_cd, keyword, searchType, startRow, listLimit);
	}
	// ---------------------23/02/11 페이징 처리 추가
	
	// 이동 & 조정수량 입력을 통한 재고 수량 변경
	public int setStockQty(int stock_cd, int qty) {
		System.out.println("서비스로 넘어온 " + qty );
		return mapper.updateStockQty(stock_cd, qty);
	}

	// sId를 통한 사원번호 조회
	public String getEmpNum(String sId) {
		return mapper.selectEmpNum(sId);
	}
	
	// 재고 이력 페이지를 위한 stockHistoryVO 타입 리스트 생성 
	public int setStockHistory(StockHistoryVO stockHistory) {
		return mapper.insertStockHistory(stockHistory);
	}
	
	//��ǰ �˻�
	public List<Stock_viewVO> getProductAtSameLoc(int product_cd) {
		
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

	public List<Wms_wh_viewVO> getWhAreaLocationList(int product_cd, int wh_area_cd) {
		// TODO Auto-generated method stub
		return mapper.selectWhAreaLocationList(product_cd, wh_area_cd);
	}

	public int InsertNewStockCd(int product_cd, int wh_loc_in_area_cd) {
		// TODO Auto-generated method stub
		return mapper.insertNewStock(product_cd,wh_loc_in_area_cd);
	}

	//페이징처리를 위한  재고리스트 총 개수 조회
	public int getStockListCount(String searchType, String keyword) {
		return mapper.selectStockListCount(searchType,keyword);
	}
	
	//==========================================================================================
	
	// WMS 창고 관리 페이지 속 재고 리스트 조회 (창고별, 창고 구역별, 창고 구역 내 위치별)
	public List<Stock_viewVO> getWmsStockList(
			String searchType, String keyword, int startRow, int listLimit,
			String wh_cd, int wh_area_cd, int wh_loc_in_area_cd) {
		return mapper.selectWmsStockList(searchType, keyword, startRow, listLimit,
											wh_cd, wh_area_cd, wh_loc_in_area_cd);
 }

	// 기존재고수량에서 이동수량만큼 차감 & 이동 대상 재고의 수량 증감
	public int setTargetStockQty(int sourceStockCd, int targetStockCd, int stockQty) {
		return mapper.updateTargetStockQty(sourceStockCd, targetStockCd, stockQty);

	}


	// --------------------------------------------------------23/02/11 추가
	
	// inventoryHistoryView 페이징 처리를 위한 게시물 수 조회
	public int getinventoryHistoryViewListCount(String searchType, String keyword, int stock_cd) {
		System.out.println("페이징 처리를 위해 넘어온 historylistcount " + stock_cd);
		return mapper.selectinventoryHistoryViewListCount(searchType,keyword,stock_cd);
	}

	// --------------------------------------------------------23/02/11 추가
	
	


	
	
	
	
}
