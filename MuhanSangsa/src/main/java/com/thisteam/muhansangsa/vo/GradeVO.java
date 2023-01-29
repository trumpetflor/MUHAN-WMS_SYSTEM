package com.thisteam.muhansangsa.vo;

public class GradeVO {
//	GRADE_CD	직급코드
//	GRADE_NAME	직급명

	
	String grade_cd;
	String grade_name;
	
	
	public String getGrade_cd() {
		return grade_cd;
	}


	public void setGrade_cd(String grade_cd) {
		this.grade_cd = grade_cd;
	}


	public String getGrade_name() {
		return grade_name;
	}


	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}


	@Override
	public String toString() {
		return "GradeVO [grade_cd=" + grade_cd + ", grade_name=" + grade_name + "]";
	}
	
}














