package com.thisteam.muhansangsa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.WhAreaMapper;
import com.thisteam.muhansangsa.mapper.WhLocAreaMapper;

@Service
public class WMSWhService {

	@Autowired
	WhAreaMapper areaMapper;
	@Autowired
	WhLocAreaMapper locMapper;
	
	
}
