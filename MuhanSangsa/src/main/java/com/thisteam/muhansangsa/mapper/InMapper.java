package com.thisteam.muhansangsa.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.muhansangsa.vo.ClientVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.InVO;
import com.thisteam.muhansangsa.vo.InWatingRegister_nomalVO;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.inProcessingVO;
import com.thisteam.muhansangsa.vo.inRegisterVO;

public interface InMapper {
	
	// ======================== yeram ==============================
	// 입고예정 목록
	public List<inProcessingVO> selectInProList();
	
	// 입고처리 폼(입고버튼)
	public List<inRegisterVO> selectInRegisterList(@Param("in_schedule_cd")ArrayList<String> in_schedule_cd,
			@Param("product_name")ArrayList<String> product_name,
			@Param("in_date")ArrayList<String> in_date);
	
	// ======================== yeram ==============================
	
	// ======================== sangwoo ============================
	List<ClientVO> getClientList(@Param("keyword") String keyword, @Param("searchType") String searchType);

	List<EmployeesVO> getEmployeeList(@Param("keyword") String keyword, @Param("searchType") String searchType);

	List<InVO> getInList();

	List<ProductVO> getProductList(String businese_no_ajax);

	public String getLastNum();

	public String in_schedule_cd_Index(@Param("today") int today);

	public int registInScheduleTop(@Param("in_schedule") InWatingRegister_nomalVO in_schedule);

	public int registInScheduleBottom(@Param("in_schedule_p") InVO isp);

	public List<InVO> selectInScheduleList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit, 
			@Param("status") int status);

	public int inWaitingChangeStautsJson(
			@Param("in_schedule_cd") String in_schedule_cd, 
			@Param("in_complete") String in_complete);

	public List<inProcessingVO> getProQtyList(@Param("iscd") String in_schedule_cd);



	



}













