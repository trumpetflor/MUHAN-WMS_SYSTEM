package com.thisteam.muhansangsa.vo;

import java.sql.Date;

/*
	[Out_scheduleVO 출고 예정 테이블]
	
	Field          |Type         |Null|Key|Default|Extra|
	---------------+-------------+----+---+-------+-----+
	OUT_SCHEDULE_CD|varchar(20)  |NO  |PRI|       |     |
	BUSINESS_NO    |varchar(30)  |NO  |MUL|       |     |
	EMP_NUM        |varchar(10)  |NO  |MUL|       |     |
	OUT_DATE       |date         |NO  |   |       |     |
	REMARKS        |varchar(2000)|NO  |   |       |     |
	OUT_COMPLETE   |varchar(1)   |NO  |   |       |     |

------------------------------------------------------------
	
		<출고 예정 품목 - OUT_SCHEDULE_PER_PRODUCT>
	Field           |Type         |Null|Key|Default|Extra|
	----------------+-------------+----+---+-------+-----+
	OUT_SCHEDULE_CD |varchar(20)  |NO  |MUL|       |     |
	PRODUCT_CD      |int          |NO  |MUL|       |     |
	OUT_SCHEDULE_QTY|int          |NO  |   |       |     |
	OUT_QTY         |int          |NO  |   |       |     |
	OUT_DATE        |date         |NO  |   |       |     |
	REMARKS         |varchar(2000)|NO  |   |       |     |
	STOCK_CD        |int          |NO  |MUL|       |     |
	OUT_COMPLETE    |varchar(1)   |NO  |   |       |     |

*/


public class Out_scheduleListVO { //출고예정 테이블

	//--------Out_scheduleVO 테이블에서 조회 --------------
	private String out_schedule_cd; //출고 예정 코드
	private String business_no; //거래처 코드
	private String cust_name; //거래처명
	private String emp_num; // 담당자(사원번호)
	private String emp_name; // 담당자(사원번호)
	private String remarks; //적요
	//----하단은 (OUT_SCHEDULE_PER_PRODUCT) 테이블에서 조회 -------
	private int product_cd; //품목코드 (OUT_SCHEDULE_PER_PRODUCT)
	private String product_name; // 품목명 PRODUCT 테이블과 조인함!
	private int out_schedule_qty; //출고예정수량
	private int out_qty; //출고 수량
	private Date out_date;  // 납기일자 (테이블 중복)
	private String stock_cd; //재고번호
	private String out_complete; //진행상태 (테이블 중복)
	
	public String getOut_schedule_cd() {
		return out_schedule_cd;
	}
	public void setOut_schedule_cd(String out_schedule_cd) {
		this.out_schedule_cd = out_schedule_cd;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getOut_schedule_qty() {
		return out_schedule_qty;
	}
	public void setOut_schedule_qty(int out_schedule_qty) {
		this.out_schedule_qty = out_schedule_qty;
	}
	public int getOut_qty() {
		return out_qty;
	}
	public void setOut_qty(int out_qty) {
		this.out_qty = out_qty;
	}
	public Date getOut_date() {
		return out_date;
	}
	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}
	public String getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(String stock_cd) {
		this.stock_cd = stock_cd;
	}
	public String getOut_complete() {
		return out_complete;
	}
	public void setOut_complete(String out_complete) {
		this.out_complete = out_complete;
	}
	
	@Override
	public String toString() {
		return "Out_scheduleListVO [out_schedule_cd=" + out_schedule_cd + ", business_no=" + business_no
				+ ", cust_name=" + cust_name + ", emp_num=" + emp_num + ", emp_name=" + emp_name + ", remarks="
				+ remarks + ", product_cd=" + product_cd + ", product_name=" + product_name + ", out_schedule_qty="
				+ out_schedule_qty + ", out_qty=" + out_qty + ", out_date=" + out_date + ", stock_cd=" + stock_cd
				+ ", out_complete=" + out_complete + "]";
	}
	
	
	
}

















