package com.thisteam.muhansangsa.vo;

import java.sql.Date;

public class Emp_viewVO {
	
//	IDX	인덱스
//	EMP_NUM	사원번호
//	EMP_NAME	사원명
//	DEPT_CD	부서코드
//	GRADE_CD	직급코드
//	EMP_TEL	연락처(개인)
//	EMP_DTEL	연락처(사무실)
//	EMP_EMAIL	이메일
//	EMP_PASSWD	비밀번호
//	EMP_POST_NO	우편번호
//	EMP_ADDR	주소
//	HIRE_DATE	입사일
//	WORK_CD	재직코드
//	PRIV_CD	권한
//	PHOTO	사진이미지
	
	int idx; //인덱스
	String emp_num;//사원번호
	String emp_name;//사원명
	String dept_name;//부서명
	String grade_name;//직급명
	String emp_tel;//연락처(개인)
	String emp_dtel;//연락처(사무실)
	String emp_email;//이메일
	String emp_post_no;//우편번호
	String emp_addr;//주소
	Date hire_date;//입사일
	String work_type;//재직 (재직/휴직/퇴사)
	String priv_type;//권한
	String photo;//사진이미지
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public String getEmp_tel() {
		return emp_tel;
	}
	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}
	public String getEmp_dtel() {
		return emp_dtel;
	}
	public void setEmp_dtel(String emp_dtel) {
		this.emp_dtel = emp_dtel;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_post_no() {
		return emp_post_no;
	}
	public void setEmp_post_no(String emp_post_no) {
		this.emp_post_no = emp_post_no;
	}
	public String getEmp_addr() {
		return emp_addr;
	}
	public void setEmp_addr(String emp_addr) {
		this.emp_addr = emp_addr;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public String getWork_type() {
		return work_type;
	}
	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}
	public String getPriv_type() {
		return priv_type;
	}
	public void setPriv_type(String priv_type) {
		this.priv_type = priv_type;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "Emp_viewVO [idx=" + idx + ", emp_num=" + emp_num + ", emp_name=" + emp_name + ", dept_name=" + dept_name
				+ ", grade_name=" + grade_name + ", emp_tel=" + emp_tel + ", emp_dtel=" + emp_dtel + ", emp_email="
				+ emp_email + ", emp_post_no=" + emp_post_no + ", emp_addr=" + emp_addr + ", hire_date=" + hire_date
				+ ", work_type=" + work_type + ", priv_type=" + priv_type + ", photo=" + photo + "]";
	}
	
	


	
	
}














