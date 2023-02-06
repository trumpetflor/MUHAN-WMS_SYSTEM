package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.EmployeesMapper;
import com.thisteam.muhansangsa.mapper.ProductMapper;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.Product_group_bottomVO;

@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;
	
	//품목 등록
	public int prodInsertPro(ProductVO product) {
		return mapper.insertProduct(product);
	}

	//그룹명(코드) 목록 조회
	public List<Product_group_bottomVO> getGroupList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectGroupList(searchType, keyword, startRow, listLimit);
	}

	//품목 목록(리스트) 조회
	public List<ProductVO> getProductList(String keyword, String searchType, int startRow, int listLimit) {
		return mapper.selectProductList(keyword, searchType, startRow, listLimit);
	}

	//품목 목록 수량 조회
	public int getProductListCount(String keyword, String searchType) {
		return mapper.selectProductListCount(keyword, searchType);
	}

	//품목 그룹 목록 상세조회 페이지 출력용
	public ProductVO getProdUpdate(int product_cd) {
		return mapper.selectProdUpdate(product_cd);
	}

	//품목 상세정보 수정 진행(update)
	public int ProdUpdatePro(ProductVO product) {
		return mapper.updateProdUpdate(product);
	}

	//품목 그룹 신규 등록(Modal) 
	public int prodGroupBottomNameInsertPro(String product_group_bottom_name) {
		return mapper.insertProdGroupBottomNameInsert(product_group_bottom_name);
	}

}















