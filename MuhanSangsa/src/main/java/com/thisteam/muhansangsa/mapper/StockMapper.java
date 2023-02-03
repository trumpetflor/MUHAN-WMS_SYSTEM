package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.Stock_viewVO;

public interface StockMapper {

	List<Stock_viewVO> selectStockList(@Param("searchType") String searchType, 
										@Param("keyword") String keyword,
										@Param("startRow") int startRow, 
										@Param("listLimit") int listLimit);




	
	
}
