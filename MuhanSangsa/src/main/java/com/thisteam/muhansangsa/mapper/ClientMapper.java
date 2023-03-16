package com.thisteam.muhansangsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.ClientVO;

public interface ClientMapper {

	// 거래처 등록
	int insertClient(ClientVO client);
	
	// 거래처 목록 조회
	List<ClientVO> selectClientList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 거래처 코드 조회 (중복 확인)
	ClientVO selectBusinessNo(String business_no);

	// 거래처 상세 정보 조회
	ClientVO selectClient(String business_no);

	// 거래처 정보 수정
	int updateClient(@Param("business_no") String originBn, @Param("client") ClientVO client);

	// 거래처 목록 갯수 계산 (페이징 처리)
	int selectClientListCount(@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 거래처 상세 목록 조회
	List<ClientVO> selectClientDetailList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);
	
	

	
}













