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
    <title>입고 등록 | 입고 관리</title>
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

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script> --%>
<!-- 모달창 -->
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
	console.log(${resultList});
</script>
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
	
	.col-lg-6 {
		flex: 100%;
	    max-width: 100%;
	}
	
	#todayDate {
		width: 15%;
	}
	
	.table thead th, td {
    	text-align: center;
    	vertical-align: middle;
    }
    
    .table td, .table th {
    	padding: 0.75rem;
    	vertical-align: middle;
    }
    
    input[type=text], input[type=number], #in_qty_result{
    	text-align: right;
    }
    
    .form-control {
    	display: inline-block; 
	}
	
/* 모달 */
#modal_container{
  position: absolute;
  width:600px;
  height: auto;
  position: fixed;
  top:50%;
  left: 50%;
  transform:translate(-50%,-50%);
  overflow-y: scroll;


}
.close-modal{
  display: none;
}
	
#modal_container_dept{
  position: absolute;
   height: 70%;
  position: fixed;
  top:50%;
  left: 50%;
  transform:translate(-50%,-50%);
  overflow-y: scroll;
  padding: 2px;
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


#modal_container select{
/* 	display: none; */
}

.modal a.close-modal{
	display: none;
}
</style>
<script type="text/javascript">
	// 현재 시간 설정
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("todayDate");
		bir.value = today;
	}
	
	// 입고지시수량 계산
	$(function(){
		$("input[type=number]").on("focusout", function(){
			let sum = 0;
			$("input[type=number]").each(function(){
				sum += Number($(this).val()); 
				document.getElementById('in_qty_result').innerText = sum;
				
				if(sum > )
			});
		    
		});
	}); // 입고지시수량 계산
	
</script>
</head>
<body>
<br>


        <div class="content">
            <div class="animated fadeIn">
            <h3>입고</h3>
            <br>
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">
                                일자 : <input type="date" class="form-control" id="todayDate">
                                </strong>
                            </div>
                            <div class="card-body">
                                <table id="reg_table bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>입고예정번호</th>
                                            <th>품목명</th>
                                            <th>입고예정수량</th>
                                            <th>입고지시수량</th>
                                            <th>재고번호</th>
                                            <th>구역명_선반위치</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:choose>
                                    	<c:when test="${empty resultList }">
                                    		<tr><td colspan="6">데이터가 없습니다.</td></tr>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:set var = "in_schedule_qty_total" value = "0" />
                                    		<c:set var = "in_qty_total" value = "0" />
	                                    	<c:forEach var="inList" items="${resultList }" varStatus="i">
	                                    		<tr>
		                                    		<td>${inList.in_schedule_cd }</td>
		                                    		<td>${inList.product_name }</td>
		                                    		<td>${inList.in_schedule_qty }</td>
		                                    		<td><input type="number" id="in_qty${i.index }" value="${inList.in_schedule_qty }"></td>
		                                    		<td>
<!-- 		                                    		<input type="text" id="stock_cd" name="stock_cd"> -->
		                                    			<div>
														<div class="input-group">
														 <input type="hidden" class="form-control" name="business_no" id="business_no"
														  	value="${product.business_no }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client">
														 <input type="text" class="form-control" name="cust_name" id="cust_name" readonly="readonly"
														  	value="${product.cust_name }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client" required="required">
														  <button class="btn btn-outline-secondary " type="button" id="button-addon"
														  onclick="window.open('Product/ClientSelectList','ClientSelectList','width=500, height=500,location=no,status=no,scrollbars=yes');">검색
														  </button>
														</div>
														</div>
		                                    		</td>
		                                    		<td>
<!-- 		                                    		<input type="text" id="wh_loc_in_area" name="wh_loc_in_area"> -->
														<div> <!-- 수정필요 -->
															<div class="input-group">
															 <input type="hidden" class="form-control" name="business_no" id="business_no"
															  	value="${product.business_no }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client">
															 <input type="text" class="form-control" name="cust_name" id="cust_name" readonly="readonly"
															  	value="${product.cust_name }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client" required="required">
															  <a href="#modal_container" rel="modal:open"><button class="btn btn-outline-secondary " type="button" id="button-addon">검색
															  </button></a>
															</div>
														</div> 
		                                    		</td>
		                                    	</tr>
		                                    	<c:set var="in_schedule_qty_total" value="${in_schedule_qty_total+inList.in_schedule_qty }"/>
		                                    	<c:set var="in_qty_total" value="${in_qty_total+inList.in_schedule_qty }"/>
	                                    	</c:forEach>
                                    	</c:otherwise>
                                    	</c:choose>
												<tr>
													<td colspan="2">합계</td>
													<td><c:out value="${in_schedule_qty_total }" /></td>
													<td id="in_qty_result"><c:out value="${in_qty_total }" /></td>
													<td></td>
													<td></td>
												</tr>
                                    </tbody>
                                </table>
									<div>
										<input type="button" value="저장" class="btn btn-outline-dark" onclick="location.href='InRegisterPro'">
									</div>
								</div>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
    <div class="clearfix"></div>

<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../inc/footer.jsp"></jsp:include>

<!-- Right Panel -->


<!-- 입고 버튼 모달 DIV -->
<div id="modal_container" class="modal">
	<div class="col col-md-3"><label for="inDate" class=" form-control-label">일자</label></div>
	<div class="col-12 col-md-9"><input type="date" id="in_date" name="in_date" class="form-control"></div>

</div>



<!-- <div id="container"> -->
<!-- 	<ul class="tab"> -->
<!-- 		<li data-tab="in_schedule_form" class='tabmenu'><a href="#">TabExample1</a></li> -->
<!-- 		<li data-tab="in_waiting_form" class='tabmenu'><a href="#">TabExample2</a></li> -->
<!-- 		<li data-tab="in_completed_form" class='tabmenu'><a href="#">TabExample3</a></li> -->
<!-- 	</ul> -->
<!-- 	<div id="tabcontent"></div> -->
<!-- </div> -->



<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="resources/assets/js/main.js"></script>


</body>
</html>