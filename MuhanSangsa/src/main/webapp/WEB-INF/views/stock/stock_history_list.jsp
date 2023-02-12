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
	<section id="searchSection" class="m-0 d-flex justify-content-end">
  		<form action="Inventory_History_View">
  			<input type="hidden" name="stock_cd" value="${param.stock_cd }">
				<!-- 검색 타입 추가 -->
				<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1">
					<option value="STOCK_DATE" <c:if test="${param.searchType eq 'STOCK_DATE'}">selected</c:if>>작업일자</option>
					<option value="STOCK_CONTROL_TYPE_CD" <c:if test="${param.searchType eq 'STOCK_CONTROL_TYPE_CD'}">selected</c:if>>작업구분</option>
					<option value="EMP_NAME" <c:if test="${param.searchType eq 'EMP_NAME'}">selected</c:if>>작업자명</option>
				</select>			
				<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword" value="${param.keyword }"> 
				<input type="submit" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" >
		</form>
   </section>
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
	
	<!-- 23/02/11 페이징 처리 기능 추가 -->
	<div class="float-right">
	<section id="pageList">
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
					<c:when test="${empty param.pageNum }">
						<c:set var="pageNum" value="1" />
					</c:when>
					<c:otherwise>
						<c:set var="pageNum" value="${param.pageNum }" />
					</c:otherwise>
				</c:choose>
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" class = "btn btn-primary btn-sm  " onclick="location.href='Inventory_History_View?pageNum=${pageNum - 1}&stock_cd=${param.stock_cd }'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전" class = "btn btn-primary btn-sm  ">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="Inventory_History_View?pageNum=${i }&stock_cd=${param.stock_cd }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" value="다음" class = "btn btn-primary btn-sm  " onclick="location.href='Inventory_History_View?pageNum=${pageNum + 1}&stock_cd=${param.stock_cd }'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음" class = "btn btn-primary btn-sm  ">
			</c:otherwise>
		</c:choose>
	</section>
	</div>
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
