package com.thisteam.muhansangsa.vo;

import java.sql.Date;
import java.util.List;

/*
CREATE VIEW in_register_view
AS SELECT a.in_schedule_cd, d.product_name, a.in_schedule_qty, a.in_qty, a.stock_cd, f.wh_area, e.wh_loc_in_area, a.in_date
FROM in_schedule_per_product a, stock c, product d, warehouse_in_area e, warehouse_area f
WHERE a.stock_cd = c.stock_cd AND c.product_cd = d.product_cd AND c.wh_loc_in_area_cd = e.wh_loc_in_area_cd AND e.wh_area_cd = f.wh_area_cd;
 */

public class inRegisterVO {
	private String in_schedule_cd; //입고예정번호
	private int product_cd; // 제품 코드
	private String product_name; //품목명
	private int in_schedule_qty; //입고예정수량
	private int in_qty; //입고지시수량
	private int stock_cd; //재고번호
	private String wh_loc_in_area; //구역명_선반위치
	private Date in_date; // 납기일자
	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}
	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
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
	public int getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
	}
	public String getWh_loc_in_area() {
		return wh_loc_in_area;
	}
	public void setWh_loc_in_area(String wh_loc_in_area) {
		this.wh_loc_in_area = wh_loc_in_area;
	}
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}
	@Override
	public String toString() {
		return "inRegisterVO [in_schedule_cd=" + in_schedule_cd + ", product_cd=" + product_cd + ", product_name="
				+ product_name + ", in_schedule_qty=" + in_schedule_qty + ", in_qty=" + in_qty + ", stock_cd="
				+ stock_cd + ", wh_loc_in_area=" + wh_loc_in_area + ", in_date=" + in_date + "]";
	}

	
	
	
}
