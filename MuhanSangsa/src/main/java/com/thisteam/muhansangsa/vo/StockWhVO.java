package com.thisteam.muhansangsa.vo;

/*
CREATE VIEW stock_wh_view
AS SELECT a.stock_cd, b.product_name, c.wh_area, d.wh_loc_in_area
FROM STOCK a, PRODUCT b, WAREHOUSE_AREA c, WAREHOUSE_IN_AREA d
WHERE a.product_cd = b.product_cd AND a.wh_loc_in_area_cd = d.wh_loc_in_area_cd AND c.wh_area_cd = d.wh_area_cd;
 */
public class StockWhVO {
	private int stock_cd; //재고번호
	private String product_name; //품목명
	private String wh_area; // 창고 - 구역명
	private String wh_loc_in_area; // 선반 - 위치명
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
	@Override
	public String toString() {
		return "StockWhVO [stock_cd=" + stock_cd + ", product_name=" + product_name + ", wh_area=" + wh_area
				+ ", wh_loc_in_area=" + wh_loc_in_area + "]";
	}
	
	
	

}
