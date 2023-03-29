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
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.6.3.js"></script> -->
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
   	text-align: center;
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

/*재고검색 모달창*/
#stock_search_modalDiv{
width: 500px;
height: 600px;
}

#stock_search_modalDiv table tbody tr :hover{
cursor: pointer;
}
#stock_search_modalDiv::-webkit-scrollbar {
   width: 2px;
 }

#stock_search_modalDiv{
width: 500px;
height: 600px;
 position: fixed;
 top: 20%;
  left: 40%;
 overflow-y: scroll;

}

#modal_container > th {
	height: 50px;
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
th {
    text-align: center!important;
}
table {
    text-align: center!important;
}
</style>
<script type="text/javascript">
	// 재고 모달에서 값 가져오기
// 	$(document).on("click", "#stock_search_modalDiv #stock_table > tbody tr", function(index, item){
// 		var index = 
// 		console.log("index : " + index);
// 		console.log($(this).children("td").attr("id"));
// 		console.log($(this).children("td").next().next().attr("id"));
		
// 		let tr_index = $("#tr_index").val();
// 		console.log("tr_index: "+tr_index);
// 		$("input[name=stock_cd]").eq(tr_index).val($(this).children("td").attr("id"));
// 		$("input[name=wh_loc_in_area]").eq(tr_index).val($(this).children("td").next().next().attr("id")+"_"+
// 				$(this).children("td").next().next().next().attr("id"));
		
// 		 $('#stock_search_modalDiv').modal('hide'); 
// 		     $('#stock_search_modalDiv').hide();
// 		     $('.jquery-modal').click();
	
// 	});
	
	
// 재고검색버튼
$(document).on("click", ".stock_cd_btn", function(){

	let index = $(this).closest("tr").index();
	console.log("index_tr: "+$(this).closest("tr").index());
	
		$.ajax({
			type: "GET",
			url: "In/StockSelectList",
			contentType: 'html',
			success: function(data,status,xhr){
				$('#stock_search_modalDiv').html(data);
				$("#tr_index").val(index);
			},
	        error: function(xhr,status,error) {
	            console.log(error);
	        }

		}); 

	//모달창 열기
	$('#stock_search_modalDiv').modal('show');

	
});// 재고검색버튼
	
// 재고 모달에서 값 가져오기
$(document).on("click", "#stock_search_modalDiv #stock_table > tbody tr", function(){
	let tr_index = $("#tr_index").val();
	console.log("tr_index: "+tr_index);

	$("input[name=stock_cd]").eq(tr_index).val($(this).children("td").attr("id"));
	$("input[name=wh_loc_in_area]").eq(tr_index).val($(this).children("td").next().next().attr("id")+"_"+
			$(this).children("td").next().next().next().attr("id"));
	
	 $('#stock_search_modalDiv').modal('hide'); 
	     $('#stock_search_modalDiv').hide();
	     $('.jquery-modal').click();

});

// 선반검색버튼
$(document).on("click", ".whLoc_cd_btn", function(){
	
	let index = $(this).closest("tr").index();
	console.log("index_tr: "+$(this).closest("tr").index());
	
	$.ajax({
		type: "GET",
		url: "In/WhLocSelectList",
		contentType: 'html',
		success: function(data,status,xhr){
			$('#whLoc_search_modalDiv').html(data);
			$("#tr_index").val(index);
		},
        error: function(xhr,status,error) {
            console.log(error);
        }
	});
	
	//모달창 열기
	$('#whLoc_search_modalDiv').modal('show');
	
}); // 선반검색버튼
	
// 창고선반 모달에서 값 가져오기
$(document).on("click","#whLoc_search_modalDiv #whLoc_table > tbody tr",function(){
	let tr_index = $("#tr_index").val();
	console.log("tr_index: "+tr_index);
	
	$("input[name=wh_loc_in_area]").eq(tr_index).val($(this).children("td").attr("id")+"_"+$(this).children("td").next().attr("id"));
//  	$("#wh_area"+index).val($(this).children("td").next().attr("id"));
//  	$("#wh_loc_in_area"+index).val($(this).children("td").attr("id"));
	
	 $('#whLoc_search_modalDiv').modal('hide'); 
	     $('#stock_search_modalDiv').hide();
	     $('.jquery-modal').click();

});

// 현재 시간 설정
window.onload = function() {
	today = new Date();
	console.log("today.toISOString() >>>" + today.toISOString());
	today = today.toISOString().slice(0, 10);
	console.log("today >>>> " + today);
	bir = document.getElementById("todayDate");
	bir.value = today;
}

// 재고번호 신규 생성
function newStockCd(index){
	$.ajax({
		type: "GET",
		url: "NewStockCd",
		success: function(result){
			$("#stock_cd"+index).val(result);
		}
	});
	
}
	
	
	
$(function(){
	// 입고지시수량 계산
	$("input[type=number]").on("change", function(){
		var index = $(this).closest("tr").index();
		let original_sum = $("#original_qty").val();
		console.log(index);
		let sum = 0;
		$("input[type=number]").each(function(){
			sum += Number($(this).val()); 
			document.getElementById('in_qty_result').innerText = sum;
				
		});
		
		var in_schedule_qty = $("#in_schedule_qty"+index).val();
		var in_qty = $("#in_qty"+index).val();
		
		if(in_qty > in_schedule_qty){
			alert('입고예정수량을 초과할 수 없습니다!');
			$("#in_qty"+index).val(in_schedule_qty);
			$("#in_qty_result").text(original_sum);
		}
	    
		
	}); // 입고지시수량 계산
	
	
}); //jQuery

</script>
</head>
<body>
<br>

<div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div>
        <div class="content">
            <div class="animated fadeIn">
            <h3>입고</h3>
            <br>
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">
                                일자 : <input type="date" class="form-control" id="todayDate" name="out_date">
                                </strong>
                            </div>
                            <div class="card-body">
                                <form action="InRegisterPro" method="post" enctype="multipart/form-data">
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
	                                    			<input type="hidden" name="product_cd" value="${inList.product_cd}">
	                                    			<input type="hidden" name="in_date" value="${inList.in_date}">
		                                    		<td><input type="text" class="form-control rounded-start" name="in_schedule_cd" value="${inList.in_schedule_cd }" readonly="readonly"></td>
		                                    		<td><input type="text" class="form-control rounded-start" name="product_name" value="${inList.product_name }" readonly="readonly"></td>
		                                    		<td><input type="text" class="form-control rounded-start" name="in_schedule_qty" id="in_schedule_qty${i.index }" value="${inList.in_schedule_qty }" readonly="readonly"></td>
		                                    		<td><input type="number" class="form-control rounded-start" name="in_qty" id="in_qty${i.index }" value="${inList.in_schedule_qty }"></td>
		                                    		<td><!-- 재고번호 검색 -->
														<div class='d-flex'><!-- 수정 필요 -->
													 	  <input type="text" class="form-control rounded-start" id="stock_cd${i.index }" name="stock_cd" value="${inList.stock_cd }" onclick="newStockCd(${i.index})" readonly="readonly"> 
<%-- 													 	  <input type="hidden" name="end" id="end" value="${i.end }"> --%>
													 	  <input type="hidden" name="index" id="index" value="${i.index }">
								<!-- 							 <a href="#stock_search_modalDiv" rel="modal:open"> -->
															 <input type="button" value="검색" class="btn btn-sm btn-dark p-2 stock_cd_btn" id="stock_searchBtn${i.index }" >
								<!-- 							 </a> -->
														</div>
		                                    		</td>
		                                    		<td><!-- 선반명 검색 -->
														<div class='d-flex'><!-- 수정 필요 -->
														<c:choose>
														  <c:when test="${inList.stock_cd eq 0 }">
													 	  <input type="text" class="form-control rounded-start" name="wh_loc_in_area" id="wh_loc_in_area${i.index }"> 
													 	  </c:when>
													 	  <c:otherwise>
													 	  <input type="text" class="form-control rounded-start" name="wh_loc_in_area" id="wh_loc_in_area${i.index }" value="${inList.wh_loc_in_area }">
													 	  </c:otherwise>
													 	</c:choose> 
<!-- 													 	  <input type="hidden" name="product_name" id="product_name" value=""> -->
<!-- 															 <a href="#stock_search_modalDiv" rel="modal:open"> -->
															 <input type="button" value="검색" class="btn btn-sm btn-dark p-2 whLoc_cd_btn" id="whLoc_searchBtn${i.index }">
								<!-- 							 </a> -->
														</div>
														<c:set var="end" value="${i.end }" />
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
													<td id="in_qty_result"><c:out value="${in_qty_total }" />
													<input type="hidden" id="original_qty" value="${in_qty_total }"></td>
													<td></td>
													<td></td>
												</tr>
                                    </tbody>
                                </table>
									<div>
										<input type="submit" value="저장" class="btn btn-outline-dark">
									</div>
                                </form>
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


<!-- 재고번호 모달 DIV -->
<div id="stock_search_modalDiv" class="modal">

</div>

<!-- 선반위치 모달 DIV -->
<div id="whLoc_search_modalDiv" class="modal">

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