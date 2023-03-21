<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title>입고 처리 | 입고 관리</title>

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
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<style type="text/css">

	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}

	
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
		
	#vertical-align{
		 vertical-align: middle;
	}
	table{
	 text-align: center;
	}
	
	inproList-table > th{
	height: 100px;
	}
		
	.id_pht{
	 width: 80px;
	 transition: 0.5s;
	}
	
/* 스크롤바 크기 설정*/
  #modal_container::-webkit-scrollbar {
     width: 3px; 
  }
  #modal_container_dept::-webkit-scrollbar {
     width: 3px; 
    } 
  
/* #modal_container > th { */
/* 	height: 50px; */
/* } */
 a{
 text-decoration: none;
 color: 	#000080;
}
 a:visited :active{
 text-decoration: none;
 color: 	#000080;
}


/* #modal_container select{ */
/* /* 	display: none; */ */
/* } */

/* .modal a.close-modal{ */
/* 	display: none; */
/* } */

/* 모달 */
#modal_container{
  width: 80%; 
  height: 80%;
  position: absolute; 
  top: 30%; 
/*   left: 50%;  */
/*   overflow-y: scroll; */
}
.modal{
	width: 55%!important;
  	max-width: 1000px!important;
  	left: 10%!important;
  	height: 70%!important;
/*   width: 1000px!important;  */
/*   --bs-modal-width: 1000px!important;  */
}

.click:not(:disabled):not(.disabled) {
   cursor: pointer;
}
</style>
<script src="resources/js/jquery-3.6.3.js"></script>
<!-- pageNum 이 없을 경우 기본값 1, 있을 경우 pageNum 값 저장 -->
<c:choose>
	<c:when test="${param.pageNum eq null}">
		<c:set var="pageNum" value="1"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="pageNum" value="${param.pageNum }"></c:set>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
// 입고예정코드 클릭 시 수정 페이지 이동
function modifyOpen(code){
	window.open('InProcessingModifyForm?in_schedule_cd='+code,'InProcessingModifyForm','width=760, height=900, top= 40,left=540,location=no,status=no,scrollbars=yes');
} // 수정페이지

//페이지번호 저장
let pageNum = ${pageNum};
// tab 이동 변수
var realstatus = -1;
// var w = window.open("about:blank","_blank");
$(function(){
	
	let searchType = $("#searchType").val(); // 검색 타입
	let keyword = $("#keyword").val(); // 검색어
	load_list(pageNum, searchType, keyword, realstatus); // 게시물 목록 조회 함수 호출 (pageNum 까지 파라미터로)
	
	//전체선택 버튼 클릭
	$('input:checkbox[name=AllChecked]').on("click",function(){
		if($(this).is(":checked") == true){
			$("input[name=inChecked]").prop("checked",true);
			$("#selectCount > small").html($('input:checkbox[name=inChecked]:checked').length +" 개 선택됨");
		}else{
			$("input[name=inChecked]").prop("checked",false);
			$("#selectCount > small").html($('input:checkbox[name=inChecked]:checked').length +" 개 선택됨");
		}
	});	//전체선택버튼
	
	// 체크박스 클릭
	$(document).on("change","input[name=inChecked]",function(){
		$("#selectCount > small").html($('input:checkbox[name=inChecked]:checked').length +" 개 선택됨");
		let in_schedule_cd = $(this).val();
		console.log($(this).val());
	});//체크박스
	
	// 입고 버튼 클릭 시
	$("#inScheduleBtn").click(function(){
		let inRegisterArr = new Array();
		$('input:checkbox[name=inChecked]').each(function(index){
			if($(this).is(":checked")==true){
				let index = $(this).val();
				let inList = new Object();
				inList.in_schedule_cd = $("#in_schedule_cd" + index).val();
				inList.product_name = $("#product_name" + index).val();
				inList.in_date = $("#in_date" + index).val();
				inRegisterArr.push(inList);
				
				console.log($(this).val());
				console.log(inList.in_schedule_cd);
				console.log(inList.product_name);
			}
		});
			
// 			window.open('InRegister','InRegister','width=1500, height=800,location=no,status=no,scrollbars=yes');
			
			$.ajax({
				type: "POST",
				url: "InRegister",
				contentType: "application/json",
				data: JSON.stringify(inRegisterArr),
				success: function(result) {
					inRegisterOpen();
				},
				fail: function() {
					alert("요청 실패!");
				}
			});
						
				
				
	}); //입고버튼
	

});//제이쿼리

function inRegisterOpen(){
// 	w.location.href = "InRegister";
}

	
//탭
function load_tab(status){
	let searchType = $("#searchType").val(); // 검색 타입
	let keyword = $("#keyword").val(); // 검색어
	load_list(pageNum, searchType, keyword, status);
}

// 게시물 목록 조회
function load_list(pageNum, searchType, keyword, status) { // 파라미터 : 현재 페이지, 검색 타입, 검색어
	$.ajax({
		type: "GET",
		url: "InProcessingListJson?pageNum=" + pageNum + "&searchType=" + searchType + "&keyword=" + keyword + "&status=" + status,
		dataType: "json"
	})
	.done(function(jsonArray) { // 요청 성공 시
		
		$("#inprocessing_table > tbody").empty(); // 리스트 출력 테이블 구역 비우기
		$("#pageArea").empty(); // 페이지 번호 구역 비우기
		$('html'). scrollTop(0); // 스크롤 맨 위로 보내기
		let pageList = ''; // 페이지 번호 출력 코드 변수 선언 (블록 외부에서 사용하기 위해서!)
		let number = $(this).closest("tr").index();
			
		// ================================= for문 사용 ====================================================
		for(let index = 0; index < jsonArray.length - 1; index++) { 
			// 자바 스크립트 함수 파라미터 용 변수 선언 (숫자를 문자열로 보내기 위함)
			let code = '"' + jsonArray[index].in_schedule_cd + '"';
			
			// 뿌릴 내용
			let result = "<tr>"
						+ "<td align='center'><input type='checkbox' name='inChecked' id='inChecked' value='" + index + "'>"
						+ "<input type='hidden' value='" + jsonArray[index].in_schedule_cd + "' id='in_schedule_cd" + index + "'>"
						+ "<input type='hidden' value='" + jsonArray[index].product_name + "' id='product_name" + index + "'>"
						+ "<input type='hidden' value='" + jsonArray[index].in_date + "' id='in_date" + index + "'>"
						+ "</td>"
						+ "<td class='click' onclick='modifyOpen(" + code + ")'>" + jsonArray[index].in_schedule_cd + "</td>"
						+ "<td>" + jsonArray[index].cust_name + "</td>"
						+ "<td>" + jsonArray[index].product_name + "</td>"
						+ "<td>" + jsonArray[index].in_date + "</td>"
						+ "<td>" + jsonArray[index].in_schedule_qty + "</td>"
						+ "<td>" + jsonArray[index].in_qty + "</td>"
						+ "<td>" + jsonArray[index].no_in_qty + "</td>"
						+ "<td>" + jsonArray[index].remarks + "</td>"
						+ "</tr>";
			$("#inprocessing_table").append(result);
		}
		
		// 자바 스크립트 함수 파라미터 용 변수 선언(문자열)
		let valSt = "'" + searchType + "'";
		let valKey = "'" + keyword + "'";
		
		// PageInfo 객체 접근 (jsonArray 의 맨 마지막 인덱스) 해서 startPage 와 endPage 얻어오기 -> 차례대로 숫자 목록 저장
		if(pageNum > 1) {
			pageList += '&nbsp;&nbsp;<a href="javascript:load_list(' + (pageNum - 1) + ', ' + valSt + ', ' + valKey + ', ' + status + ')">이전</a>';
		} else {
			pageList += '&nbsp;&nbsp;<a href="javascript:(0)">이전</a>';
		}
		
		for(let i = jsonArray[jsonArray.length - 1].startPage; i <= jsonArray[jsonArray.length - 1].endPage; i++) {
			if(i == pageNum) { // 현재 페이지와 같을 경우 작동 X
				pageList += '&nbsp;&nbsp;<a href="javascript:(0)" style="color: #212529; font-weight: bold;">' + i +'</a>'; 
			} else { // 현재 페이지와 다를 경우 ajax 를 호출하는 함수가 동작하도록
				pageList += '&nbsp;&nbsp;<a href="javascript:load_list(' + i + ', ' + valSt + ', ' + valKey + ', ' + status + ')">' + i + '</a>';
			}
		}
		
		if(pageNum < jsonArray[jsonArray.length - 1].endPage) {
			pageList += '&nbsp;&nbsp;<a href="javascript:load_list(' + (pageNum + 1) + ', ' + valSt + ', ' + valKey + ', ' + status + ')">다음</a>';
		} else {
			pageList += '&nbsp;&nbsp;<a href="javascript:(0)">다음</a>';
		}

//			alert(pageList);
		
		$("#pageArea").append(pageList); // 페이지 번호 표출 div(id="pageArea") 에 페이지 숫자 목록(pageList) 넣기
		
	})
	.fail(function() {
		$("#inprocessing_table").append("요청 실패..ㅠㅠ");
	}); // ajax 끝
} // load_list 함수 끝
	
	
	
</script>
<body>

<!-- left bar -->
<jsp:include page="../inc/left.jsp"></jsp:include>

<!-- 선택 탭 -->
<div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1 click" onclick="location.href='InProcessing'"><b>입고 처리</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href='javascript:void(0);'>입고 관리</a></li>
                                    <li><a href='javascript:void(0);'>입고 처리</a></li>
                                   
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<div class="content">
   <div class="animated fadeIn">
	<section id="searchSection" class="m-0 d-flex justify-content-end">
  		<form action="InProcessing">
				<!-- 검색 타입 추가 -->
				<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1">
					<option value="in_schedule_code" <c:if test="${param.searchType eq 'in_schedule_code'}">selected</c:if>>입고예정번호</option>
					<option value="cust_name" <c:if test="${param.searchType eq 'cust_name'}">selected</c:if>>보낸곳명</option>
					<option value="product_name" <c:if test="${param.searchType eq 'product_name'}">selected</c:if>>품목명</option>
				</select>			
				<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword" value="${param.keyword }"> 
				<input type="submit" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" >
		</form>
	 </section>
	 
	<!-- nav바 (tab)  -->
	<!-- onclick="load_list(숫자값)" 사용으로 상태(status) 구분 
	   (-1:전체, 0:입고중, 1:입고완료) -->

	<div class="default-tab" style="margin-bottom: 35px">
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="nav-home-tab"
					data-toggle="tab" href="#" onclick="load_tab(-1)" role="tab"
					aria-controls="nav-home" aria-selected="true">전체</a> 
				<a	class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
					href="#" onclick="load_tab(0)" role="tab"
					aria-controls="nav-profile" aria-selected="false">입고 중</a>
				<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
					href="#" onclick="load_tab(1)" role="tab"
					aria-controls="nav-contact" aria-selected="false">입고 완료</a>
			</div>
		</nav>
	</div>
	<c:if test="${priv eq 1 }">
 	 	<div id = "selectCount"><small class="text-secondary"> 0 개 선택됨</small></div>
  	</c:if>
<!-- 	<form action="InRegister" method="post" name="form" enctype="multipart/form-data" class="form-horizontal"> -->
	<table class="table  vertical-align"  id="inprocessing_table">
		<thead>
			<tr>
				<th><input type="checkbox" name="AllChecked"></th>
				<th>입고예정번호</th>
				<th>보낸곳명</th>
				<th>품목명[규격]</th>
				<th>납기일자</th>
				<th>입고예정수량</th>
				<th>입고수량</th>
				<th>미입고수량</th>
				<th>적요</th>
			</tr>
		</thead>
		<tbody>
			<!-- ajax -->
		</tbody>
	</table>
    <!-- 페이징처리 -->
	<div class="row" id="pageList" style="text-align: center;">
		<div class="col-lg-12">
			<div class="product_pagenation" id="pageArea">
			</div>
		</div>
	</div>
	<c:if test="${priv eq '1' }"> <!-- 권한 -->
		<div class="float-left">
		<div id="modal-btn-div" class="float-right mt-4">
			<input type="button" value="입고" class = "btn btn-sm btn-success m-2" id="inScheduleBtn">
		</div>
		</div>
	</c:if>
<!-- 	</form> -->
<!-- onclick="javascript:register();"  -->









            </div><!-- .animated -->
        </div><!-- .content -->

        <div class="clearfix"></div>


<!-- footer -->
<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../inc/footer.jsp"></jsp:include>
    

</body>
</html>
