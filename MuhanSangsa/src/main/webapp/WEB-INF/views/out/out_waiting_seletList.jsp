<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>출고예정 | 출고관리</title>

<meta charset="utf-8">
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/cs-skin-elastic.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- 모달창 -->
<!-- Remember to include jQuery :) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<style type="text/css">
@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

select * from
	
	body {
	font-family: 'NEXON Lv1 Gothic OTF';
	width: 100%;
	height: 100%;
}

#vertical-align {
	vertical-align: middle;
}

table {
	text-align: center;
}

a {
	text-decoration: none;
	color: #000080;
}

a:visited :active {
	text-decoration: none;
	color: #000080;
}

/* 모달 */
#modal_container_stock {
	width: 70%;
	height: 700px;
	position: fixed;
	top: 10%;
	left: 50%;
	overflow-y: scroll;
}
</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->

<script type="text/javascript">
	
	/* 종결, 취소 상태 변환 */
	/* 매개변수로 출고예정코드, 진행상태(미완료/완료), 상태(탭이동-전체/진행중/완료)  */
	function fn_change(out_schedule_cd,out_complete,status) {
		let result = confirm("종결여부를 변경하시겠습니까?");
		
		if(result){
			$.ajax({
				type: "GET",
				url: "./OutWaitingChangeStautsJson?out_schedule_cd=" + out_schedule_cd + "&out_complete=" + out_complete + "&status=" + status, 
				dataType: "json"
			})
			.done(function() { // 요청 성공 시
				alert("변경이 완료되었습니다");
				load_list(status);
			})
			.fail(function() { //요청 실패 시
				alert("요청 실패");
			});

		}
		
	}
	
	
	//출고 예정 목록 조회 페이지 조회용(JSON)
	//매개변수 : status(-1:전체, 0:진행중 1:완료)로 데이터 전송 구분함!
	var realstatus = -1; // tab이동 시 해당 tab에서 검색을 하기 위해 전역 변수 사용! 
	
	function load_list(status) {
		if(status != 2){ 
			realstatus= status;
		}
		//alert(realstatus);
		$.ajax({
			type: "GET",
			url: "./OutWaitingSelectListJson?keyword=" + $("#keyword").val() + "&searchType=" + $("#searchType").val() + "&status=" + realstatus, 
			dataType: "json"
		})
		.done(function(resultList) { // 요청 성공 시
			let result ="";
			let sum = 0; // 출고예정수량 총 합계 수량 계산을 위해 변수 선언
			for(let row of resultList) {
				result += "<tr>"
// 							+ "<th align='center'>"+ "<input type='checkbox' name='stockChecked' id='stockChecked'>" + "</th>" // 체크박스
							+ "<td>"+ row.out_schedule_cd + "</td>" //출고예정번호
							+ "<td>"+ "발주서" + "</td>" //유형(테이블 컬럼없어서 임의로 데이터 삽입)
							+ "<td>"+ row.cust_name + "</td>" //받는곳명(거래처명)
							+ "<td>"+ row.emp_name + "</td>" //담당자명
							+ "<td>"+ row.product_name + "</td>" //품목명
							+ "<td>"+ row.out_date + "</td>" //납기일자
							+ "<td>"+ row.out_schedule_qty + "</td>" //출고예정수량합계
							+ "<td><a href=\"#none\" onclick=\"window.open('OutWaitingChecking?out_schedule_cd="+row.out_schedule_cd+"','OutList','width=800, top=50,left=600, height=300,location=no,status=no,scrollbars=yes');\">조회</a></td>" ;

						/* 230209 tab(전체:-1/진행중:0/완료:1)이동을 위한 작업 => "종결=진행중, 취소=완료"로 정리함! */
						if(row.out_complete == 0){
							result 	+= "<td>"+ "<a href='javascript:fn_change(\""+row.out_schedule_cd+"\",\""+ row.out_complete+"\","+status+")' style=\"color:blue\" >종결</a>" + "</td>"; //종결
							result 	+= "<td>"+ "진행중" + "</td>"; // 종결 = 진행중 
											
						}	else{
							result 	+= "<td>"+ "<a href='javascript:fn_change(\""+row.out_schedule_cd+"\",\""+ row.out_complete+"\","+status+")' style=\"color:red\">취소</a>" + "</td>"; //종결
							result 	+= "<td>"+ "완료"  + "</td>"; // 취소 = 완료
						}
						
				result 	+= "</tr>";
				
				sum += row.out_schedule_qty;  //출고예정수량 총 합계 수량
			}
			result += "<tr>"
						+ "<td colspan='9' align='right'><b>합계 :&nbsp;&nbsp;</b></td><td id='sum_result'>"+sum+" </td>" // 위에서 계산된 합계 표시
			result 	+= "</tr>";				
			
			$("#OutWaitingTable > tbody").html(result); // OutWaitingTable 안에 결과값 출력 
		})
		.fail(function() { //요청 실패 시
			$("#OutWaitingTable").append("요청 실패!!");
		});
		
	}

	//---------------------------------------------------체크박스 시작---------------------------------------------
	$(function(){
		//전체 조회이므로 -1로 리스트 호출
		load_list(-1);
		
		
		//전체선택 버튼 클릭
		$('input:checkbox[name=AllChecked]').on("click",function(){
			if($(this).is(":checked") == true){
				$("input[name=stockChecked]").prop("checked",true);
			}else{
				$("input[name=stockChecked]").prop("checked",false);
			}
		});
		
		//체크박스 클릭
		$(document).on("change","input[name=stockChecked]",function(){
			$("#selectCount > small").html($('input:checkbox[name=stockChecked]:checked').length +" 개 선택됨");
			let stock_cd = $(this).val();
			
			
		});
		//하단 조정버튼 클릭시
		$("#stockAdjustmentBtn").on("click",function(){
			
			let stock_cd = [];//배열 선언, 변수명 컨트롤러 파라미터명과 동일
	     	$('input:checkbox[name=stockChecked]').each(function (index) {
	     		
	     		if($(this).is(":checked")==true){
	     	    	console.log("id값=stock_cd :"+$(this).val());
	     	   		stock_cd.push($(this).val());//배열에 추가
	     	    }
	     	});
			
	    	console.log("stock_cd[] : "+ stock_cd);
	    	let result = confirm("재고번호 "+$('input:checkbox[name=stockChecked]:checked').length+ " 개를 조정하시겠습니까? ");
	    	if(result){
		    	location.href="StockAdjustment?stock_cd="+stock_cd
	    	}
		});
			
	});//---------------------------------------------------체크박스 끝---------------------------------------------
</script>
<body>

	<jsp:include page="../inc/left.jsp"></jsp:include>

	<div class=" pr-4 mr-4 mb-1 mt-4 float-right">
		<small> *접속 IP: ${ip}</small>
	</div>
	<div class=" breadcrumbs m-0">
		<div class="breadcrumbs-inner rounded-start p-2 ">
			<div class="row m-0 ">
				<div class="col-sm-4 ">
					<div class="page-header float-left rounded-start ">
						<div class="page-title ">
							<h1 class="m-1">
								<b>출고 예정 관리</b>
							</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8 rounded-pill ">
					<div class="page-header float-right rounded-start ">
						<div class="page-title ">
							<ol class="breadcrumb text-right ">
								<li><a href="#">출고 예정</a></li>
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
			<section id="searchSection" class="m-0 d-flex justify-content-end">
				<form action="javascript:void(0);">
					<!-- 검색 타입 추가 -->
					<select name="searchType" id="searchType"
						class="rounded-1 btn-sm p-1">
						<option value="out_schedule_cd"
							<c:if test="${searchType eq 'out_schedule_cd'}">selected</c:if>>출고예정번호</option>
					</select> 
					<input type="text" class="col-sm-5 bg-light border border-secondary rounded-1 px-1" 
					name="keyword" id="keyword" value="${keyword }"
						onkeyup="if(window.event.keyCode==13){load_list(2)}">
					<input type="button" value="검색" class=" mx-1 btn btn-sm btn-dark rounded-1"
						onclick="javascript:load_list(2)">
				</form>
			</section>
			<!-- nav바 (tab)  -->
			<!-- onclick="load_list(숫자값)" 사용으로 상태(status) 구분 
			   (-1:전체, 0:진행중 1:완료) -->

			<div class="default-tab" style="margin-bottom: 35px">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab"
							data-toggle="tab" href="#" onclick="load_list(-1)" role="tab"
							aria-controls="nav-home" aria-selected="true">전체</a> 
						<a	class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
							href="#" onclick="load_list(0)" role="tab"
							aria-controls="nav-profile" aria-selected="false">진행중</a> <a
							class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
							href="#" onclick="load_list(1)" role="tab"
							aria-controls="nav-contact" aria-selected="false">완료</a>
					</div>
				</nav>
			</div>

			<!-- 출고 예정 목록 표시 
	 출고예정번호, 유형, 받는곳명, 담당자명, 품목명, 납기일자, 출고예정수량합계, 종결여부, 진행상태 표시 -->

<!-- 			<div id="selectCount"> -->
<!-- 				<small class="text-secondary"> 0 개 선택됨</small> -->
<!-- 			</div> -->
			<table class="table" id="OutWaitingTable">
				<thead>
					<tr>
<!-- 						<td align="center"><input type="checkbox" name="AllChecked"></td> -->
						<th>출고예정번호</th>
						<th>유형</th>
						<th>받는곳명(거래처명)</th>
						<th>담당자명</th>
						<th>품목명</th>
						<th>납기일자</th>
						<th>출고예정수량합계</th>
						<th>조회</th>
						<th>종결여부</th>
						<th>진행상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- AJAX를 통해 얻은 JSON 데이터 뿌려짐 -->

				</tbody>

			</table>
			<div class="float-left">
				<input type="button" value="신규등록" class="btn btn-sm btn-success m-2"
					onclick="location.href='OutInsertForm'">
			</div>

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