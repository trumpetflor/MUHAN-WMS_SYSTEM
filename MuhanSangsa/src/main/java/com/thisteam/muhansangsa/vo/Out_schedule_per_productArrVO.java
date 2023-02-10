package com.thisteam.muhansangsa.vo;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.format.annotation.DateTimeFormat;

public class Out_schedule_per_productArrVO {

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
	private String[] out_schedule_cd; //출고예정코드
	private int[] product_cd; //품목코드
	private int[] out_schedule_qty; //출고예정수량
	private int[] out_qty; //출고 수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date[] p_out_date; //납기일자 
	private String[] p_remarks; //적요
	private String[] stock_cd; //재고번호
	private String[] out_complete; //진행상태
	
	
	public String[] getOut_schedule_cd() {
		return out_schedule_cd;
	}
	public void setOut_schedule_cd(String[] out_schedule_cd) {
		this.out_schedule_cd = out_schedule_cd;
	}
	public int[] getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(int[] product_cd) {
		this.product_cd = product_cd;
	}
	public int[] getOut_schedule_qty() {
		return out_schedule_qty;
	}
	public void setOut_schedule_qty(int[] out_schedule_qty) {
		this.out_schedule_qty = out_schedule_qty;
	}
	public int[] getOut_qty() {
		return out_qty;
	}
	public void setOut_qty(int[] out_qty) {
		this.out_qty = out_qty;
	}
	public Date[] getP_out_date() {
		return p_out_date;
	}
	public void setP_out_date(Date[] p_out_date) {
		this.p_out_date = p_out_date;
	}

	public String[] getP_remarks() {
		return p_remarks;
	}
	public void setP_remarks(String[] p_remarks) {
		this.p_remarks = p_remarks;
	}
	public String[] getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(String[] stock_cd) {
		this.stock_cd = stock_cd;
	}
	public String[] getOut_complete() {
		return out_complete;
	}
	public void setOut_complete(String[] out_complete) {
		this.out_complete = out_complete;
	}
	@Override
	public String toString() {
		return "Out_schedule_per_productArrVO [out_schedule_cd=" + Arrays.toString(out_schedule_cd) + ", product_cd="
				+ Arrays.toString(product_cd) + ", out_schedule_qty=" + Arrays.toString(out_schedule_qty) + ", out_qty="
				+ Arrays.toString(out_qty) + ", p_out_date=" + Arrays.toString(p_out_date) + ", p_remarks="
				+ Arrays.toString(p_remarks) + ", stock_cd=" + Arrays.toString(stock_cd) + ", out_complete="
				+ Arrays.toString(out_complete) + "]";
	}

	
	

}

















