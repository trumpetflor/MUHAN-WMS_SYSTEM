package com.thisteam.muhansangsa.vo;

public class WarehouseVO {
	
	private String wh_cd;
	private String wh_name;
	private String wh_gubun;
	private String wh_location;
	private String wh_addr;
	private String wh_addr1;
	private String wh_addr2;
	private String wh_tel;
	private String wh_man_name;
	private String wh_use;
	private String remarks;
	private String wh_pcode;
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
	public String getWh_gubun() {
		return wh_gubun;
	}
	public void setWh_gubun(String wh_gubun) {
		this.wh_gubun = wh_gubun;
	}
	public String getWh_location() {
		return wh_location;
	}
	public void setWh_location(String wh_location) {
		this.wh_location = wh_location;
	}
	public String getWh_addr() {
		return wh_addr;
	}
	public void setWh_addr(String wh_addr) {
		this.wh_addr = wh_addr;
		
		// null 값이면 저장 안하게 하기
		if(wh_addr1 == null || wh_addr1.equals("") || wh_addr1.equals(null) || wh_addr1 == "") {
//			this.wh_addr = "";
			wh_addr1 = "";
			wh_addr2 = "";
		} else {
			wh_addr1 = wh_addr.split(", ")[0];
			wh_addr2 = wh_addr.split(", ")[1];
		}
		
	}
	public String getWh_addr1() {
		return wh_addr1;
	}
	public void setWh_addr1(String wh_addr1) {
		this.wh_addr1 = wh_addr1;
	}
	public String getWh_addr2() {
		return wh_addr2;
	}
	public void setWh_addr2(String wh_addr2) {
		this.wh_addr2 = wh_addr2;
	}
	public String getWh_tel() {
		return wh_tel;
	}
	public void setWh_tel(String wh_tel) {
		this.wh_tel = wh_tel;
	}
	public String getWh_man_name() {
		return wh_man_name;
	}
	public void setWh_man_name(String wh_man_name) {
		this.wh_man_name = wh_man_name;
	}
	public String getWh_use() {
		return wh_use;
	}
	public void setWh_use(String wh_use) {
		this.wh_use = wh_use;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getWh_pcode() {
		return wh_pcode;
	}
	public void setWh_pcode(String wh_pcode) {
		this.wh_pcode = wh_pcode;
	}
	@Override
	public String toString() {
		return "WarehouseVO [wh_cd=" + wh_cd + ", wh_name=" + wh_name + ", wh_gubun=" + wh_gubun + ", wh_location="
				+ wh_location + ", wh_addr=" + wh_addr + ", wh_addr1=" + wh_addr1 + ", wh_addr2=" + wh_addr2
				+ ", wh_tel=" + wh_tel + ", wh_man_name=" + wh_man_name + ", wh_use=" + wh_use + ", remarks=" + remarks
				+ ", wh_pcode=" + wh_pcode + "]";
	}
	
	
}














