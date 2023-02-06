package com.thisteam.muhansangsa.vo;

public class ProductVO {

/*
 * product table (품목)
Field                  |Type         |Null|Key|Default|Extra         |
-----------------------+-------------+----+---+-------+--------------+
PRODUCT_CD             |int          |NO  |PRI|       |auto_increment|
PRODUCT_NAME           |varchar(100) |NO  |   |       |              |
PRODUCT_GROUP_BOTTOM_CD|int          |NO  |MUL|       |              |
UNIT                   |varchar(30)  |NO  |   |       |              |
BARCODE                |varchar(30)  |NO  |   |       |              |
IN_UNIT_PRICE          |decimal(10,2)|NO  |   |       |              |
OUT_UNIT_PRICE         |decimal(10,2)|NO  |   |       |              |
PRODUCT_TYPE_CD        |int          |NO  |MUL|       |              |
BUSINESS_NO            |varchar(30)  |NO  |MUL|       |              |
PRODUCT_IMAGE          |varchar(100) |YES |   |       |              |
REMARKS                |varchar(2000)|YES |   |       |              |
 * 
 */
	
	private int product_cd; // 품목코드
	private String product_name; //품목명
	private int product_group_bottom_cd; //품목그룹(소)
	private String product_group_bottom_name; //품목그룹명
	private String unit;  //단위
	private String barcode; //바코드
	private int in_unit_price; //입고단가
	private int out_unit_price; //출고단가
	private int product_type_cd; //품목타입코드
	private String business_no; //구매거래처
	private String cust_name; //구매거래처명
	private String product_image; //대표이미지
	private String remarks; //적요
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public int getIn_unit_price() {
		return in_unit_price;
	}
	public void setIn_unit_price(int in_unit_price) {
		this.in_unit_price = in_unit_price;
	}
	public int getOut_unit_price() {
		return out_unit_price;
	}
	public void setOut_unit_price(int out_unit_price) {
		this.out_unit_price = out_unit_price;
	}
	public int getProduct_type_cd() {
		return product_type_cd;
	}
	public void setProduct_type_cd(int product_type_cd) {
		this.product_type_cd = product_type_cd;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@Override
	public String toString() {
		return "ProductVO [product_cd=" + product_cd + ", product_name=" + product_name + ", product_group_bottom_cd="
				+ product_group_bottom_cd + ", unit=" + unit + ", barcode=" + barcode + ", in_unit_price="
				+ in_unit_price + ", out_unit_price=" + out_unit_price + ", product_type_cd=" + product_type_cd
				+ ", business_no=" + business_no + ", product_image=" + product_image + ", remarks=" + remarks + "]";
	}
	
	


}

















