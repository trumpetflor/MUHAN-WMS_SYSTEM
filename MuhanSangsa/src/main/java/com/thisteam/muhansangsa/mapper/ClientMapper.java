package com.thisteam.muhansangsa.mapper;

import java.util.List;

import com.thisteam.muhansangsa.vo.ClientVO;

public interface ClientMapper {

	// 거래처 등록
	int insertClient(ClientVO client);
	
	// 거래처 목록 조회
	List<ClientVO> selectClientList();

	// 거래처 코드 조회 (중복 확인)
	ClientVO selectBusinessNo(String business_no);

	// 거래처 상세 정보 조회
	ClientVO selectClient(String business_no);

}













