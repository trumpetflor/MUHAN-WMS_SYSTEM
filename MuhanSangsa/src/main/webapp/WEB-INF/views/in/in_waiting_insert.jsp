<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title> 입고예정 신규등록 | 입고예정관리</title>

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
	
	a{
	 text-decoration: none;
	 color: 	#000080;
	}
	 a:visited :active{
	 text-decoration: none;
	 color: 	#000080;
	}
	
	#table_top {
		vertical-align: middle;
	}
	
	#table_top th {
		height: 100px !important;
		 
		vertical-align: middle;
	}
	#table_top td {
		vertical-align: middle;
	}
	#table_top input[type=date] {
		width: 150px;	
	}
	#table_top input[type=text]{
		width: 300px;;	
	}
	#table_top .rounded-start{
		width: 300px;;	
		border: 1px;
	}
	
	
	/* 모달 */
	.modal{
	max-width: 1000px;
	
	}
	
	.modal a.close-modal{
	 display: none;
	
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
	
	
	th {
	
	 width: 150px;
	 border-left: 1px;
	 text-align: center;
	}
	td{
	 width: 200px;
	 text-align: left;
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
	
	/* ------------------------------------------------------------------------- */
	/*사원검색 모달창*/
/* 	#emp_search_modalDiv{ */
/* 	width: 500px; */
/* 	height: 600px; */
/* 	} */
	
/* 	#emp_search_modalDiv table tbody tr :hover{ */
/* 	cursor: pointer; */
/* 	} */
/* 	#emp_search_modalDiv::-webkit-scrollbar { */
/*     width: 2px; */
/*   } */
	
	#client_search_modalDiv{
	width: 500px;
	height: 600px;
	 position: fixed;
	 top: 20%;
	  left: 40%;
	 overflow-y: scroll;
	
	}
	#emp_search_modalDiv{
	width: 500px;
	height: 600px;
	 position: fixed;
	 top: 20%;
	  left: 40%;
	 overflow-y: scroll;
	
	}
	#product_search_modalDiv{
	width: 500px;
	height: 600px;
	 position: fixed;
	 top: 20%;
	  left: 40%;
	 overflow-y: scroll;
	
	}
	
	/*emp_search_modalDiv 켰을때 검색버튼보여서 수정함*/
.input-group .btn{
		z-index: 0;
	}
.input-group .btn:focus {
z-index: 0;
}
</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->




<script type="text/javascript">
// 합계 계산하는 calculateSum() 함수
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

// 테이블 행 추가하는 함수()
function addRow() {
	index ++;
    var table = document.getElementById("table_bottom");
    var tbody = table.getElementsByTagName("tbody")[0];
    var row = tbody.insertRow(-1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    
    cell1.innerHTML = '<button onclick="deleteRow(this)" class = "btn btn-primary mx-4">제삭</button>';
    cell2.innerHTML = "<div class='d-flex' id='testing'>"
    				+ '<input type="text" class="form-control rounded-start" id="product_cd'+index+'" name="product_cd" readonly="readonly" placeholder=" 검색하세요.">' 
	  				+ '<input type="button" value="검색" class="btn btn-sm btn-dark p-2" onclick="productBtn('+index+')">'
					+ '</div>';
    cell3.innerHTML = '<input type="text" class="form-control rounded-start" id="product_name'+index+'" name="product_name" readonly="readonly" placeholder=" 자동입력">';
    cell4.innerHTML = "<input type='number' class='input-field' name='in_schedule_qty' onchange='calculateSum()'>";
    cell5.innerHTML = "<input type='date' id='hireDate1' name='in_date_detail' class='form-control'>";
    cell6.innerHTML = "<input type='text' id='remarks' name='remarks'>";
    
//     console.log(index);
  }
// 테이블 행 삭제하는 함수()
  function deleteRow(btn) {
    var tbody = btn.parentNode.parentNode.parentNode;
    if (tbody.tagName === "TBODY") {
      tbody.removeChild(btn.parentNode.parentNode);
      index --;
//       console.log(index);
    }
  }
// 테이블 행 추가 삭제 함수() 끝 --------------------------------

// 거래처 모달창 검색 후 텍스트 칸에 자동 입력되는 함수
$(document).on("click","#client_search_modalDiv #client_table > tbody tr",function(){
	
		$("#cust_name").val($(this).children("td").next().attr("id"));
		$("#business_no").val($(this).children("td").attr("id"));
		
		
		
		 $('#client_search_modalDiv').modal('hide'); 
		 $('#client_search_modalDiv').hide();
		 $('#cust_name').focus();
		 $('.jquery-modal').click();
	
	});
	
//담당자 모달창 검색 후 텍스트 칸에 자동 입력되는 함수
$(document).on("click","#emp_search_modalDiv #emp_table > tbody tr",function(){
	
		$("#emp_name").val($(this).children("td").next().attr("id"));
		$("#emp_num").val($(this).children("td").attr("id"));
		
		
		
		 $('#emp_search_modalDiv').modal('hide'); 
		 $('#emp_search_modalDiv').hide();
		 $('.jquery-modal').click();
	
	});
//품목코드 및 품목명 모달창 검색 후 텍스트 칸에 자동 입력되는 함수
$(document).on("click","#product_search_modalDiv #pro_table > tbody tr",function(){
		console.log("버튼 클릭시 값이 나오나 : " + $(this).children("input").attr("id"));
		$("#product_name"+ index).val($(this).children("td").next().attr("id"));
		$("#product_cd" + index).val($(this).children("td").attr("id"));
		
		
		
		 $('#product_search_modalDiv').modal('hide'); 
		 $('#product_search_modalDiv').hide();
		 $('.jquery-modal').click();
	
	});
	
	// 품목 검색 버튼 클릭 시 모달창 활성화
	function productBtn(indexNum) {
		
// 		$(this).closest("tr").index();
// 		$(this).children('input').attr('id');
// 		console.log($(this).closest("tr").index());
		$.ajax({
	        type: "get",
	        url: "inProSearchAjax?business_no=" + $("#business_no").val()+ "&num="+ indexNum,
	        contentType: 'html',
	        success: function(data,status,xhr) {
	        	$('#product_search_modalDiv').html(data);
	    
	        	
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
			
			$("#product_searchBtn").on("click",function(){
				$(this).closest("tr").index();
				console.log($(this).closest("tr").index());
				$.ajax({
			        type: "get",
			        url: "inProSearchAjax?business_no=" + $("#business_no").val(),
			        contentType: 'html',
			        success: function(data,status,xhr) {
			        	$('#product_search_modalDiv').html(data);
			    
			        	
			        },
			        error: function(xhr,status,error) {
			            console.log(error);
			        }
			        
				});
				
			
			//모달창 열기
			 $('#product_search_modalDiv').modal('show'); 
			});
			
			
// 			$("#registerBtn").click(function() {
// 				var JSONdata = $("#registerForm").serializeArray();
// // 				console.log($("#registerForm").serialize());
				
// 				$.ajax({
// 					type: "POST",
// 					url: "inWaitingRegistPro",
// 					dataType: "text",
// 					contentType: "application/json",
// 					data : JSON.stringify(JSONdata),
// 					success: function(result) {
// 						alert(result);
// 					},
// 					fail: function() {
// 						alert("요청 실패");
// 					}
// 				});
// 			});
});
	

	
	
	
function openSearchArea() {
  document.getElementById("search_div").style.display = 'block';
  alert("openSearchArea");
}
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
                               <h1 class="m-1"><b>입고 예정 등록</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="#">입고 예정</a></li>
                                    <li><a href="#">입고 관리</a></li>
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
<!-- 	<form action="inWaitingRegistPro" method="post" id="registerForm"> -->
	<form action="inWaitingRegistPro" method="post">
	<input type="hidden" id="in_complete" name="in_complete" value="0">
	<table class="table" id="table_top">
	
		<thead>
            <tr>
				<th>일 자</th>
				<td><input type="date" class="form-control" name="hire_date" required="required"></td>
				<th>유형</th> 
				<td align="left">
					<div class="m-1"><input type="radio" value="1" name="in_type_cd" class="form-check-input" id="Purchase_Order"> 발주서</div>
					<div class="m-1"><input type="radio" value="2" name="in_type_cd" class="form-check-input" id="release"> 구매</div>
				 </td>
			</tr>
			<tr>
				<th>거래처</th>
					<td>	
						<div class='d-flex'>
					 	  <input type="text" class="form-control rounded-start" id="cust_name" name="cust_name" readonly="readonly" placeholder=" 검색하세요."> 
					 	  <input type="hidden" name="business_no" id="business_no">
						  <input type="button" value="검색" class="btn btn-sm btn-dark p-2" id="cust_searchBtn">
						</div>
					</td>
				<th>납기 일자</th>
				<td><input type="date" class="form-control" name="in_date" required="required"></td>
				
			</tr>
			<tr>
				<th>담당자</th>
					<td>	
						<div class='d-flex'>
					 	  <input type="text" class="form-control rounded-start" id="emp_name" name="emp_name" readonly="readonly" placeholder=" 검색하세요."> 
					 	  <input type="hidden" name="emp_num" id="emp_num">
						  <input type="button" value="검색" class="btn btn-sm btn-dark p-2" id="emp_searchBtn">
						</div>
					</td>
			</tr>
			</table>
			
			<input type="button" onclick="addRow()" value="추가" class = "btn btn-primary mx-4">
			<!-- 품목 추가  -->
			<table class="table" id="table_bottom">
			<thead>
			<tr><td class="space" colspan="10" /></tr>
			<tr>
				<th></th>
				<th>품목코드</th><!-- 	 품목코드 클릭 시 재고 이력 표시 화면(창) 띄우기 --> 
				<th>품목명</th>
				<th>수량</th>
				<th>납기일자</th>
				<th>적요</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><button onclick="deleteRow(this)" class = "btn btn-primary mx-4">제삭</button></td>
				<td>
					<div class='d-flex' id="testing">
				 	  <input type="text" class="form-control rounded-start" id="product_cd0" name="product_cd" readonly="readonly" placeholder=" 검색하세요."> 
					  <input type="button" value="검색" class="btn btn-sm btn-dark p-2" id="product_searchBtn">
					</div>
				</td>
				<td>
					<div class="d-flex">
						<input type="text" class="form-control rounded-start" id="product_name0" name="product_name" readonly="readonly" placeholder=" 자동입력">
					</div>
				</td>
				<td><input type="number" class="input-field" name="in_schedule_qty" onchange="calculateSum()"></td>
				<td><input type="date" id="hireDate1" name="in_date_detail" class="form-control"></td>
				<td><input type="text" id="remarks" name="remarks"></td>
			</tr>
			</tbody>
			<tfoot>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th id="sum"></th>
				<th></th>
				<th></th>
			</tr>
			</tfoot>

	</table>
	<input type="submit" value="등록" class = "btn btn-primary mx-4"/>
	</form>
<!-- 	<input type="submit" value="등록" class = "btn btn-primary mx-4" id="registerBtn"/> -->
</div>
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

<jsp:include page="../inc/footer.jsp"></jsp:include>

<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>