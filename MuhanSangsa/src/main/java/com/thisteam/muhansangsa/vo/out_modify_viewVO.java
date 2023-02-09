package com.thisteam.muhansangsa.vo;

import java.sql.Date;

public class out_modify_viewVO {
	
// 수정 작업을 위하여 생성한 뷰 테이블
//	Field           |Type       
//	----------------+-----------
//	OUT_SCHEDULE_CD |varchar(20)
//	BUSINESS_NO     |varchar(30)
//	EMP_NUM         |varchar(10)
//	OUT_DATE        |date       
//	PRODUCT_CD      |int        
//	OUT_SCHEDULE_QTY|int        
//	OUT_QTY         |int        
//	STOCK_CD        |int        
	
	/* 수정 작업을 위하여 생성한 뷰 */
	/* 
	create view out_modify_view as
	select os.OUT_SCHEDULE_CD , os.BUSINESS_NO , os.EMP_NUM , os.OUT_DATE , ospp.PRODUCT_CD ,
	ospp.OUT_SCHEDULE_QTY , ospp.OUT_QTY, ospp.STOCK_CD  
	from out_schedule os join out_schedule_per_product ospp where os.OUT_SCHEDULE_CD = ospp.OUT_SCHEDULE_CD ; 
	*/
	
	private String out_schedule_cd;
	private String business_no;
	private String emp_num;
	private Date out_date;
	private int product_cd;
	private int out_schedule_qty;
	private int out_qty;
	private int stock_cd;
	
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
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public Date getOut_date() {
		return out_date;
	}
	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}
	public int getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
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
	public int getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
	}

	@Override
	public String toString() {
		return "out_modify_viewVO [out_schedule_cd=" + out_schedule_cd + ", business_no=" + business_no + ", emp_num="
				+ emp_num + ", out_date=" + out_date + ", product_cd=" + product_cd + ", out_schedule_qty="
				+ out_schedule_qty + ", out_qty=" + out_qty + ", stock_cd=" + stock_cd + "]";
	}
}
