package com.thisteam.muhansangsa.vo;

import java.sql.Date;

public class Out_schedule_per_productVO {

/*
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
	private String out_schedule_cd; //출고예정코드
	private int product_cd; //품목코드
	private int out_schedule_qty; //출고예정수량
	private int out_qty; //출고 수량
	private Date out_date; //납기일자 
	private String remarks; //적요
	private String stock_cd; //재고번호
	private String out_complete; //진행상태
	
	
	public Out_schedule_per_productVO() {
		super();
	}
	public String getOut_schedule_cd() {
		return out_schedule_cd;
	}
	public void setOut_schedule_cd(String out_schedule_cd) {
		this.out_schedule_cd = out_schedule_cd;
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
	public Date getOut_date() {
		return out_date;
	}
	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
		return "Out_schedule_per_productVO [out_schedule_cd=" + out_schedule_cd + ", product_cd=" + product_cd
				+ ", out_schedule_qty=" + out_schedule_qty + ", out_qty=" + out_qty + ", out_date=" + out_date
				+ ", remarks=" + remarks + ", stock_cd=" + stock_cd + ", out_complete=" + out_complete + "]";
	}

	
	

}

















