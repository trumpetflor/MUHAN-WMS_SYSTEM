package com.thisteam.muhansangsa.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class EmployeesVO {
	
	   private int idx;
	   private String emp_Num;
	   private String emp_Name;
	   private String dept_Cd;
	   private String grade_Cd;
	   private String emp_Tel;
	   private String emp_Dtel;
	   private String emp_Email;
	   private String emp_Passwd;
	   private String emp_Post_No;
	   private String emp_Addr;
	   private Date hire_Date;
	   private String work_Cd;
	   private String priv_Cd;
	   private String photo;
	   
		public int getIdx() {
			return idx;
		}
		public void setIdx(int idx) {
			this.idx = idx;
		}
		public String getEmp_Num() {
			return emp_Num;
		}
		public void setEmp_Num(String emp_Num) {
			this.emp_Num = emp_Num;
		}
		public String getEmp_Name() {
			return emp_Name;
		}
		public void setEmp_Name(String emp_Name) {
			this.emp_Name = emp_Name;
		}
		public String getDept_Cd() {
			return dept_Cd;
		}
		public void setDept_Cd(String dept_Cd) {
			this.dept_Cd = dept_Cd;
		}
		public String getGrade_Cd() {
			return grade_Cd;
		}
		public void setGrade_Cd(String grade_Cd) {
			this.grade_Cd = grade_Cd;
		}
		public String getEmp_Tel() {
			return emp_Tel;
		}
		public void setEmp_Tel(String emp_Tel) {
			this.emp_Tel = emp_Tel;
		}
		public String getEmp_Dtel() {
			return emp_Dtel;
		}
		public void setEmp_Dtel(String emp_Dtel) {
			this.emp_Dtel = emp_Dtel;
		}
		public String getEmp_Email() {
			return emp_Email;
		}
		public void setEmp_Email(String emp_Email) {
			this.emp_Email = emp_Email;
		}
		public String getEmp_Passwd() {
			return emp_Passwd;
		}
		public void setEmp_Passwd(String emp_Passwd) {
			this.emp_Passwd = emp_Passwd;
		}
		public String getEmp_Post_No() {
			return emp_Post_No;
		}
		public void setEmp_Post_No(String emp_Post_No) {
			this.emp_Post_No = emp_Post_No;
		}
		public String getEmp_Addr() {
			return emp_Addr;
		}
		public void setEmp_Addr(String emp_Addr) {
			this.emp_Addr = emp_Addr;
		}
		public Date getHire_Date() {
			return hire_Date;
		}
		public void setHire_Date(Date hire_Date) {
			this.hire_Date = hire_Date;
		}
		public String getWork_Cd() {
			return work_Cd;
		}
		public void setWork_Cd(String work_Cd) {
			this.work_Cd = work_Cd;
		}
		public String getPriv_Cd() {
			return priv_Cd;
		}
		public void setPriv_Cd(String priv_Cd) {
			this.priv_Cd = priv_Cd;
		}
		public String getPhoto() {
			return photo;
		}
		public void setPhoto(String photo) {
			this.photo = photo;
		}
		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("EmployeesVO [idx=").append(idx).append(", emp_Num=").append(emp_Num).append(", emp_Name=")
					.append(emp_Name).append(", dept_Cd=").append(dept_Cd).append(", grade_Cd=").append(grade_Cd)
					.append(", emp_Tel=").append(emp_Tel).append(", emp_Dtel=").append(emp_Dtel).append(", emp_Email=")
					.append(emp_Email).append(", emp_Passwd=").append(emp_Passwd).append(", emp_Post_No=")
					.append(emp_Post_No).append(", emp_Addr=").append(emp_Addr).append(", hire_Date=").append(hire_Date)
					.append(", work_Cd=").append(work_Cd).append(", priv_Cd=").append(priv_Cd).append(", photo=")
					.append(photo).append("]");
			return builder.toString();
		}
		
		
}














