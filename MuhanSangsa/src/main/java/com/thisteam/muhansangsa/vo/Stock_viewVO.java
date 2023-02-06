package com.thisteam.muhansangsa.vo;

public class Stock_viewVO {

	//-- 재고번호, 품목명, 규격, 창고명, 구역명, 위치명, 재고수량; (WH_LOC_IN_AREA: 창고 구역 내 위치명 / WH_AREA: 창고 내부 구역명 /WH_NAME: 창고명 )
//	STOCK_CD
//	PRODUCT_CD
//	PRODUCT_NAME
//	WH_NAME
//	WH_AREA
//	wh_area_cd
//	WH_LOC_IN_AREA
//	WH_LOC_IN_AREA_CD
//	STOCK_QTY

	int stock_cd; //재고번호
	String product_cd; //품목 번호
	String product_name; //품목명
	String wh_name;//창고명
	String wh_area;//구역명
	int wh_area_cd;//구역 코드
	String wh_loc_in_area;//위치명
	String wh_loc_in_area_cd; //위치코드
	
	int stock_qty;//재고수량
	int sum;//재고 합
	
	
	public int getStock_cd() {
		return stock_cd;
	}


	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
	}


	public String getProduct_cd() {
		return product_cd;
	}


	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
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


	public int getWh_area_cd() {
		return wh_area_cd;
	}


	public void setWh_area_cd(int wh_area_cd) {
		this.wh_area_cd = wh_area_cd;
	}


	public String getWh_loc_in_area() {
		return wh_loc_in_area;
	}


	public void setWh_loc_in_area(String wh_loc_in_area) {
		this.wh_loc_in_area = wh_loc_in_area;
	}


	public String getWh_loc_in_area_cd() {
		return wh_loc_in_area_cd;
	}


	public void setWh_loc_in_area_cd(String wh_loc_in_area_cd) {
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
	}


	public int getStock_qty() {
		return stock_qty;
	}


	public void setStock_qty(int stock_qty) {
		this.stock_qty = stock_qty;
	}


	public int getSum() {
		return sum;
	}


	public void setSum(int sum) {
		this.sum = sum;
	}


	@Override
	public String toString() {
		return "Stock_viewVO [stock_cd=" + stock_cd + ", product_cd=" + product_cd + ", product_name=" + product_name
				+ ", wh_name=" + wh_name + ", wh_area=" + wh_area + ", wh_area_cd=" + wh_area_cd + ", wh_loc_in_area="
				+ wh_loc_in_area + ", wh_loc_in_area_cd=" + wh_loc_in_area_cd + ", stock_qty=" + stock_qty + ", sum="
				+ sum + "]";
	}






	
	

	
}
