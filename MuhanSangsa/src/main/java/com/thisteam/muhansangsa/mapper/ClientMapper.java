package com.thisteam.muhansangsa.mapper;

import java.util.List;

import com.thisteam.muhansangsa.vo.ClientVO;

public interface ClientMapper {

	// 거래처 등록
	int insertClient(ClientVO client);
	
	// 거래처 목록 조회
	List<ClientVO> selectClientList();

}













