package com.thisteam.muhansangsa.vo;

import java.sql.Date;

public class EmployeesVO {

	private int idx; //인덱스
	   private String emp_num; // 사원번호
	   private String emp_name; // 사원명
	   private String dept_cd; // 부서코드
	   private String grade_cd; //직급코드
	   private String emp_tel; //연락처(개인)
	   private String emp_dtel; //연락처(사무실)
	   private String emp_email; 
	   private String emp_passwd; //로그인 시 사용 
	   private String emp_post_No; 
	   private String emp_addr;
	   private Date hire_date; //입사일
	   private String work_cd; //재직코드
	   private String priv_cd; //권한
	   private String photo;
	
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
		public String getDept_cd() {
			return dept_cd;
		}
		public void setDept_cd(String dept_cd) {
			this.dept_cd = dept_cd;
		}
		public String getGrade_cd() {
			return grade_cd;
		}
		public void setGrade_cd(String grade_cd) {
			this.grade_cd = grade_cd;
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
		public String getEmp_passwd() {
			return emp_passwd;
		}
		public void setEmp_passwd(String emp_passwd) {
			this.emp_passwd = emp_passwd;
		}
		public String getEmp_post_No() {
			return emp_post_No;
		}
		public void setEmp_post_No(String emp_post_No) {
			this.emp_post_No = emp_post_No;
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
		public String getWork_cd() {
			return work_cd;
		}
		public void setWork_cd(String work_cd) {
			this.work_cd = work_cd;
		}
		public String getPriv_cd() {
			return priv_cd;
		}
		public void setPriv_cd(String priv_cd) {
			this.priv_cd = priv_cd;
		}
		public String getPhoto() {
			return photo;
		}
		public void setPhoto(String photo) {
			this.photo = photo;
		}
		
		@Override
		public String toString() {
			return "EmployeesVO [idx=" + idx + ", emp_num=" + emp_num + ", emp_name=" + emp_name + ", dept_cd="
					+ dept_cd + ", grade_cd=" + grade_cd + ", emp_tel=" + emp_tel + ", emp_dtel=" + emp_dtel
					+ ", emp_email=" + emp_email + ", emp_passwd=" + emp_passwd + ", emp_post_No=" + emp_post_No
					+ ", emp_addr=" + emp_addr + ", hire_date=" + hire_date + ", work_cd=" + work_cd + ", priv_cd="
					+ priv_cd + ", photo=" + photo + "]";
		}

}














