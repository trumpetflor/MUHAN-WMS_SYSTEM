package com.thisteam.muhansangsa.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.InMapper;
import com.thisteam.muhansangsa.vo.inProcessingVO;




@Service
public class InService {

	@Autowired
	private InMapper mapper;

	public List<inProcessingVO> getInProList() {
		return mapper.selectInProList();
	}
	







}







