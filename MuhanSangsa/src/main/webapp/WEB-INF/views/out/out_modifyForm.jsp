<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title> 출고 예정 수정 | 출고처리</title>

    <meta charset="utf-8">
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 모달창 -->
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<style type="text/css">
	
	@font-face {
	    font-family: 'NEXON Lv1 Gothic OTF';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	body {
	 font-family: 'NEXON Lv1 Gothic OTF';
	 width: 100%;
	 height: 100%;
	}
	

	a{
	 text-decoration: none;
	 color: 	#000080;
	}
	 a:visited :active{
	 text-decoration: none;
	 color: 	#000080;
	}
	
	#table_top {
		vertical-align: middle;
	}
	
	#table_top th {
		height: 100px;
		vertical-align: middle;
	}
	#table_top td {
		vertical-align: middle;
	}
	#table_top input[type=date] {
		width: 180px;	
	}
	#table_top input[type=text] {
		width: 200px;	
	}
	
	#table_top .rounded-start{
		width: 300px;	
		border: 1px;
	}
	
	#table_bottom input[name=remark]{
		width: 120px;
		align-items: center;
	}
	
	#table_bottom input[type=number]{
		width: 80px;
	}
	
	#table_bottom input[type=date]{
		width: 150px;
	}
	
	*{
		font-family: 'NEXON Lv1 Gothic OTF';
	}
	
	a{
	text-decoration: none;
	}
	
	li{
		font-family: 'NEXON Lv1 Gothic OTF' !important;
	
	}

	
	/* 모달 */
	.modal{
	max-width: 1000px;
	
	}
	
	.modal a.close-modal{
	 display: none;

	}
	#modal_container_stock{
	  width:800PX;
 	 height: 500px;
	  position: fixed;
	  top: 20%;
	  left: 40%;
	  overflow-y: scroll;
	}
	.modal_container_stock::-webkit-scrollbar {
    width: 2px;
  }
	
	tr{
	 position: relative;
	}
	
	.search_div{
	    width: 400px;
	    height: 350px;
	    background-color: white;
	    position: absolute;
	    top: 35px;
	    margin-left: 10px;
	    overflow: scroll;
	    display: none;
	    z-index: 1;
	    box-shadow: 1px 1px 20px 3px rgba(169, 168, 167, 0.2);
	    border-color: rgba(169, 168, 167, 0.2);
	}
	
	.search_div::-webkit-scrollbar {
    width: 3px;
  }
	.search_div ul{
	padding-left: 0
	}
	.search_div li{
	
	text-align: left;
	vertical-align: middle;
	background:  url(${pageContext.request.contextPath}/resources/images/loc_pin.png) no-repeat 0px 1px;
    list-style-type: none;
    padding: 1px 1px 8px 30px;
    transition: 0.5s;
    margin-top: 2px;
    height: 50px;
  
	}
	
	
	th {
	
/* 	 width: 150px; */
	 border-left: 1px;
	}
/*  	*td{  */
/*  	 align:center;  */
/* 	}  */
	

	.search_div li:hover {
	background-color: rgba(169, 168, 167, 0.5);
	cursor: pointer;
	}
	
	/* 위치검색 div내의 X버튼 --- 안됨 ㅠ*/

	.close-loc-Btn :hover {
		cursor: pointer;
		background-color: rgba(169, 168, 167, 0.3);
	}
	/* 새 위치 추가 버튼 --- 안됨 ㅠ*/
	.search_div .add-New-loc :hover {
		cursor: pointer;  
	}
	
	#stock-table  input:disabled {
    background-color: rgba(169, 168, 167, 0.2) !important;
	}

	/* ------------------------------------------------------------------------- */
	/*사원검색 모달창*/
	#emp_search_modalDiv{
	width: 500px;
	height: 600px;
	}
	
	#emp_search_modalDiv table tbody tr :hover{
	cursor: pointer;
	}
	#emp_search_modalDiv::-webkit-scrollbar {
    width: 2px;
  }
	
	#client_search_modalDiv{
	width: 500px;
	height: 600px;
	 position: fixed;
	 top: 20%;
	  left: 40%;
	 overflow-y: scroll;
	
	}
	
	/*emp_search_modalDiv 켰을때 검색버튼보여서 수정함*/
.input-group .btn{
		z-index: 0;
	}
.input-group .btn:focus {
z-index: 0;
}
</style>
<script type="text/javascript">
// $(function() {
	
// 	$("#modifyProBtn").click(function() {
		
// 		// 자바스크립트 배열의 장점은 제한이 없음(갯수)
// 		let modifyArr = new Array();
		
		
// 		// .jsonCheck 선택자에 해당하는 체크박스 갯수만큼 반복
// 		// 만약 체크박스가 여러군데 있다면 class ="jsonCheck" 로 묶어주기
// 		// 다른곳에 있는 체크박스가 영향을 받지 않도록
// 		// function(index, item) 몇번째인지, 무슨 아이템인지 전달
// 		$("#table_bottom").each(function(index,item){
// 				console.log(index + " : " + item);

// 			// AJAX 요청을 통해 JSON 데이터 전송
// 			$.ajax({
// 				type : "Post",
// 				url : "outScheduleModifyPro",
// 				dataType : "text", // 응답 데이터 타입
// 				contentType : "application/json", // 요청시 전송되는 데이터 타입
// 				data : JSON.stringify(), // 변수가 아니라 데이터 타입이라 바로 입력 
// 				success : function(result) {
// 					alert(result);
// 				},
// 				fail: function() {
// 					alert("요청 실패!");
// 				}
// 			});
		
		
// 	});// btn()

// });




</script>
<body>
<jsp:include page="../inc/left.jsp"></jsp:include>

 <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>출고 예정 수정</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="#">출고 처리</a></li>
                                    <li><a href="#">출고 관리</a></li>
                                   
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<!-- Link to open the modal -->
<!-- <p><a href="#modal_container" rel="modal:open">Open Modal</a></p> -->

<div class="content">
   <div class="animated fadeIn">
	 
	<form action="outScheduleModifyPro">
	<table class="table" id="table_top">
		<c:forEach items="${outModifyFixedList}" var="out" varStatus="status" >
		<thead>
            <tr>
				<th>출고예정번호</th>
				<td><input type="text" class="form-control" value="${out.out_schedule_cd} " readonly="readonly"></td>
				<th>유형</th> <!-- 수정해서 사용하세요!! 기존꺼 복붙해둠!! -->
				<td align="left">
					<div class="m-1"><input type="radio" disabled="disabled" value="1" name="out_type" class="form-check-input" id="Purchase_Order" > 발주서</div>
					<div class="m-1"><input type="radio" checked="checked" value="2" disabled="disabled"  name="out_type" class="form-check-input" id="release"> 출고</div>
				 </td>
			</tr>
			<tr><!-- 구매거래처(거래처 테이블에서 검색하여 선택)  -->
				<th>거래처</th>
					<td>	
						<div class='d-flex'>
					 	  <input type="text" class="form-control" id="cust_name" value="${out.cust_name} " readonly="readonly" placeholder=" 검색하세요."> 
							 <input type="button" value="검색" class="btn btn-sm btn-dark p-2" id="cust_searchBtn">
<!-- 							 </a> -->
						</div>
					</td>
				<th>납기 일자</th>
				<td><input type="date" class="form-control" value="${out.out_date}"  readonly="readonly"></td>
			</tr>
			<tr>
				<th>담당자</th>
				<td>	
					<div class='d-flex'>
				 	  <input type="text" class="form-control" id="emp_name" value="${out.emp_name} "readonly="readonly" placeholder=" 검색하세요."> 
						 <a href="#emp_search_modalDiv" rel="modal:open"><input type="button" value="검색" class="btn btn-sm btn-dark p-2"></a>
					</div>
				</td>
				<th>등록 일자</th>
				<td><input type="text" class="form-control" value="${out.out_cd_1}" readonly="readonly"></td>
			</tr>
			</thead>
			</c:forEach>
			</table>
			<!-- 품목 추가  -->
			<table class="table" id="table_bottom">
			<thead>
			<tr><td class="space" colspan="10" /></tr>
			<tr align="center">
<!-- 				<th>출고예정번호</th>	 품목코드 클릭 시 재고 이력 표시 화면(창) 띄우기  -->
				<th width="150px">거래처명</th>
				<th width="200px">품목명</th>
				<th>예정수량</th>
				<th>지시수량</th>
				<th>납기일자</th>
				<th>적요</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${outModifyList}" var="out" varStatus="status" >
					<input type="hidden" name="out_schedule_cd" value="${out.out_schedule_cd}">
					<input type="hidden" name="cust_name" value="${out.cust_name}">
					<input type="hidden" name="product_name" value="${out.product_name}">
					<tr align="center">
						<td>${out.cust_name}</td>
						<td>${out.product_name}</td>
						<td><input type="number" name="out_schedule_qty" value="${out.out_schedule_qty}" class="form-control"></td>
						<td><input type="number" name="out_qty" value="${out.out_qty}" class="form-control"></td>
						<td><input type="date" name="out_date" value="${out.out_date}" class="form-control"></td>
						<td><input type="text" name="remarks" value="${out.remarks}" class="form-control"></td>
					</tr>
				</c:forEach>
			</tbody>

	</table>
	<input type="submit" value="수정" class = "btn btn-primary mx-4"  />
	</form>
</div>
</div>

<jsp:include page="../inc/footer.jsp"></jsp:include>
    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>