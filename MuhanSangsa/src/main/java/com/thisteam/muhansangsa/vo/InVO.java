package com.thisteam.muhansangsa.vo;

import java.sql.Date;


public class InVO {

	private String in_schedule_cd;
	private String in_type_cd;
	private String business_no;
	private String emp_num;
	private Date in_date;
	private String remarks;
	private String in_complete;
	private String in_type_name;
	private String cust_name;
	private String emp_name;
	private String product_name;
	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}
	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
	}
	public String getIn_type_cd() {
		return in_type_cd;
	}
	public void setIn_type_cd(String in_type_cd) {
		this.in_type_cd = in_type_cd;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getIn_complete() {
		return in_complete;
	}
	public void setIn_complete(String in_complete) {
		this.in_complete = in_complete;
	}
	public String getIn_type_name() {
		return in_type_name;
	}
	public void setIn_type_name(String in_type_name) {
		this.in_type_name = in_type_name;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	@Override
	public String toString() {
		return "InVO [in_schedule_cd=" + in_schedule_cd + ", in_type_cd=" + in_type_cd + ", business_no=" + business_no
				+ ", emp_num=" + emp_num + ", in_date=" + in_date + ", remarks=" + remarks + ", in_complete="
				+ in_complete + ", in_type_name=" + in_type_name + ", cust_name=" + cust_name + ", emp_name=" + emp_name
				+ ", product_name=" + product_name + "]";
	}
	
	

	   

		

}














