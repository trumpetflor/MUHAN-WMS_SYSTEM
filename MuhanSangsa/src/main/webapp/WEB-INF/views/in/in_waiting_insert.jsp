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
		height: 100px;
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
	}
	td{
	 width: 200px;
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
	#emp_search_modalDiv{
	width: 500px;
	height: 600px;
	}
	
	#emp_search_modalDiv table tbody tr :hover{
	cursor: pointer;
	}
	#emp_search_modalDiv::-webkit-scrollbar {
    width: 2px;
  }
	
	#client_search_modalDiv{
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
    cell2.innerHTML = "";
    cell3.innerHTML = "";
    cell4.innerHTML = "<input type='text' class='input-field' onchange='calculateSum()'>";
    cell5.innerHTML = "<input type='date' id='hireDate1' name='hire_date' class='form-control'>";
    cell6.innerHTML = "<input type='text'>";
  }
// 테이블 행 삭제하는 함수()
  function deleteRow(btn) {
    var tbody = btn.parentNode.parentNode.parentNode;
    if (tbody.tagName === "TBODY") {
      tbody.removeChild(btn.parentNode.parentNode);
    }
  }
// 테이블 행 추가 삭제 함수() 끝 --------------------------------

$(document).on("click","#client_search_modalDiv #client_table > tbody tr",function(){
		console.log($(this).children("td").attr("id"));
		console.log($(this).children("td").next().attr("id"));
	
		$("#cust_name").val($(this).children("td").next().attr("id"));
		$("#business_no").val($(this).children("td").attr("id"));
		
		
		
		 $('#client_search_modalDiv').modal('hide'); 
		     $('#client_search_modalDiv').hide();
		     $('.jquery-modal').click();
	
	});
$(function () {
	$("#search_emp").on("keyup",function(){
	
		let keyword = $(this).val();
		
		var regex_pattern = /([^가-힣\x20])/i;
		console.log("keyword: "+ keyword);
		console.log("regex_pattern.exec(keyword): "+ !regex_pattern.test(cust_name));
		
		
		if(!regex_pattern.test(keyword)){//자음+모음으로 글자가 완성됐을때만 실행
			$("#emp_search_modalDiv table tbody").empty();
		
				$.ajax({
					
			        type: "get",
			        url: "Search_emp.ajax",
			        data: {
			        	"keyword":keyword
			        },
			        contentType: 'application/json;charset=UTF-8',
			        success: function(data,status,xhr) {
	// 		        	alert(JSON.stringify(JSON.parse(data)));
							if(JSON.stringify(JSON.parse(data)) == "[]"){
								let msg = "<tr><td colspan='4'>검색된 결과가 없습니다.</td></tr>"
							
								$("#emp_search_modalDiv table tbody").prepend(msg);
							}
				     		 for(let emp of JSON.parse(data)){
								let result = "<tr id="+emp.emp_num+" onclick=\'selectedEmp(\""+ emp.emp_num+"\",\""+emp.emp_name+"\")'>"
												+"<td>"+ emp.emp_num +"</td>"
												+"<td>"+ emp.emp_name +"</td>"
												+"<td>"+ emp.dept_name +"</td>"
												+"<td>"+ emp.grade_name +"</td>"
											+"</tr>"
				     		 
	// 			     			let result = "<li onclick=\"selected_loc("+ inner_stock_cd_product_cd+inner_var2+inner_var3+");\"> <b>[ "+ prod.wh_name + "-" + prod.wh_area + "-" + prod.wh_loc_in_area + " / 재고번호"+prod.stock_cd+" ]</b><br> "
	// 			     			                + prod.product_name+" (재고:"+prod.stock_qty + ")" +"</li>"
				     		 	
						     		$("#emp_search_modalDiv table tbody").prepend(result);
				     		 }
			     	 
			        },
			        error: function(xhr,status,error) {
			            console.log(error);
			        }
				
				});//$.ajax({
		}
	});//$("#search_emp")
	
			
			$("#cust_searchBtn").on("click",function(){
				
					$.ajax({
						
				        type: "get",
				        url: "Product/ClientSelectList_Out",
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
// 			     $('#client_search_modalDiv').show();
// 			     $('.jquery-modal').click();
			});
			
			
			
			
	//위치검색 div내의 X버튼 클릭시
	$(".close-loc-Btn").on("click",function(){
		$(".search_div").css("display","none");
	});
	
	//새 위치 추가 버튼 클릭시
	$("a[href='modal_container_stock']").on("click",function(){
		
		
	});
	
	$(".search_div ul li").on("click",function(){
		alert();
	});
	
	
	//합계수량 sum_result: 조정수량 + 이동수량 jquery로 만들기
	
	
});
	
//==============================================	
	//사원검색에서 사원번호 클릭 시
	function selectedEmp(emp_num, emp_name){
	
	$("#emp_num").val(emp_name);
	$("#emp_name").val(emp_name);
	
	
		//모달창 닫기
		 $('#emp_search_modalDiv').modal('hide'); 
	     $('#emp_search_modalDiv').hide();
	     $('.jquery-modal').click();
	}
	
	
	function fn_selectClient(business_no,cust_name) {
		alert();
	}
	
//==============================================	
	
	
	
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

	<table class="table" id="table_top">
		<thead>
            <tr>
				<th>일 자</th>
				<td><input type="date" class="form-control" name=" " value=" " required="required"></td>
				<th>유형</th> <!-- 수정해서 사용하세요!! 기존꺼 복붙해둠!! -->
				<td align="left">
					<div class="m-1"><input type="radio" value="1" name="in_type" class="form-check-input" id="Purchase_Order"> 발주서</div>
					<div class="m-1"><input type="radio" value="2" name="in_type" class="form-check-input" id="release"> 구매</div>
				 </td>
			</tr>
			<tr><!-- 구매거래처(거래처 테이블에서 검색하여 선택)  -->
				<th>거래처</th>
					<td>	
						<div class='d-flex'>
					 	  <input type="text" class="form-control rounded-start" id="cust_name" readonly="readonly" placeholder=" 검색하세요."> 
					 	  <input type="hidden" name="business_no" id="business_no" value="">
<!-- 							 <a href="#client_search_modalDiv" rel="modal:open"> -->
							 <input type="button" value="검색" class="btn btn-sm btn-dark p-2" id="cust_searchBtn">
<!-- 							 </a> -->
						</div>
					</td>
				<th>납기 일자</th>
				<td><input type="date" class="form-control" name=" " value=" " required="required"></td>
			</tr>
			<tr>
				<th>담당자</th>
				<td>	
					<div class='d-flex'>
				 	  <input type="text" class="form-control rounded-start" id="emp_name" readonly="readonly" placeholder=" 검색하세요."> 
				 	  <input type="hidden" name="emp_num" id="emp_num" value="">
						 <a href="#emp_search_modalDiv" rel="modal:open"><input type="button" value="검색" class="btn btn-sm btn-dark p-2"></a>
					</div>
				</td>
			</tr>
			</table>
			
			<button onclick="addRow()" class = "btn btn-primary mx-4">추가</button>
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
				<td></td>
				<td></td>
				<td><input type="text" class="input-field" onchange="calculateSum()"></td>
				<td><input type="date" id="hireDate1" name="hire_date" class="form-control"></td>
				<td><input type="text"></td>
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
	<input type="submit" value="등록" class = "btn btn-primary mx-4"  onclick="#"/>
</div>
</div>
<!-- 거래처 검색 DIV -->
<div id="client_search_modalDiv" class="modal">

</div>
<!-- 담당자 검색 모달 영역 DIV -->
<!-- Modal HTML embedded directly into document -->
<div id="emp_search_modalDiv" class="modal">
	<div class=" m-3 border border-light border-top-0 rounded-2 border border-1"> 
		<div class="p-2 bg-light text-black well rounded-2" >&#128270;사원 검색</div>

	<div class="input-group m-3">
	  <input type="search" class="form-control rounded-start" placeholder="Search" aria-label="Search" aria-describedby="search-addon" id="search_emp"/>
	  <button type="button" class="btn btn-dark">search</button>
		</div>
			<table class="mt-3 table table-hover">
			<thead>
				<tr>
					<th>사번</th>
					<th>이름</th>
					<th>부서</th>
					<th>직급</th>
				</tr>
			</thead>
			<tbody>


			</tbody>

			</table>		
		</div>
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