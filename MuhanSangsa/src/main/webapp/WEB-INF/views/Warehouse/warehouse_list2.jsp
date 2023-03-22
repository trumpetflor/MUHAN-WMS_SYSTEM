<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>창고 조회 | 창고 관리</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
	<!-- CSS only -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
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
function modifyOpen(code){
	window.open('WarehouseModifyForm?wh_cd='+code,'WarehouseModifyForm','width=1000, height=920,location=no,status=no,scrollbars=yes');
}

//페이지번호 저장
let pageNum = ${pageNum};
// tab 이동 변수
var realstatus = -1;

$(function() {
	
	let searchType = $("#searchType").val(); // 검색 타입
	let keyword = $("#keyword").val(); // 검색어
	load_list(pageNum, searchType, keyword, realstatus); // 게시물 목록 조회 함수 호출 (pageNum 까지 파라미터로)
});

// 탭
function load_tab(status){
	let searchType = $("#searchType").val(); // 검색 타입
	let keyword = $("#keyword").val(); // 검색어
	load_list(pageNum, searchType, keyword, status);
}
// 게시물 목록 조회
function load_list(pageNum, searchType, keyword, status) { // 파라미터 : 현재 페이지, 검색 타입, 검색어
	$.ajax({
		type: "GET",
		url: "WarehouseListJson?pageNum=" + pageNum + "&searchType=" + searchType + "&keyword=" + keyword + "&status=" + status,
		dataType: "json"
	})
	.done(function(jsonArray) { // 요청 성공 시
		
		$("#warehouse_table > tbody").empty(); // 리스트 출력 테이블 구역 비우기
		$("#pageArea").empty(); // 페이지 번호 구역 비우기
		$('html'). scrollTop(0); // 스크롤 맨 위로 보내기
		let pageList = ''; // 페이지 번호 출력 코드 변수 선언 (블록 외부에서 사용하기 위해서!)
		
			
		// ================================= for문 사용 ====================================================
		for(let index = 0; index < jsonArray.length - 1; index++) { 
			// 자바 스크립트 함수 파라미터 용 변수 선언 (숫자를 문자열로 보내기 위함)
			let code = '"' + jsonArray[index].wh_cd + '"';
			// 뿌릴 내용
			let result = "<tr>"
						+ "<td class='click' onclick='modifyOpen(" + code + ")'>" + jsonArray[index].wh_cd + "</td>"
						+ "<td class='click' onclick='modifyOpen(" + code + ")'>" + jsonArray[index].wh_name + "</td>"
						+ "<td>" + jsonArray[index].wh_gubun + "</td>"
						+ "<td>" + jsonArray[index].wh_addr + "</td>"
						+ "<td>" + jsonArray[index].wh_tel + "</td>"
						+ "<td>" + jsonArray[index].wh_man_name + "</td>"
						+ "<td>" + jsonArray[index].wh_use + "</td>"
						+ "</tr>";
			$("#warehouse_table").append(result);
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
		$("#warehouse_table").append("요청 실패..ㅠㅠ");
	}); // ajax 끝
} // load_list 함수 끝

</script>
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
/* 	 width: 100%; */
/* 	 height: 100%; */
}
	
#warehouse_table{
	 vertical-align: middle;
}
table{
	text-align: center;
}

td {
	height: 40px;
}

.click:not(:disabled):not(.disabled) {
   cursor: pointer;
}
</style>
<body>

<jsp:include page="../inc/left.jsp"></jsp:include>
 <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class="breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left rounded-start">
                            <div class="page-title">
                                <h1 class="m-1 click" onclick="location.href='WarehouseList'"><b>창고 목록</b></h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li>재고 관리</li>
                                    <li>창고 관리</li>
                                    <li>창고 조회</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
				<section id="searchSection" style="margin-bottom: 10px;" class="d-flex justify-content-end">
					<form action=WarehouseList>
						<!-- 검색 타입 추가 -->
						<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1">
						<option value="wh_cd" <c:if test="${param.searchType eq 'wh_cd'}">selected</c:if>>창고코드</option>
						<option value="wh_name" <c:if test="${param.searchType eq 'wh_name'}">selected</c:if>>창고명</option>
						<option value="wh_addr" <c:if test="${param.searchType eq 'wh_addr'}">selected</c:if>>주소</option>
						<option value="wh_tel" <c:if test="${param.searchType eq 'wh_tel'}">selected</c:if>>전화번호</option>
						<option value="wh_man_name" <c:if test="${param.searchType eq 'wh_man_name'}">selected</c:if>>관리자명</option>
						</select>			
						<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword" value="${param.keyword }"> 
						<input type="submit" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" >
					</form>
				</section>
				
			<!-- nav바 (tab)  -->
			<!-- onclick="load_list(숫자값)" 사용으로 상태(status) 구분 
			   (-1:전체, 0:창고내부, 1:창고외부, 2:공장) -->

			<div class="default-tab" style="margin-bottom: 35px">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab"
							data-toggle="tab" href="#" onclick="load_tab(-1)" role="tab"
							aria-controls="nav-home" aria-selected="true">전체</a> 
						<a	class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
							href="#" onclick="load_tab(0)" role="tab"
							aria-controls="nav-profile" aria-selected="false">창고 내부</a>
						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
							href="#" onclick="load_tab(1)" role="tab"
							aria-controls="nav-contact" aria-selected="false">창고 외부</a>
						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
							href="#" onclick="load_tab(2)" role="tab"
							aria-controls="nav-contact" aria-selected="false">공장</a>
					</div>
				</nav>
			</div>
				
                <table id="warehouse_table" class="table">
                    <thead>
                        <tr>
                            <th>창고코드</th>
                            <th>창고명</th>
                            <th>구분</th>
                            <th>주소</th>
                            <th>전화번호</th>
                            <th>관리자명</th>
                            <th>사용여부</th>
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
					<button type="button" class="btn btn-sm btn-success m-2" onclick="location.href='WarehouseInsertForm'">신규 등록</button>
            	</c:if>
            </div><!-- .animated -->
        </div><!-- .content -->

        <div class="clearfix"></div>

<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../inc/footer.jsp"></jsp:include>



<script type="text/javascript">
$(document).ready(function() {
	$('#bootstrap-data-table-export').DataTable();
} );
</script>


</body>
</html>
