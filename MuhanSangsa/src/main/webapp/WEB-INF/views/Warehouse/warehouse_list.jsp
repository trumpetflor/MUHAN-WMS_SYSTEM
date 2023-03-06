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
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
	function modifyOpen(code){
		window.open('WarehouseModifyForm?wh_cd='+code,'WarehouseModifyForm','width=1000, height=920,location=no,status=no,scrollbars=yes');
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
</style>
<body>

<jsp:include page="../inc/left.jsp"></jsp:include>
 <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>창고 목록</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li>재고 관리</li>
                                    <li>창고 관리</li>
                                    <li class="active">창고 조회</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
<!--                 <div class="row"> -->

<!--                     <div class="col-md-12"> -->
<!--                         <div class="card"> -->
<!--                             <div class="card-header"> -->
<!--                                 <strong class="card-title">창고 목록</strong> -->
<!--                             </div> -->
<!--                             <div class="card-body"> -->
                                <table id="warehouse_table" class="table">
                                    <thead>
                                        <tr>
                                            <th>창고코드</th>
                                            <th>창고명</th>
                                            <th>구분</th>
<!--                                             <th>위치</th> -->
                                            <th>주소</th>
<!--                                             <th>전화번호</th> -->
                                            <th>관리자명</th>
                                            <th>사용여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:choose>
                                    	<c:when test="${empty whList }">
                                    		<tr><td colspan="10">데이터가 없습니다.</td></tr>
                                    	</c:when>
                                    	<c:otherwise>
	                                    	<c:forEach var="warehouse" items="${whList }" varStatus="status">
		                                    	<tr>
		                                    		<td><a id="wh_cd" href='javascript:void(0);' onclick="window.open('WarehouseModifyForm?wh_cd=${warehouse.wh_cd }','WarehouseModifyForm','width=1000, height=920,location=no,status=no,scrollbars=yes');">${warehouse.wh_cd }</a></td>
		                                    		<td><a id="wh_name" href='javascript:void(0);' onclick="window.open('WarehouseModifyForm?wh_cd=${warehouse.wh_cd }','WarehouseModifyForm','width=1000, height=920,location=no,status=no,scrollbars=yes');">${warehouse.wh_name }</a></td>
		                                    		<td>
		                                    		<input type="hidden" value="${status.begin }" id="begin">
		                                    			<c:choose>
		                                    				<c:when test="${warehouse.wh_gubun eq '1'}">
		                                    				창고
		                                    				</c:when>
		                                    				<c:otherwise>
		                                    				공장
		                                    				</c:otherwise>
		                                    			</c:choose>
		                                    		</td>
<!-- 		                                    		<td> -->
<%-- 		                                    			<c:choose> --%>
<%-- 		                                    				<c:when test="${warehouse.wh_location eq '1'}"> --%>
<!-- 		                                    				내부 -->
<%-- 		                                    				</c:when> --%>
<%-- 		                                    				<c:otherwise> --%>
<!-- 		                                    				외부 -->
<%-- 		                                    				</c:otherwise> --%>
<%-- 		                                    			</c:choose> --%>
<!-- 		                                    		</td> -->
		                                    		<td>${warehouse.wh_addr }</td>
<%-- 		                                    		<td>${warehouse.wh_tel }</td> --%>
		                                    		<td>${warehouse.wh_man_name }</td>
		                                    		<td>
		                                    			<c:choose>
		                                    				<c:when test="${warehouse.wh_use eq '1'}">
		                                    				사용
		                                    				</c:when>
		                                    				<c:otherwise>
		                                    				미사용
		                                    				</c:otherwise>
		                                    			</c:choose>
		                                    		</td>
		                                    	</tr>
	                                    	</c:forEach>
                                    	</c:otherwise>
                                    	</c:choose>
                                    </tbody>
                                </table>
									<div>
										<input type="button" value="신규입력" class="btn btn-outline-dark" onclick="location.href='WarehouseInsertForm'">
									</div>
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->


<!--                 </div> -->
            </div><!-- .animated -->
        </div><!-- .content -->

        <div class="clearfix"></div>

<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../inc/footer.jsp"></jsp:include>


<!-- Scripts -->
<!--     <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!--     <script src="assets/js/main.js"></script> -->


<!--     <script src="assets/js/lib/data-table/datatables.min.js"></script> -->
<!--     <script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script> -->
<!--     <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script> -->
<!--     <script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script> -->
<!--     <script src="assets/js/lib/data-table/jszip.min.js"></script> -->
<!--     <script src="assets/js/lib/data-table/vfs_fonts.js"></script> -->
<!--     <script src="assets/js/lib/data-table/buttons.html5.min.js"></script> -->
<!--     <script src="assets/js/lib/data-table/buttons.print.min.js"></script> -->
<!--     <script src="assets/js/lib/data-table/buttons.colVis.min.js"></script> -->
<!--     <script src="assets/js/init/datatables-init.js"></script> -->


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
      } );
  </script>


</body>
</html>
