package com.thisteam.muhansangsa.vo;

/*
Field            |Type       |Null|Key|Default|Extra         |
-----------------+-----------+----+---+-------+--------------+
WH_AREA_CD       |int        |NO  |MUL|       |              |
WH_LOC_IN_AREA   |varchar(30)|NO  |   |       |              |
WH_LOC_IN_AREA_CD|int        |NO  |PRI|       |auto_increment|
 */

public class WhLocAreaVO {
	
	private int wh_area_cd;
	private String wh_loc_in_area;
	private int wh_loc_in_area_cd;
	
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
		return "WhLocAreaVO [wh_area_cd=" + wh_area_cd + ", wh_loc_in_area=" + wh_loc_in_area + ", wh_loc_in_area_cd="
				+ wh_loc_in_area_cd + "]";
	}
	
}














