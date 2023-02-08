<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html >
<head>
	<title> 재고조회 | 재고이력</title>

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
		
	#vertical-align{
		 vertical-align: middle;
	}
	table{
	 text-align: center;
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
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->
<script type="text/javascript">
	let pageNum = 1;
	
	$(function() {
		$(window).scroll(function() {
			// 1. window 객체와 document 객체를 활용하여 스크롤 관련 값 가져오기
			let scrollTop = $(window).scrollTop();
			let windowHeight = $(window).height();
			let documentHeight = $(document).height();
			

			// 2. 스크롤바 위치값 + 창 높이 + x 가 문서 전체 높이 이상이면
			//    다음 페이지 게시물 목록 로딩하여 추가
			if(scrollTop + windowHeight + 1 >= documentHeight) {
				// 다음 페이지 로딩하기 위한 load_list() 함수 호출
				// => 이 때, 페이지 번호를 1 증가시켜 다음 페이지 목록 로딩
				pageNum++;
// 				load_list(searchType, keyword);
			}
		});
	});
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
                               <h1 class="m-1"><b>재고 관리</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="employees">재고 관리</a></li>
                                    <li><a href="#">재고 이력</a></li>
                                   
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<div class="content">
   <div class="animated fadeIn">

	<!-- 해당 재고번호의 재고 이력 표시 화면 띄우기 -->
	<table class="table"  id="">
		<thead>
			<tr>
				<th width="220px">작업일자</th><!-- 	 재고번호 클릭 시 재고 이력 표시 화면(창) 띄우기 --> 
				<th width="100px">작업구분</th>
				<th width="450px">품목명</th>
				<th width="150px">보내는 재고번호</th>
				<th width="150px">받는 재고번호</th>
				<th width="150px">수량</th>
				<th width="150px">작업자명</th>
				<th>적요</th>
			</tr> 
		</thead>
		<tbody>
		<c:forEach items="${stockHistoryList }" var="stockHistory" varStatus="status" >
			<tr>
				<td>${stockHistory.stock_date }</td>
				<c:choose >
					<c:when test="${stockHistory.stock_control_type_cd eq '0'}">
						<td>${fn:replace(stockHistory.stock_control_type_cd, '0', '입고')}
					</c:when>
					<c:when test="${stockHistory.stock_control_type_cd eq '1'}">
						<td>${fn:replace(stockHistory.stock_control_type_cd, '1', '출고')}
					</c:when>
					<c:when test="${stockHistory.stock_control_type_cd eq '2'}">
						<td>${fn:replace(stockHistory.stock_control_type_cd, '2', '조정')}
					</c:when>
					<c:when test="${stockHistory.stock_control_type_cd eq '3'}">
						<td>${fn:replace(stockHistory.stock_control_type_cd, '3', '이동')}
					</c:when>
				</c:choose>
				<td>${stockHistory.product_name }</td>
				<td><a href="Inventory_History_View?stock_cd=${stockHistory.source_stock_cd }">${stockHistory.source_stock_cd }</a></td>
				<td><a href="Inventory_History_View?stock_cd=${stockHistory.target_stock_cd }">${stockHistory.target_stock_cd }</a></td>
				<td>${stockHistory.qty }</td>
				<td>${stockHistory.emp_name }</td>
				<td>${stockHistory.remarks }</td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>

</div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../inc/footer.jsp"></jsp:include>
    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>
