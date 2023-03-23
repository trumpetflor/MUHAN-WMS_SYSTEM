<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title>재고 조회</title>

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
	
	empList-table > th{
	height: 100px;
	}
		
	.id_pht{
	 width: 80px;
	 transition: 0.5s;
	}
	





/* 모달 */
#modal_container{
  position: absolute;
  width: 90%;
  height: 50%;
  position: fixed;
  top:50%;
  left: 50%;
  transform:translate(-50%,-50%);
  overflow-y: scroll;
  overflow: visible;
}
	
#modal_container_dept{
  position: absolute;
  width: 70%;
  height: 70%;
  position: fixed;
  top:50%;
  left: 50%;
  transform:translate(-50%,-50%);
  overflow-y: scroll;
  overflow: visible;
}
	
/* 스크롤바 크기 설정*/
  #modal_container::-webkit-scrollbar {
    width: 3px;
  }
  #modal_container_dept::-webkit-scrollbar {
    width: 3px;
  }
  
#modal_container > th {
	height: 50px;
}
 a{
 text-decoration: none;
 color: 	#000080;
}
 a:visited :active{
 text-decoration: none;
 color: 	#000080;
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
//페이지번호 저장
let pageNum = ${pageNum};
	$(function() {
		let searchType = $("#searchType").val(); // 검색 타입
		let keyword = $("#keyword").val(); // 검색어	
		load_list(pageNum, searchType, keyword); // 게시물 목록 조회 함수 호출
		
		$("#searchBtn").on("click", function() {
// 			alert("keyword:"+ $("#keyword").val());
			console.log("눌러짐");
			load_list(pageNum, searchType, $("#keyword").val());
		});
	});

	// 재고 목록 조회 함수
	function load_list(pageNum, searchType, keyword) {
		console.log(searchType);
		console.log(keyword);
		$.ajax({
			type: "GET",
			url:"StockListJsonIn?pageNum=" + pageNum + "&searchType=" + searchType + "&keyword=" + keyword , 
			dataType: "json"
		})
		.done(function(jsonArray) { // 요청 성공 시
			$("#stock_table > tbody").empty(); // 리스트 출력 테이블 구역 비우기
			$("#pageArea").empty(); // 페이지 번호 구역 비우기
			let pageList = ''; // 페이지 번호 출력 코드 변수 선언 (블록 외부에서 사용하기 위해서!)
			for(let index = 0; index < jsonArray.length - 1; index++) { 
				let result = "<tr>"
							+ "<td id="+jsonArray[index].stock_cd+">" + jsonArray[index].stock_cd + "</td>"
							+ "<td id="+jsonArray[index].product_name+">" + jsonArray[index].product_name + "</td>"
							+ "<td id="+jsonArray[index].wh_area+">" + jsonArray[index].wh_area + "</td>"
							+ "<td id="+jsonArray[index].wh_loc_in_area+">" + jsonArray[index].wh_loc_in_area + "</td>"
							+ "</tr>";
				
			$("#stock_table > tbody").append(result);
			}
			
			// 자바 스크립트 함수 파라미터 용 변수 선언(문자열)
			let valSt = "'" + $("#searchType").val() + "'";
			let valKey = "'" + $("#keyword").val() + "'";
			
			// PageInfo 객체 접근 (jsonArray 의 맨 마지막 인덱스) 해서 startPage 와 endPage 얻어오기 -> 차례대로 숫자 목록 저장
			if(pageNum > 1) {
				pageList += '&nbsp;&nbsp;<a href="javascript:load_list(' + (pageNum - 1) + ', ' + valSt + ', ' + valKey + ')">이전</a>';
			} else {
				pageList += '&nbsp;&nbsp;<a href="javascript:(0)">이전</a>';
			}
			
			for(let i = jsonArray[jsonArray.length - 1].startPage; i <= jsonArray[jsonArray.length - 1].endPage; i++) {
				if(i == pageNum) { // 현재 페이지와 같을 경우 작동 X
					pageList += '&nbsp;&nbsp;<a href="javascript:(0)" style="color: #212529; font-weight: bold;">' + i +'</a>'; 
				} else { // 현재 페이지와 다를 경우 ajax 를 호출하는 함수가 동작하도록
					pageList += '&nbsp;&nbsp;<a href="javascript:load_list(' + i + ', ' + valSt + ', ' + valKey + ')">' + i + '</a>';
				}
			}
			
			if(pageNum < jsonArray[jsonArray.length - 1].endPage) {
				pageList += '&nbsp;&nbsp;<a href="javascript:load_list(' + (pageNum + 1) + ', ' + valSt + ', ' + valKey + ')">다음</a>';
			} else {
				pageList += '&nbsp;&nbsp;<a href="javascript:(0)">다음</a>';
			}

//				alert(pageList);
			
			$("#pageArea").append(pageList); // 페이지 번호 표출 div(id="pageArea") 에 페이지 숫자 목록(pageList) 넣기
		})
		.fail(function() {
			$("#stock_table").append("요청 실패!!");
		});
	}


</script>
<body>

<div class="content">
   <div class="animated fadeIn">
	<section id="searchSection" class="m-0 d-flex justify-content-end">

 					<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1 mx-4">
						<option value="stock_cd">재고 번호</option>
						<option value="product_name">품목명</option>
						<option value="wh_area">구역명</option>
						<option value="wh_loc_in_area">위치명</option>
					</select>
			<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword"  onkeyup="if(window.event.keyCode==13){load_list()}" > 
			<input type="button" id="searchBtn" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1">

	   </section>

	<table class="table table-hover"  id="stock_table">
		<thead>
			<tr>
			<input type='hidden' id='tr_index'>
				<th>재고 번호</th>
				<th>품목명</th>
				<th>구역명</th>
				<th>위치명</th>
			</tr>
		</thead>
		<tbody>
            <!-- AJAX를 통해 얻은 JSON 데이터 뿌려짐 -->
        </tbody>
	</table>
    <!-- 페이징처리 -->
	<div class="row" id="pageList" style="text-align: center;">
		<div class="col-lg-12">
			<div class="product_pagenation" id="pageArea">
			</div>
		</div>
	</div>

</div>
</div>


</body>
</html>