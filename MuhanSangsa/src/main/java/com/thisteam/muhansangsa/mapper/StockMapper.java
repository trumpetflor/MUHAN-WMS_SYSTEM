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

	List<Stock_viewVO> selectProductInLoc(String product_cd);

	List<WarehouseVO> selectWarehouseList();

	List<WhAreaVO> selectWarehouseAraList(String wh_cd);

	List<Stock_viewVO> selectSelectedStock(@Param("stock_cd")int[] stock_cd);

	//창고구역내 선반 조회(동일한 상품 없는 선반만)
	List<Wms_wh_viewVO> selectWhAreaLocationList(@Param("product_cd") String product_cd,
												@Param("wh_area_cd") int wh_area_cd);
	
	
	//새 재고번호 생성
	int insertNewStock(@Param("product_cd") String product_cd,
						@Param("wh_loc_in_area_cd") int wh_loc_in_area_cd);

	
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
