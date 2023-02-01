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
	
	// 거래처 코드 조회 (중복 확인)
	public ClientVO duplicateBn(String business_no) {
		return mapper.selectBusinessNo(business_no);
	}

	// 거래처 상세 정보 조회
	public ClientVO getClientDetail(String business_no) {
		return mapper.selectClient(business_no);
	}

}















