package com.thisteam.muhansangsa.vo;

public class PrivilegeVO {

//	PRIV_CD	권한코드
//	PRIV_TYPE	권한유형
	
	String priv_cd;
	String priv_type; //기본등록(0), 사원조회(1), 사원관리(2), 재고조회(3), 재고관리(4)
	
	public String getPriv_cd() {
		return priv_cd;
	}
	public void setPriv_cd(String priv_cd) {
		this.priv_cd = priv_cd;
	}
	public String getPriv_type() {
		return priv_type;
	}
	public void setPriv_type(String priv_type) {
		this.priv_type = priv_type;
	}
	@Override
	public String toString() {
		return "PrivilegeVO [priv_cd=" + priv_cd + ", priv_type=" + priv_type + "]";
	}

	

	
}














