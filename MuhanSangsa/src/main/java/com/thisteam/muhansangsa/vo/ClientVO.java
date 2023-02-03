package com.thisteam.muhansangsa.vo;

import java.util.Arrays;

/*
Field      |Type         |Null|Key|Default|Extra|
-----------+-------------+----+---+-------+-----+
BUSINESS_NO|varchar(30)  |NO  |PRI|       |     |
CUST_NAME  |varchar(100) |NO  |   |       |     |
BOSS_NAME  |varchar(50)  |YES |   |       |     |
UPTAE      |varchar(50)  |YES |   |       |     |
JONGMOK    |varchar(50)  |YES |   |       |     |
TEL        |varchar(50)  |YES |   |       |     |
EMAIL      |varchar(100) |YES |   |       |     |
POST_NO    |varchar(8)   |YES |   |       |     |
ADDR       |varchar(500) |YES |   |       |     |
G_GUBUN    |varchar(2)   |YES |   |       |     |
FAX        |varchar(50)  |YES |   |       |     |
MOBILE_NO  |varchar(50)  |YES |   |       |     |
URL_PATH   |varchar(100) |YES |   |       |     |
MAN_NAME   |varchar(50)  |YES |   |       |     |
MAN_TEL    |varchar(50)  |YES |   |       |     |
MAN_EMAIL  |varchar(100) |YES |   |       |     |
REMARKS    |varchar(2000)|YES |   |       |     |
 */

public class ClientVO {
	
	private String business_no;
	private String cust_name;
	private String boss_name;
	private String uptae;
	private String[] uptaeArr; // 업태 배열 (DB X)
	private String jongmok;
	private String[] jongmokArr; // 종목 배열 (DB X)
	private String tel;
	private String email;
	private String post_no;
	private String addr;
	private String detailedAddr; // 상세 주소 (DB X)
	private String g_gubun;
	private String fax;
	private String mobile_no;
	private String url_path;
	private String man_name;
	private String man_tel;
	private String man_email;
	private String remarks;
	
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
	public String getBoss_name() {
		return boss_name;
	}
	public void setBoss_name(String boss_name) {
		this.boss_name = boss_name;
	}
	public String getUptae() {
		return uptae;
	}
	public void setUptae(String uptae) {
		this.uptae = uptae;
	}
	public String[] getUptaeArr() {
		return uptaeArr;
	}
	public void setUptaeArr(String[] uptaeArr) {
		this.uptaeArr = uptaeArr;
	}
	public String getJongmok() {
		return jongmok;
	}
	public void setJongmok(String jongmok) {
		this.jongmok = jongmok;
	}
	public String[] getJongmokArr() {
		return jongmokArr;
	}
	public void setJongmokArr(String[] jongmokArr) {
		this.jongmokArr = jongmokArr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost_no() {
		return post_no;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailedAddr() {
		return detailedAddr;
	}
	public void setDetailedAddr(String detailedAddr) {
		this.detailedAddr = detailedAddr;
	}
	public String getG_gubun() {
		return g_gubun;
	}
	public void setG_gubun(String g_gubun) {
		this.g_gubun = g_gubun;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getUrl_path() {
		return url_path;
	}
	public void setUrl_path(String url_path) {
		this.url_path = url_path;
	}
	public String getMan_name() {
		return man_name;
	}
	public void setMan_name(String man_name) {
		this.man_name = man_name;
	}
	public String getMan_tel() {
		return man_tel;
	}
	public void setMan_tel(String man_tel) {
		this.man_tel = man_tel;
	}
	public String getMan_email() {
		return man_email;
	}
	public void setMan_email(String man_email) {
		this.man_email = man_email;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@Override
	public String toString() {
		return "ClientVO [business_no=" + business_no + ", cust_name=" + cust_name + ", boss_name=" + boss_name
				+ ", uptae=" + uptae + ", uptaeArr=" + Arrays.toString(uptaeArr) + ", jongmok=" + jongmok
				+ ", jongmokArr=" + Arrays.toString(jongmokArr) + ", tel=" + tel + ", email=" + email + ", post_no="
				+ post_no + ", addr=" + addr + ", detailedAddr=" + detailedAddr + ", g_gubun=" + g_gubun + ", fax="
				+ fax + ", mobile_no=" + mobile_no + ", url_path=" + url_path + ", man_name=" + man_name + ", man_tel="
				+ man_tel + ", man_email=" + man_email + ", remarks=" + remarks + "]";
	}
	
}














