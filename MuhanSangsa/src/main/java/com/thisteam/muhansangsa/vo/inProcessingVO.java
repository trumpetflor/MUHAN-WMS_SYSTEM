package com.thisteam.muhansangsa.vo;

import java.sql.Date;
import java.util.Arrays;

/*
CREATE VIEW in_processing_view
AS SELECT a.in_schedule_cd, d.business_no, d.cust_name, c.product_cd, c.product_name, b.in_date, b.in_schedule_qty, b.in_qty, (b.in_schedule_qty - b.in_qty) as no_in_qty, b.remarks, b.in_complete 
FROM in_schedule a, in_schedule_per_product b, product c, client d
WHERE a.in_schedule_cd = b.in_schedule_cd AND b.product_cd = c.product_cd AND c.business_no = d.business_no;
 */



public class inProcessingVO {
	private String in_schedule_cd; //입고예정코드
	private String business_no; // 거래처코드
	private String cust_name; // 상호
	private int product_cd; // 품목코드
	private String product_name; // 품목명
	private Date in_date; // 납기일자
	private int in_schedule_qty; // 입고예정수량
	private int in_qty; // 입고수량 = 입고대기수량
	private int no_in_qty; // 미입고수량 = 입고예정수량 - 입고수량
	private int[] no_in_qtyArr; // 미입고수량 = 입고예정수량 - 입고수량
	private String remarks; // 적요
	private int original_cd; // 원래코드(수정시사용)
	private Date original_date; // 원래납기일자(수정시사용)
	
	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}
	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
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
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
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
	public int getNo_in_qty() {
		return no_in_qty;
	}
	public void setNo_in_qty(int no_in_qty) {
		this.no_in_qty = no_in_qty;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int[] getNo_in_qtyArr() {
		return no_in_qtyArr;
	}
	public void setNo_in_qtyArr(int[] no_in_qty, int[] no_in_qtyArr) {
		this.no_in_qtyArr = no_in_qtyArr;
	}
	public int getOriginal_cd() {
		return original_cd;
	}
	public void setOriginal_cd(int original_cd) {
		this.original_cd = original_cd;
	}
	public void setNo_in_qtyArr(int[] no_in_qtyArr) {
		this.no_in_qtyArr = no_in_qtyArr;
	}
	public Date getOriginal_date() {
		return original_date;
	}
	public void setOriginal_date(Date original_date) {
		this.original_date = original_date;
	}
	@Override
	public String toString() {
		return "inProcessingVO [in_schedule_cd=" + in_schedule_cd + ", business_no=" + business_no + ", cust_name="
				+ cust_name + ", product_cd=" + product_cd + ", product_name=" + product_name + ", in_date=" + in_date
				+ ", in_schedule_qty=" + in_schedule_qty + ", in_qty=" + in_qty + ", no_in_qty=" + no_in_qty
				+ ", no_in_qtyArr=" + Arrays.toString(no_in_qtyArr) + ", remarks=" + remarks + ", original_cd="
				+ original_cd + ", original_date=" + original_date + "]";
	}
	
	
	
	
}
