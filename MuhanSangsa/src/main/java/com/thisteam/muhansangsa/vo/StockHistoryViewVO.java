package com.thisteam.muhansangsa.vo;

import java.sql.Date;

public class StockHistoryViewVO {
	
//	Field                |Type         |
//	---------------------+-------------+
//	STOCK_CD             |int          |
//	PRODUCT_CD           |int          |
//	PRODUCT_NAME         |varchar(100) |
//	STOCK_CONTROL_TYPE_CD|varchar(1)   |
//	SOURCE_STOCK_CD      |int          |
//	TARGET_STOCK_CD      |int          |
//	QTY                  |int          |
//	EMP_NUM              |varchar(10)  |
//	EMP_NAME             |varchar(100) |
//	STOCK_DATE           |date         |
//	REMARKS              |varchar(2000)|
	
	private int stock_cd; // 재고번호
	private int product_cd; // 품목코드
	private String product_name; // 품목명
	private String stock_control_type_cd; // 작업구분 : 입고(0), 출고(1), 조회(2), 이동(3)
	private int source_stock_cd; // 보내는 재고번호
	private int target_stock_cd; // 받는 재고번호
	private int qty; // 수량 (이동수량)
	private String emp_num; // 작업자 번호
	private String emp_name; // 작업자 이름
	private Date stock_date; // 작업일자
	private String remarks; // 적요
	
	public int getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
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
	public String getStock_control_type_cd() {
		return stock_control_type_cd;
	}
	public void setStock_control_type_cd(String stock_control_type_cd) {
		this.stock_control_type_cd = stock_control_type_cd;
	}
	public int getSource_stock_cd() {
		return source_stock_cd;
	}
	public void setSource_stock_cd(int source_stock_cd) {
		this.source_stock_cd = source_stock_cd;
	}
	public int getTarget_stock_cd() {
		return target_stock_cd;
	}
	public void setTarget_stock_cd(int target_stock_cd) {
		this.target_stock_cd = target_stock_cd;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
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
	public Date getStock_date() {
		return stock_date;
	}
	public void setStock_date(Date stock_date) {
		this.stock_date = stock_date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	@Override
	public String toString() {
		return "StockHistoryViewVO [stock_cd=" + stock_cd + ", product_cd=" + product_cd + ", product_name="
				+ product_name + ", stock_control_type_cd=" + stock_control_type_cd + ", source_stock_cd="
				+ source_stock_cd + ", target_stock_cd=" + target_stock_cd + ", qty=" + qty + ", emp_num=" + emp_num
				+ ", emp_name=" + emp_name + ", stock_date=" + stock_date + ", remarks=" + remarks + "]";
	}
	
}
