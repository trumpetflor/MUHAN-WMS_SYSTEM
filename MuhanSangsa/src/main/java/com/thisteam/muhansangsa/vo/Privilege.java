package com.thisteam.muhansangsa.vo;
	//기본등록(0), 사원조회(1), 사원관리(2), 재고조회(3), 재고관리(4);
	public enum Privilege {

		기본등록(0), 사원조회(1), 사원관리(2), 재고조회(3), 재고관리(4), 창고관리(5), 거래처관리(6);

		//외부에서 접근 못하도록 private으로 선언
		private int code ;
		private Privilege(int code) {
			this.code = code;
		}
	
	public int getCode() {
		return code;
	}
	
//	public String getBinaryCode() {
//		String BinaryCode = "ABCDE";
//		BinaryCode.charAt(code);
//		BinaryCode.replace(BinaryCode.charAt(code), '1').replaceAll("[A-Z]", "0");
//		return BinaryCode.replace(BinaryCode.charAt(code), '1').replaceAll("[A-Z]", "0");
//	}
	

	
	
}
