package com.thisteam.muhansangsa.vo;

/*
Field            |Type        |Null|Key|Default|Extra|
-----------------+------------+----+---+-------+-----+
wh_cd            |varchar(10) |NO  |   |       |     |
WH_NAME          |varchar(100)|NO  |   |       |     |
WH_AREA          |varchar(30) |NO  |   |       |     |
WH_AREA_CD       |int         |NO  |   |0      |     |
WH_LOC_IN_AREA   |varchar(30) |NO  |   |       |     |
WH_LOC_IN_AREA_CD|int         |NO  |   |0      |     |
 */

public class Wms_wh_viewVO {

	private String wh_cd;
	private String wh_name;
	private String wh_area;
	private int wh_area_cd;
	private String wh_loc_in_area;
	private int wh_loc_in_area_cd;
	
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
	public int getWh_loc_in_area_cd() {
		return wh_loc_in_area_cd;
	}
	public void setWh_loc_in_area_cd(int wh_loc_in_area_cd) {
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
	}
	
	@Override
	public String toString() {
		return "Wms_wh_viewVO [wh_cd=" + wh_cd + ", wh_name=" + wh_name + ", wh_area=" + wh_area + ", wh_area_cd="
				+ wh_area_cd + ", wh_loc_in_area=" + wh_loc_in_area + ", wh_loc_in_area_cd=" + wh_loc_in_area_cd + "]";
	}
	
}
