package com.thisteam.muhansangsa.vo;

public class WorksVO {
	
	String work_cd;
	String work_type;
	
	
	public String getWork_cd() {
		return work_cd;
	}


	public void setWork_cd(String work_cd) {
		this.work_cd = work_cd;
	}


	public String getWork_type() {
		return work_type;
	}


	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}


	@Override
	public String toString() {
		return "WorkVO [work_cd=" + work_cd + ", work_type=" + work_type + "]";
	}
	
}














