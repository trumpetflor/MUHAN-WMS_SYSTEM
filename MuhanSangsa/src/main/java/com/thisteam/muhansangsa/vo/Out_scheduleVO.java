package com.thisteam.muhansangsa.vo;

import java.sql.Date;

/*
	[Out_scheduleVO 출고 예정 테이블]
	
	Field          |Type         |Null|Key|Default|Extra|
	---------------+-------------+----+---+-------+-----+
	OUT_SCHEDULE_CD|varchar(20)  |NO  |PRI|       |     |
	BUSINESS_NO    |varchar(30)  |NO  |MUL|       |     |
	EMP_NUM        |varchar(10)  |NO  |MUL|       |     |
	OUT_DATE       |date         |NO  |   |       |     |
	REMARKS        |varchar(2000)|NO  |   |       |     |
	OUT_COMPLETE   |varchar(1)   |NO  |   |       |     |
 */

public class Out_scheduleVO { //출고예정 테이블

	private String out_schedule_cd; //출고 예정 코드 
	private String business_no; //거래처 코드
	private String emp_num; // 담당자(사원번호)
	private Date out_date;  // 납기일자
	private String remarks; //적요
	private String out_complete; //진행상태
	
	public Out_scheduleVO() {
		super();
	}
	public String getOut_schedule_cd() {
		return out_schedule_cd;
	}
	public void setOut_schedule_cd(String out_schedule_cd) {
		this.out_schedule_cd = out_schedule_cd;
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
	public Date getOut_date() {
		return out_date;
	}
	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getOut_complete() {
		return out_complete;
	}
	public void setOut_complete(String out_complete) {
		this.out_complete = out_complete;
	}
	
	@Override
	public String toString() {
		return "Out_scheduleVO [out_schedule_cd=" + out_schedule_cd + ", business_no=" + business_no + ", emp_num="
				+ emp_num + ", out_date=" + out_date + ", remarks=" + remarks + ", out_complete=" + out_complete + "]";
	}
	

	

}

















