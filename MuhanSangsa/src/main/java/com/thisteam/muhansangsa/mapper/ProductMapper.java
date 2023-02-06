package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.Product_group_bottomVO;

public interface ProductMapper {

	//1. 품목 등록
	int insertProduct(ProductVO product);

	//2. 품목 등록 내 그룹명(코드) 목록 조회
	List<Product_group_bottomVO> selectGroupList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	//3. 품목 목록(리스트) 조회
	List<ProductVO> selectProductList(			
			@Param("keyword") String keyword, 
			@Param("searchType") String searchType, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	
	//4. 품목 목록 수량 조회
	int selectProductListCount(
			@Param("keyword") String keyword, 
			@Param("searchType") String searchType);

	//5-1. 품목 그룹 목록 상세조회 페이지 출력용
	ProductVO selectProdUpdate(int product_cd);

	//6. 품목 상세정보 수정 진행(update)
	int updateProdUpdate(ProductVO product);
	
	//2-2. 품목 그룹 신규 등록(Modal) 
	int insertProdGroupBottomNameInsert(String product_group_bottom_name);

}













