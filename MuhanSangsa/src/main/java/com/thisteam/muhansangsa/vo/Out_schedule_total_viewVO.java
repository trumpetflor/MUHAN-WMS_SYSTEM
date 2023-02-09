package com.thisteam.muhansangsa.vo;

import java.sql.Date;

public class Out_schedule_total_viewVO {

//  출고 처리 목록 (세부 항목 표시)
//	Field           |Type         
//	----------------+-------------
//	OUT_SCHEDULE_CD |varchar(20)  
//	OUT_CD_1        |varchar(8)   
//	OUT_CD_2        |varchar(2)   
//	CUST_NAME       |varchar(100) 
//	PRODUCT_NAME    |varchar(100) 
//	OUT_DATE        |date         
//	OUT_SCHEDULE_QTY|int          
//	OUT_QTY         |int          
//	PRODUCT_CD      |int          
//	STOCK_CD        |int          
//	REMARKS         |varchar(2000)

	private String out_schedule_cd; //출고 예정 코드 "20230209-01" 
	private String out_cd_1; // 출고 예정 코드 분리 1 "20230209"
	private String out_cd_2; // 출고 예정 코드 분리 2 "01"
	private String cust_name;
	private String product_name;
	private Date out_date;  
	private int out_schedule_qty;
	private int out_qty;
	private int product_cd;
	private int stock_cd;
	private String remarks; // out_schedule_list 적요
	
	public String getOut_schedule_cd() {
		return out_schedule_cd;
	}
	public void setOut_schedule_cd(String out_schedule_cd) {
		this.out_schedule_cd = out_schedule_cd;
	}
	public String getOut_cd_1() {
		return out_cd_1;
	}
	public void setOut_cd_1(String out_cd_1) {
		this.out_cd_1 = out_cd_1;
	}
	public String getOut_cd_2() {
		return out_cd_2;
	}
	public void setOut_cd_2(String out_cd_2) {
		this.out_cd_2 = out_cd_2;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Date getOut_date() {
		return out_date;
	}
	public void setOut_date(Date out_date) {
		this.out_date = out_date;
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
	public int getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
	}
	public int getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@Override
	public String toString() {
		return "Out_schedule_total_viewVO [out_schedule_cd=" + out_schedule_cd + ", out_cd_1=" + out_cd_1
				+ ", out_cd_2=" + out_cd_2 + ", cust_name=" + cust_name + ", product_name=" + product_name
				+ ", out_date=" + out_date + ", out_schedule_qty=" + out_schedule_qty + ", out_qty=" + out_qty
				+ ", product_cd=" + product_cd + ", stock_cd=" + stock_cd + ", remarks=" + remarks + "]";
	}
	
}
