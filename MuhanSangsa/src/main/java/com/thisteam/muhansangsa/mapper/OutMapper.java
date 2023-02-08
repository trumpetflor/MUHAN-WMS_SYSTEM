package com.thisteam.muhansangsa.mapper;

import java.util.List;

import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.Stock_viewVO;

public interface OutMapper {

	// ======================================== hawon =================================================
	List<Emp_viewVO> selectEmp(String keyword);

	
	List<Stock_viewVO> selectProductStockExist();

	// =================================================================================================
}













