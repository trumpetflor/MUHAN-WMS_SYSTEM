package com.thisteam.muhansangsa.vo;

import java.sql.Date;
import java.util.Arrays;

public class inProcessingArrVO {
	private String[] in_schedule_cd; //입고예정코드
	private String[] business_no; // 거래처코드
	private String[] cust_name; // 상호
	private int[] product_cd; // 품목코드
	private String[] product_name; // 품목명
	private Date[] in_date; // 납기일자
	private int[] in_schedule_qty; // 입고예정수량
	private int[] in_qty; // 입고수량 = 입고대기수량
	private int[] no_in_qtyArr; // 미입고수량 = 입고예정수량 - 입고수량
	private String[] remarks; // 적요
	public String[] getIn_schedule_cd() {
		return in_schedule_cd;
	}
	public void setIn_schedule_cd(String[] in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
	}
	public String[] getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String[] business_no) {
		this.business_no = business_no;
	}
	public String[] getCust_name() {
		return cust_name;
	}
	public void setCust_name(String[] cust_name) {
		this.cust_name = cust_name;
	}
	public int[] getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(int[] product_cd) {
		this.product_cd = product_cd;
	}
	public String[] getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String[] product_name) {
		this.product_name = product_name;
	}
	public Date[] getIn_date() {
		return in_date;
	}
	public void setIn_date(Date[] in_date) {
		this.in_date = in_date;
	}
	public int[] getIn_schedule_qty() {
		return in_schedule_qty;
	}
	public void setIn_schedule_qty(int[] in_schedule_qty) {
		this.in_schedule_qty = in_schedule_qty;
	}
	public int[] getIn_qty() {
		return in_qty;
	}
	public void setIn_qty(int[] in_qty) {
		this.in_qty = in_qty;
	}
	public int[] getNo_in_qtyArr() {
		return no_in_qtyArr;
	}
	public void setNo_in_qtyArr(int[] no_in_qtyArr) {
		this.no_in_qtyArr = no_in_qtyArr;
	}
	public String[] getRemarks() {
		return remarks;
	}
	public void setRemarks(String[] remarks) {
		this.remarks = remarks;
	}
	@Override
	public String toString() {
		return "inProcessingArrVO [in_schedule_cd=" + Arrays.toString(in_schedule_cd) + ", business_no="
				+ Arrays.toString(business_no) + ", cust_name=" + Arrays.toString(cust_name) + ", product_cd="
				+ Arrays.toString(product_cd) + ", product_name=" + Arrays.toString(product_name) + ", in_date="
				+ Arrays.toString(in_date) + ", in_schedule_qty=" + Arrays.toString(in_schedule_qty) + ", in_qty="
				+ Arrays.toString(in_qty) + ", no_in_qtyArr=" + Arrays.toString(no_in_qtyArr) + ", remarks="
				+ Arrays.toString(remarks) + "]";
	}
	
	
	
}
