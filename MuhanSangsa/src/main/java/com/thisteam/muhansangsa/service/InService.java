package com.thisteam.muhansangsa.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.InMapper;

import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InVO;




@Service
public class InService {

	@Autowired
	private InMapper mapper;


	public List<inProcessingVO> getInProList() {
		return mapper.selectInProList();
	}
	public List<ClientVO> getClientList() {
		return mapper.getClientList();
	}

	public List<EmployeesVO> getEmployeeList() {
		return mapper.getEmployeeList();
	}

	public List<InVO> getInList() {
		return mapper.getInList();
	}
	







}







