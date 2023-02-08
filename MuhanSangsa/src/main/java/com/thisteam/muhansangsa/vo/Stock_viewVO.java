package com.thisteam.muhansangsa.vo;

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

/*
STOCK_CD	int	NO			
PRODUCT_CD	int	NO			
PRODUCT_NAME	varchar(100)	NO			
wh_cd	varchar(10)	NO			
WH_NAME	varchar(100)	NO			
WH_AREA_CD	int	NO		0	
WH_AREA	varchar(30)	NO			
WH_LOC_IN_AREA_CD	int	NO			
WH_LOC_IN_AREA	varchar(30)	NO			
STOCK_QTY	int	NO				
 */

public class Stock_viewVO {

	private int stock_cd; //재고번호
	private int product_cd; //품목 번호
	private String product_name; //품목명
	private String wh_cd;//창고 코드
	private String wh_name;//창고명
	private int wh_area_cd;//구역 코드
	private String wh_area;//구역명
	private int wh_loc_in_area_cd; //위치코드
	private String wh_loc_in_area;//위치명
	
	private int stock_qty;//재고수량
	
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getWh_cd() {
		return wh_cd;
	}
	public void setWh_cd(String wh_cd) {
		this.wh_cd = wh_cd;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	public int getWh_area_cd() {
		return wh_area_cd;
	}
	public void setWh_area_cd(int wh_area_cd) {
		this.wh_area_cd = wh_area_cd;
	}
	public String getWh_area() {
		return wh_area;
	}
	public void setWh_area(String wh_area) {
		this.wh_area = wh_area;
	}
	public int getWh_loc_in_area_cd() {
		return wh_loc_in_area_cd;
	}
	public void setWh_loc_in_area_cd(int wh_loc_in_area_cd) {
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
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
		return "Stock_viewVO [stock_cd=" + stock_cd + ", product_cd=" + product_cd + ", product_name=" + product_name
				+ ", wh_cd=" + wh_cd + ", wh_name=" + wh_name + ", wh_area_cd=" + wh_area_cd + ", wh_area=" + wh_area
				+ ", wh_loc_in_area_cd=" + wh_loc_in_area_cd + ", wh_loc_in_area=" + wh_loc_in_area + ", stock_qty="
				+ stock_qty + "]";
	}
	
}
