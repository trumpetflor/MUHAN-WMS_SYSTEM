<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<html >
<head>
	<title>품목 조회</title>

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
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
<!-- 모달창 -->
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript">
	//검색 기능 추가
	function fn_search() {
		location.href = "./ProdSelectList?keyword=" + $("#keyword").val() 
				+ "&searchType=" + $("#searchType").val();
	}

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
	 font-family: 'NEXON Lv1 Gothic OTF' ;
	 width: 100%;
	 height: 100%;
	}
	
	li {
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
  width: 70%;
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

a:hover {
  text-decoration: underline;
}

</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->
<script type="text/javascript">
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
                               <h1 class="m-1"><b>품목 관리</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="./ProdSelectList">품목조회</a></li>
                                    <li><a href="./ProdInsertForm">품목등록</a></li>
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
				<!-- 검색 타입 추가 -->
				<form action="">
				<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1">
					<option value="product_name" <c:if test="${searchType eq 'product_name'}">selected</c:if>>품목명</option>
					<option value="product_group_bottom_name" <c:if test="${searchType eq 'product_group_bottom_name'}">selected</c:if>>그룹명</option>
					<option value="cust_name" <c:if test="${searchType eq 'cust_name'}">selected</c:if>>거래처명</option>
				</select>			
				<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword" value="${keyword }" onkeyup="if(window.event.keyCode==13){fn_search()}"> 
				<input type="button" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" onclick="javascript:fn_search()">
				</form>
	   </section>

	<table class="table"  id="">
		<thead>
			<tr>
				<th>품목코드</th>
				<th>품목명</th>
				<th>그룹명</th>
				<th>거래처명</th>
				<th>바코드</th>
				<th>입고단가</th>
				<th>출고단가</th>
				<th>품목구분</th>
				<th>대표이미지</th>
<!-- 				<th>관리</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="productList" items="${productList }">
			<tr>
				<td>
				    <a id="updateBtn" href='javascript:void(0);' onclick="window.open('ProdUpdateForm?product_cd=${productList.product_cd}','ProdUpdateForm','width=800, height=920,location=no,status=no,scrollbars=yes');">
				    ${productList.product_cd}</a>
				</td>
				<td>
				    <a id="updateBtn" href='javascript:void(0);' onclick="window.open('ProdUpdateForm?product_cd=${productList.product_cd}','ProdUpdateForm','width=800, height=920,location=no,status=no,scrollbars=yes');">
				    ${productList.product_name}</a>
				</td>
				<td>${productList.product_group_bottom_name}</td>
				<td>${productList.cust_name}</td>
				<td>${productList.barcode}</td>
				<td><fmt:formatNumber value="${productList.in_unit_price}" pattern="#,###" />원</td>
				<td><fmt:formatNumber value="${productList.out_unit_price}" pattern="#,###" />원</td>
				<td>
				    <c:choose>
				        <c:when test="${productList.product_type_cd eq '1'}">
				            ${fn:replace(productList.product_type_cd, '1', '원재료')}    
				        </c:when>
				        <c:when test="${productList.product_type_cd eq '2'}">
				            ${fn:replace(productList.product_type_cd, '2', '부재료')}     
				        </c:when>
				        <c:when test="${productList.product_type_cd eq '3'}">
				            ${fn:replace(productList.product_type_cd, '3', '제품')}    
				        </c:when>
				        <c:when test="${productList.product_type_cd eq '4'}">
				            ${fn:replace(productList.product_type_cd, '4', '반제품')}     
				        </c:when>
				        <c:when test="${productList.product_type_cd eq '5'}">
				            ${fn:replace(productList.product_type_cd, '5', '제품')}     
				        </c:when>
				    </c:choose>
				</td>
				<td><img class="id_pht" src="<%=request.getScheme()+"://"+request.getServerName() + ":" + request.getServerPort() +"/"+request.getContextPath()%>/resources/upload/product/${productList.product_image }"
					onerror="this.src='${pageContext.request.contextPath}/resources/images/prod_img.png';" style="width: 80px;height: 80px"></td>
<!-- 				<td> -->
<!-- 					<input type="button" value="상세정보" class = "btn btn-primary btn-sm m-1" name="updateBtn" id="updateBtn" -->
<%--                   	 onclick="window.open('ProdUpdateForm?product_cd=${productList.product_cd}','ProdUpdateForm?','width=800, height=920,location=no,status=no,scrollbars=yes');"> --%>
<!-- 				</td> -->
			</tr>
			</c:forEach>
		</tbody>
	
	</table>
	<div class="float-right">
		<input type="button" value="신규 품목 등록" class = "btn btn-sm btn-success m-2" onclick="location.href='ProdInsertForm'">
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
