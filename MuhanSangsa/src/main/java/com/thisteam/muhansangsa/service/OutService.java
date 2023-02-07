package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.OutMapper;
import com.thisteam.muhansangsa.vo.Emp_viewVO;

@Service
public class OutService {

	@Autowired
	OutMapper mapper;
	//=====================================================================================================
	//==============================================hawon ================================================
	public List<Emp_viewVO> searchEmp(String keyword) {
		// TODO Auto-generated method stub
		return mapper.selectEmp(keyword);
	}
	
	
	
	//=====================================================================================================

}















