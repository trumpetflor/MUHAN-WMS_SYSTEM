package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.StockHistoryViewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;

public interface StockMapper {

	List<Stock_viewVO> selectStockList(@Param("searchType") String searchType, 
										@Param("keyword") String keyword,
										@Param("startRow") int startRow, 
										@Param("listLimit") int listLimit);

	
	// 재고이력 목록 조회 
	List<StockHistoryViewVO> selectHistoryList(int stockCode);

	// 이동 & 조정수량 입력을 통한 재고 수량 변경
	int updateStockQty(String stock_cd, int qty);

	// sId를 통한 사원번호 조회
	String selectEmpNum(String sId);





	
	
}
