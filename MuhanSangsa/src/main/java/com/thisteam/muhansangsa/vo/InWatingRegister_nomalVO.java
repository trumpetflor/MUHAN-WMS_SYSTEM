package com.thisteam.muhansangsa.vo;

import java.sql.Date;
import java.util.Arrays;

public class InWatingRegister_nomalVO {
	
	// 상단
	private String in_schedule_cd; // 입고예정코드
	private String in_type_cd; // 입고유형코드
	private String business_no; // 거래처코드
	private String emp_num; // 담당자번호
	// 하단
	private int product_cd; // 품목코드
	private String product_name; // 품목명
	private int in_schedule_qty; // 입고예정수량
	private int in_qty; // 입고수량
	private Date in_date; // 납기일자
	private String remarks; // 적요
	private String in_complete; // 진행상태
	private Date in_date_detail;
	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}
	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
	}
	public String getIn_type_cd() {
		return in_type_cd;
	}
	public void setIn_type_cd(String in_type_cd) {
		this.in_type_cd = in_type_cd;
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
	public int getIn_schedule_qty() {
		return in_schedule_qty;
	}
	public void setIn_schedule_qty(int in_schedule_qty) {
		this.in_schedule_qty = in_schedule_qty;
	}
	public int getIn_qty() {
		return in_qty;
	}
	public void setIn_qty(int in_qty) {
		this.in_qty = in_qty;
	}
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getIn_complete() {
		return in_complete;
	}
	public void setIn_complete(String in_complete) {
		this.in_complete = in_complete;
	}
	public Date getIn_date_detail() {
		return in_date_detail;
	}
	public void setIn_date_detail(Date in_date_detail) {
		this.in_date_detail = in_date_detail;
	}
	
	@Override
	public String toString() {
		return "InWatingRegister_nomalVO [in_schedule_cd=" + in_schedule_cd + ", in_type_cd=" + in_type_cd
				+ ", business_no=" + business_no + ", emp_num=" + emp_num + ", product_cd=" + product_cd
				+ ", product_name=" + product_name + ", in_schedule_qty=" + in_schedule_qty + ", in_qty=" + in_qty
				+ ", in_date=" + in_date + ", remarks=" + remarks + ", in_complete=" + in_complete + ", in_date_detail="
				+ in_date_detail + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
