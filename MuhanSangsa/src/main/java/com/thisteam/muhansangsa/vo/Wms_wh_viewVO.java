package com.thisteam.muhansangsa.vo;

/*
create view wms_wh_view as
select wh.wh_cd wh_cd, wh.wh_name wh_name, wha.wh_area_cd wh_area_cd, wha.wh_area wh_area, whla.wh_loc_in_area_cd wh_loc_in_area_cd, whla.wh_loc_in_area wh_loc_in_area
from warehouse wh
left outer join warehouse_area wha on wh.WH_CD = wha.WH_CD
left outer join warehouse_in_area whla on wha.WH_AREA_CD = whla.WH_AREA_CD;
 */

/*
Field            |Type        |Null|Key|Default|Extra|
-----------------+------------+----+---+-------+-----+
wh_cd	varchar(10)	NO			
wh_name	varchar(100)	NO			
wh_area_cd	int	YES		0	
wh_area	varchar(30)	YES			
wh_loc_in_area_cd	int	YES		0	
wh_loc_in_area	varchar(30)	YES			
 */

public class Wms_wh_viewVO {

	private String wh_cd;
	private String wh_name;
	private int wh_area_cd;
	private String wh_area;
	private int wh_loc_in_area_cd;
	private String wh_loc_in_area;
	
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
	
	@Override
	public String toString() {
		return "Wms_wh_viewVO [wh_cd=" + wh_cd + ", wh_name=" + wh_name + ", wh_area_cd=" + wh_area_cd + ", wh_area="
				+ wh_area + ", wh_loc_in_area_cd=" + wh_loc_in_area_cd + ", wh_loc_in_area=" + wh_loc_in_area + "]";
	}
	
}
