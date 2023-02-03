package com.thisteam.muhansangsa.vo;

public class StockVO {
//	STOCK_CD	재고번호	NUMBER	Y	PK, 자동증가
//	PRODUCT_CD	품목코드	NUMBER	Y	품목 테이블 참조
//	WH_LOC_IN_AREA_CD	창고 구역 내 위치 코드	NUMBER	Y	창고 구역 내 상세 위치 테이블 참조
//	STOCK_QTY	재고수량	NUMBER	Y	
	
	int stock_cd;
	int product_cd;
	int wh_loc_in_area_cd; //창고 구역 내 상세 위치 테이블 참조
	int stock_qty;
	
	
	
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
	public int getWh_loc_in_area_cd() {
		return wh_loc_in_area_cd;
	}
	public void setWh_loc_in_area_cd(int wh_loc_in_area_cd) {
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
	}
	public int getStock_qty() {
		return stock_qty;
	}
	public void setStock_qty(int stock_qty) {
		this.stock_qty = stock_qty;
	}
	@Override
	public String toString() {
		return "StockVO [stock_cd=" + stock_cd + ", product_cd=" + product_cd + ", wh_loc_in_area_cd="
				+ wh_loc_in_area_cd + ", stock_qty=" + stock_qty + "]";
	}
	
	
	
	
}
