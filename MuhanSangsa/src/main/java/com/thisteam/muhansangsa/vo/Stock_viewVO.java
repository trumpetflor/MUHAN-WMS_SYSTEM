package com.thisteam.muhansangsa.vo;

public class Stock_viewVO {

	//-- 재고번호, 품목명, 규격, 창고명, 구역명, 위치명, 재고수량; (WH_LOC_IN_AREA: 창고 구역 내 위치명 / WH_AREA: 창고 내부 구역명 /WH_NAME: 창고명 )
//	STOCK_CD
//	PRODUCT_NAME
//	WH_NAME
//	WH_AREA
//	WH_LOC_IN_AREA_CD
//	WH_LOC_IN_AREA
//	STOCK_QTY
	
	int stock_cd; //재고번호
	String product_name; //품목명
	String wh_name;//창고명
	String wh_area;//구역명
	String wh_loc_in_area;//위치명
	int stock_qty;//재고수량
	
	
	
	
	public int getStock_cd() {
		return stock_cd;
	}




	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
	}




	public String getProduct_name() {
		return product_name;
	}




	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}




	public String getWh_name() {
		return wh_name;
	}




	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}




	public String getWh_area() {
		return wh_area;
	}




	public void setWh_area(String wh_area) {
		this.wh_area = wh_area;
	}




	public String getWh_loc_in_area() {
		return wh_loc_in_area;
	}




	public void setWh_loc_in_area(String wh_loc_in_area) {
		this.wh_loc_in_area = wh_loc_in_area;
	}




	public int getStock_qty() {
		return stock_qty;
	}




	public void setStock_qty(int stock_qty) {
		this.stock_qty = stock_qty;
	}




	@Override
	public String toString() {
		return "Stock_viewVO [stock_cd=" + stock_cd + ", product_name=" + product_name + ", wh_name=" + wh_name
				+ ", wh_area=" + wh_area + ", wh_loc_in_area=" + wh_loc_in_area + ", stock_qty=" + stock_qty
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
