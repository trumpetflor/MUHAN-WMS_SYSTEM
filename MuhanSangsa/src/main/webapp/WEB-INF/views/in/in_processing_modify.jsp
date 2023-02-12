<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title> 입고예정수정 | 입고처리</title>

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
	
	.table thead th {
    vertical-align: middle;
    }
	
	#vertical-align{
		 vertical-align: middle;
	}
	table{
	 text-align: center;
	}
	input[type=number]{
		width: 75px;
	}
	input[type=text]{
	
		align-content: center;
	}

	a{
	 text-decoration: none;
	 color: 	#000080;
	}
	 a:visited :active{
	 text-decoration: none;
	 color: 	#000080;
	}
	
	/* 모달 */
	.modal{
	max-width: 1000px;
	}
	#modal_container_stock{
	  width:800PX;
 	 height: 500px;
	  position: fixed;
	  top: 20%;
	  left: 40%;
	  overflow-y: scroll;
	}
	.modal_container_stock::-webkit-scrollbar {
    width: 2px;
  }
	
	tr{
	 position: relative;
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
	.search_div ul{
	padding-left: 0
	}
	.search_div li{
	
	text-align: left;
	vertical-align: middle;
	background:  url(${pageContext.request.contextPath}/resources/images/loc_pin.png) no-repeat 0px 1px;
    list-style-type: none;
    padding: 1px 1px 8px 30px;
    transition: 0.5s;
    margin-top: 2px;
    height: 50px;
  
	}
	
	.search_div li:hover {
	background-color: rgba(169, 168, 167, 0.5);
	cursor: pointer;
	}
	
	/* 위치검색 div내의 X버튼 --- 안됨 ㅠ*/

	.close-loc-Btn :hover {
		cursor: pointer;
		background-color: rgba(169, 168, 167, 0.3);
	}
	/* 새 위치 추가 버튼 --- 안됨 ㅠ*/
	.search_div .add-New-loc :hover {
		cursor: pointer;  
	}
	
	#stock-table  input:disabled {
    background-color: rgba(169, 168, 167, 0.2) !important;
	}
</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->




<script type="text/javascript">
//합계 계산하는 calculateSum() 함수
var index = 0;
function calculateSum() {
var sum = 0;
var inputElements = document.getElementsByClassName("input-field");
for (var i = 0; i < inputElements.length; i++) {
	if (!isNaN(inputElements[i].value) && inputElements[i].value.length != 0) {
    sum += parseFloat(inputElements[i].value);
	}
}
document.getElementById("sum").innerHTML = "Sum: " + sum;
}

var inputFields = document.querySelectorAll(".input-field");
inputFields.forEach(function(inputField) {
inputField.addEventListener("input", calculateSum);
});

// 합계 계산 하는 함수() 끝-----------------------------------


// 거래처 모달창 검색 후 텍스트 칸에 자동 입력되는 함수
$(document).on("click","#client_search_modalDiv #client_table > tbody tr",function(){
	
		$("#business_no").val($(this).children("td").attr("id"));
		
		
		 $('#client_search_modalDiv').modal('hide'); 
		 $('#client_search_modalDiv').hide();
		 $('#cust_name').focus();
		 $('.jquery-modal').click();
	
	});
	
//담당자 모달창 검색 후 텍스트 칸에 자동 입력되는 함수
$(document).on("click","#emp_search_modalDiv #emp_table > tbody tr",function(){
	
		$("#emp_name").val($(this).children("td").attr("id"));
		$("#emp_num").val($(this).children("td").next().attr("id"));
		
		
		
		 $('#emp_search_modalDiv').modal('hide'); 
		 $('#emp_search_modalDiv').hide();
		 $('.jquery-modal').click();
	
	});
//품목코드 및 품목명 모달창 검색 후 텍스트 칸에 자동 입력되는 함수
$(document).on("click","#product_search_modalDiv #pro_table > tbody tr",function(){
// 		console.log("버튼 클릭시 값이 나오나 : " + $(this).children("input").attr("id"));
		let tr_index = $("#tr_index").val();
		console.log("tr_index : " +tr_index);
		$("#product_name"+ tr_index).val($(this).children("td").next().attr("id"));
		$("#product_cd" + tr_index).val($(this).children("td").attr("id"));
		
		
		
		 $('#product_search_modalDiv').modal('hide'); 
		 $('#product_search_modalDiv').hide();
		 $('.jquery-modal').click();
	
	});
	
	// 품목 검색 버튼 클릭 시 모달창 활성화
	function productBtn(index) {
		
// 		$(this).closest("tr").index();
// 		$(this).children('input').attr('id');
// 		console.log($(this).closest("tr").index());
		$.ajax({
	        type: "get",
	        url: "inProSearchAjax?business_no=" + $("#business_no").val()+ "&num="+ indexNum,
	        contentType: 'html',
	        success: function(data,status,xhr) {
	        	$('#product_search_modalDiv').html(data);
	        	$("#tr_index").val(index);
	        	
	        },
	        error: function(xhr,status,error) {
	            console.log(error);
	        }
	        
		});
		
	
	//모달창 열기
	 $('#product_search_modalDiv').modal('show');
	
	}
$(function () {
			
	
			
			$("#cust_searchBtn").on("click",function(){
				
					$.ajax({
						
				        type: "get",
				        url: "inClientSearchAjax",
				        contentType: 'html',
				        success: function(data,status,xhr) {
				        	$('#client_search_modalDiv').html(data);
				    
				        	
				        },
				        error: function(xhr,status,error) {
				            console.log(error);
				        }
				        
					});
					
				
				//모달창 열기
				 $('#client_search_modalDiv').modal('show'); 
				});
			
			$("#emp_searchBtn").on("click",function(){
				
					$.ajax({
						
				        type: "get",
				        url: "inEmpSearchAjax",
				        contentType: 'html',
				        success: function(data,status,xhr) {
				        	$('#emp_search_modalDiv').html(data);
				    
				        	
				        },
				        error: function(xhr,status,error) {
				            console.log(error);
				        }
				        
					});
					
				
				//모달창 열기
				 $('#emp_search_modalDiv').modal('show'); 
				});
			

			
			
});

// 품목 검색 버튼
$(document).on("click", ".productBtn", function(){
	let index = $(this).closest("tr").index();
	console.log("index_tr: "+$(this).closest("tr").index());
	
		$.ajax({
	        type: "get",
	        url: "inProSearchAjax?business_no=" + $("#business_no").val(),
	        contentType: 'html',
	        success: function(data,status,xhr) {
	        	$('#product_search_modalDiv').html(data);
	        	$("#tr_index").val(index);
	        	
	        },
	        error: function(xhr,status,error) {
	            console.log(error);
	        }
	        
		});
		
	
	//모달창 열기
	 $('#product_search_modalDiv').modal('show'); 
	
});

	
	
	
function openSearchArea() {
  document.getElementById("search_div").style.display = 'block';
  alert("openSearchArea");
}
</script>
<body>

<!-- left bar -->
<jsp:include page="../inc/left.jsp"></jsp:include>

<div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>입고 예정 수정</b></h1>   
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
	 
	<form action="InProcessingModifyPro" method="post" enctype="multipart/form-data">
	<table class="table" id="table_top">
		<thead>
            <c:forEach var="inList" items="${inList }">
            <tr>
            	<input type="hidden" name="in_schedule_cd" value="${inList.in_schedule_cd }">
				<th>일 자</th>
				<td><input type="date" class="form-control" value="${inList.in_date }" required="required"></td>
				<th>유형</th>
				<td colspan="2">
					<div class="input-group mb-3">
	          			<div class="col-12 col-md-9">
	          				<div class="form-check-inline form-check">
	                        <div class="radio">
	                            <label for="radio1" class="form-check-label ">
	                                <input type="radio" id="" name="in_type_cd" required="required" value="1" checked="checked" class="form-check-input">발주서
	                            </label>
	                        </div>
	                        <div class="radio">
	                            <label for="radio2" class="form-check-label ">
	                                <input type="radio" id="" name="in_type_cd" required="required" value="2" class="form-check-input">구매
	                            </label>
				 			</div>
				 			</div>
				 	</div>		
					</div>
				 </td>
			</tr>
			
			<tr><!-- 구매거래처(거래처 테이블에서 검색하여 선택)  -->
				<th>거래처</th>
				<td>
					<div> 
						<div class="input-group">
						
						<input type="text" class="form-control" name="business_no" id="business_no" readonly="readonly"
						  	value="${inList.business_no }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client" required="required">
						<input type="button" value="검색" class="btn btn-sm btn-dark p-2" id="cust_searchBtn">
						</div>
					</div> 
				</td>
				<th>납기 일자</th>
				<td colspan="2"><input type="date" class="form-control" value="${inList.in_date }" required="required"></td>
			</tr>
			<tr>
				<th>담당자</th>
				<td>
					<div>
						<div class="input-group">
						<input type="text" class="form-control" name="emp_name" id="emp_name" readonly="readonly"
						  	value="${inList.emp_name }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client" required="required">
						<input type="hidden" name="emp_num" value="${inList.emp_num }">
						<input type="button" value="검색" class="btn btn-sm btn-dark p-2" id="emp_searchBtn">
						</div>
					</div> 
				</td>
				<th>비고</th>
				<td colspan="2"><input type="text" class="form-control" value="${inList.remarks }" name="remarks2"></td>
			</tr>
			</c:forEach>
			<tr><td class="space" colspan="10" /></tr>
			<tr>
				<th>품목코드</th><!-- 	 품목코드 클릭 시 재고 이력 표시 화면(창) 띄우기 --> 
				<th>품목명</th>
				<th>수량</th>
				<th>납기일자</th>
				<th>적요</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${proList }" var="proList" varStatus="i" >
				<tr>
					<!-- 품목코드 -->
					<td>
						<div class="input-group">
						 <input type="hidden" class="form-control" name="cust_name" id="cust_name"
						  	value="${proList.cust_name }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client">
						 <input type="text" class="form-control" id="product_cd${i.index }" name="product_cd" readonly="readonly"
						  	value="${proList.product_cd }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client" required="required">
						 <input type="button" value="검색" class="btn btn-sm btn-dark p-2 productBtn" onclick="productBtn(${i.index})" id="product_searchBtn">
						</div>
					</td>
					<!-- 품목명 -->
					<td>
<!-- 					<input type="hidden" name="business_no" id="business_no"> -->
					<input type="text" class="form-control" id="product_name${i.index }" name="product_name" value="${proList.product_name}" readonly="readonly"></td>
					<!-- 수량 -->
					<td><input type="text" class="form-control" name="in_schedule_qty" value="${proList.in_schedule_qty}"></td>
					<!-- 납기일자 -->
					<td><input type="date" class="form-control" name="in_date" value="${proList.in_date }" required="required"></td>
					<!-- 적요 -->
					<td><input type="text" class="form-control" name="remarks" value="${proList.remarks}"></td>
				</tr> 
			</c:forEach>
		</tbody>
	
	</table>
	<input type="submit" value="등록" class = "btn btn-primary mx-4"  onclick="InProcessingModifyPro"/>
	</form>
</div>
</div>
<!-- 재고번호 클릭시 보이는 모달 영역 DIV  -->

	<div id="modal_container_stock" class="modal">
	<div id="modal_container_content">
	</div>
	 <div class="float-right">
<!-- 		<a href="#" rel="modal:close"> -->
		<input type="button" value="새 위치에 품목 추가" class="btn btn-primary" id="addProductTONewLoc">
<!-- 		</a> -->
	</div>
	</div><!-- end of DIV #modal_container -->
	
	
<!-- 유형 모달 DIV -->
<div id="modal_container_type" class="modal">
	<div class="col col-md-3"><label for="inDate" class=" form-control-label">일자</label></div>
	<div class="col-12 col-md-9"><input type="date" id="in_date" name="in_date" class="form-control"></div>

</div>



<!-- 거래처 모달 DIV -->
<div id="modal_container_client" class="modal">
	<div class="col col-md-3"><label for="inDate" class=" form-control-label">일자</label></div>
	<div class="col-12 col-md-9"><input type="date" id="in_date" name="in_date" class="form-control"></div>

</div>


<!-- 담당자 모달 DIV -->
<div id="modal_container_employee" class="modal">
	<div class="col col-md-3"><label for="inDate" class=" form-control-label">일자</label></div>
	<div class="col-12 col-md-9"><input type="date" id="in_date" name="in_date" class="form-control"></div>

</div>	

<!-- 거래처 검색 DIV -->
<div id="client_search_modalDiv" class="modal">

</div>
<!-- 담당자 검색 모달 영역 DIV -->
<!-- Modal HTML embedded directly into document -->
<div id="emp_search_modalDiv" class="modal">
	
</div>
<!-- 품목 검색 모달 영역 DIV -->
<div id="product_search_modalDiv" class="modal">
	
</div><!-- end of DIV #modal_container -->


<!-- footer -->
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