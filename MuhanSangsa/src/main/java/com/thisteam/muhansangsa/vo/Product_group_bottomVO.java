package com.thisteam.muhansangsa.vo;

public class Product_group_bottomVO {

/*
[ 품목 그룹 - 소분류 ] 

Field                    |Type        |Null|Key|Default|Extra         |
-------------------------+------------+----+---+-------+--------------+
PRODUCT_GROUP_TOP_CD     |int         |NO  |MUL|       |              |
PRODUCT_GROUP_BOTTOM_CD  |int         |NO  |PRI|       |auto_increment|
PRODUCT_GROUP_BOTTOM_NAME|varchar(100)|NO  |   |       |              |
 */
	
	private int product_group_top_cd; // 품목그룹코드(대)
	private int product_group_bottom_cd; //품목그룹코드(소)
	private String product_group_bottom_name; //품목그룹명(소)
	
	public int getProduct_group_top_cd() {
		return product_group_top_cd;
	}
	public void setProduct_group_top_cd(int product_group_top_cd) {
		this.product_group_top_cd = product_group_top_cd;
	}
	public int getProduct_group_bottom_cd() {
		return product_group_bottom_cd;
	}
	public void setProduct_group_bottom_cd(int product_group_bottom_cd) {
		this.product_group_bottom_cd = product_group_bottom_cd;
	}
	public String getProduct_group_bottom_name() {
		return product_group_bottom_name;
	}
	public void setProduct_group_bottom_name(String product_group_bottom_name) {
		this.product_group_bottom_name = product_group_bottom_name;
	}
	
	
	@Override
	public String toString() {
		return "Product_group_bottomVO [product_group_top_cd=" + product_group_top_cd + ", product_group_bottom_cd="
				+ product_group_bottom_cd + ", product_group_bottom_name=" + product_group_bottom_name + "]";
	}

	
	
}

















