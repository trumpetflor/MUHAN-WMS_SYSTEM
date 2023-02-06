package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.StockHistoryVO;
import com.thisteam.muhansangsa.vo.StockHistoryViewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;
import com.thisteam.muhansangsa.vo.WarehouseVO;
import com.thisteam.muhansangsa.vo.WhAreaVO;
import com.thisteam.muhansangsa.vo.Wms_wh_viewVO;

public interface StockMapper {

	List<Stock_viewVO> selectStockList(@Param("searchType") String searchType, 
										@Param("keyword") String keyword,
										@Param("startRow") int startRow, 
										@Param("listLimit") int listLimit);

	
	// 재고이력 목록 조회 
	List<StockHistoryViewVO> selectHistoryList(int stock_cd);

	// 이동 & 조정수량 입력을 통한 재고 수량 변경
	int updateStockQty(
			@Param("stock_cd") int stock_cd, 
			@Param("qty") int totalStockQty);

	// sId를 통한 사원번호 조회
	String selectEmpNum(String sId);

	// 재고 이력 페이지를 위한 stockHistoryVO 타입 리스트 생성
	List<StockHistoryVO> insertStockHistory(
			@Param("stock") StockHistoryVO stockHistory);



	
	
}
