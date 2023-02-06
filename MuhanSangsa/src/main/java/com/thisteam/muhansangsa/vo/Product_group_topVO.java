package com.thisteam.muhansangsa.vo;

public class Product_group_topVO {

/*
 * 품목 그룹 - 대분류 (product_group_top)
 Field                 |Type        |Null|Key|Default|Extra         |
----------------------+------------+----+---+-------+--------------+
PRODUCT_GROUP_TOP_CD  |int         |NO  |PRI|       |auto_increment|
PRODUCT_GROUP_TOP_NAME|varchar(100)|NO  |   |       |              |
 
 */
	private int product_group_top_cd; //품목그룹코드(대)
	private int product_group_top_name; //품목그룹명(대)
	public int getProduct_group_top_cd() {
		return product_group_top_cd;
	}
	public void setProduct_group_top_cd(int product_group_top_cd) {
		this.product_group_top_cd = product_group_top_cd;
	}
	public int getProduct_group_top_name() {
		return product_group_top_name;
	}
	public void setProduct_group_top_name(int product_group_top_name) {
		this.product_group_top_name = product_group_top_name;
	}
	
	@Override
	public String toString() {
		return "Product_group_topVO [product_group_top_cd=" + product_group_top_cd + ", product_group_top_name="
				+ product_group_top_name + "]";
	}
	
	


}

















