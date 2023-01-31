package com.thisteam.muhansangsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thisteam.muhansangsa.mapper.ClientMapper;
import com.thisteam.muhansangsa.vo.ClientVO;

@Service
public class ClientService {

	@Autowired
	ClientMapper mapper;
	
	// 거래처 등록
	public int insertClient(ClientVO client) {
		return mapper.insertClient(client);
	}
	
	// 거래처 목록 조회
	public List<ClientVO> getClientList() {
		return mapper.selectClientList();
	}

}















