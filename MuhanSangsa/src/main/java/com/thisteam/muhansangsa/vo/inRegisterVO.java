package com.thisteam.muhansangsa.vo;

import java.util.List;

public class inRegisterVO {
	private String in_schedule_cd; //입고예정번호
	private String product_name; //품목명
	private int in_schedule_qty; //입고예정수량
	private int in_qty; //입고지시수량
	private String stock_cd; //재고번호
	private String wh_loc_in_area; //구역명_선반위치
	
	public inRegisterVO() {}
	
	public inRegisterVO(String in_schedule_cd, String product_name, int in_schedule_qty) {
		super();
		this.in_schedule_cd = in_schedule_cd;
		this.product_name = product_name;
		this.in_schedule_qty = in_schedule_qty;
	}

	public inRegisterVO(String in_schedule_cd, String product_name, int in_schedule_qty, int in_qty, String stock_cd,
			String wh_loc_in_area) {
		super();
		this.in_schedule_cd = in_schedule_cd;
		this.product_name = product_name;
		this.in_schedule_qty = in_schedule_qty;
		this.in_qty = in_qty;
		this.stock_cd = stock_cd;
		this.wh_loc_in_area = wh_loc_in_area;
	}
	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}
	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
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
	public String getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(String stock_cd) {
		this.stock_cd = stock_cd;
	}
	public String getWh_loc_in_area() {
		return wh_loc_in_area;
	}
	public void setWh_loc_in_area(String wh_loc_in_area) {
		this.wh_loc_in_area = wh_loc_in_area;
	}
	@Override
	public String toString() {
		return "inRegisterVO [in_schedule_cd=" + in_schedule_cd + ", product_name=" + product_name
				+ ", in_schedule_qty=" + in_schedule_qty + ", in_qty=" + in_qty + ", stock_cd=" + stock_cd
				+ ", wh_loc_in_area=" + wh_loc_in_area + "]";
	}
//	@Override
//	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
//	    argumentResolvers.add( new PageableHandlerMethodArgumentResolver());
//	}
//	public void addinRegisterVOs(List<inRegisterVO> inRegisterVOs) {
//		inRegisterVOs.add(new inRegisterVO(in_schedule_cd, product_name, in_schedule_qty));
//	}
	
	private List<inRegisterVO> inRegisterList;

	
	public List<inRegisterVO> getBoardVoList() {
		return inRegisterList;
	}
	public void setBoardVoList(List<inRegisterVO> inRegisterList) {
		this.inRegisterList = inRegisterList;
	}
	
}
