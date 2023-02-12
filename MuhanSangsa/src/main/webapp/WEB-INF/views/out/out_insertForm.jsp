<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title> 출고 신규등록 | 출고관리</title>

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
	
.close-modal {
	display: none;
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
	

	#table_top td {
		height: 120px;
		vertical-align: middle;
	}
	/*표 제목*/
	#table_top tr td:nth-child(1){
	width: 50px;
	}
	#table_top tr td:nth-child(3){
	width: 50px;
	}
	/*표 내용*/
	#table_top tr td:nth-child(2){

	}
	#table_top tr td:nth-child(4){
	
	}
	#table_top input[type=date],#table_bottom input[type=date]{
		width: 150px;	
	}
	#table_top input[type=text]{
		width: 300px;;	
	}
	#table_top .rounded-start{
		width: 300px;;	
		border: 1px;
	}
	#table_bottom th{
		text-align:  center;
	}

	input[type=number]{
		width: 120px;	
	}
	input[type=number]::placeholder {
		font-size: 12PX;
	}
	
	#table_bottom tr th :last-child{
		width: 10px !important;
	}
	
	#table_bottom tfoot:hover{
		cursor: pointer;
		background-color: rgba(255,255,255,0.4);
	}
	
	
	#stock_search_modalDiv table tr th,td:first-child{
		width: 90px;
	}
	
	#stock_search_modalDiv table tr th,td:nth-child(4){
		width: 90px;
	}
	
	
	/*품목추가버튼*/
	#addProduct:hover{
	 cursor: pointer;
	 color: navy;
	 text-decoration: blink;
	}
	.deleteProduct :hover{
	 cursor: pointer;
	}
	/* 모달 */
	.modal{
		max-width: 1000px;
	}
	

	#product_search_modalDiv{
	  width:800PX;
 	 height: 500px;
	  position: fixed;
	  top: 20%;
	  left: 40%;
	  overflow-y: scroll;
	}
	.product_search_modalDiv ::-webkit-scrollbar {
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
	/*재고번호 검색 모달창*/
	#stock_search_modalDiv{
		width: 700px;
		height: 600px;
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

//거래처 검색 모달창에서 거래처 선택시
$(document).on("click","#client_search_modalDiv #client_table > tbody tr",function(){
		console.log($(this).children("td").attr("id"));
		console.log($(this).children("td").next().attr("id"));
	
		$("#cust_name").val($(this).children("td").next().attr("id"));
		$("#business_no").val($(this).children("td").attr("id"));
		
		
		//모달창 닫기
		 $('#client_search_modalDiv').modal('hide'); 
		 $('#client_search_modalDiv').hide();
		 $('.jquery-modal').click();
	
	});
	
	//품목삭제버튼 클릭시 삭제	
	$(document).on("click",".deleteProduct",function(){
		$(this).closest("tr").remove();
	});
	
	
	//재고번호 모달창에서 선택시
	$(document).on("click","#stock_search_modalDiv_content tbody tr",function(){
		let stock_cd  = $(this).children("td:eq(0)").text();
		let stock_qty  = $(this).children("td:eq(3)").text();
		let tr_index = $("#tr_index").val();
				
		console.log("stock_cd: "+stock_cd );
		console.log("tr_index: "+tr_index );
		let isExistStock_cd = false;
		$("input[name=stock_cd]").each(function(){
			if($(this).val() == stock_cd){
				isExistStock_cd = true;
				alert("이미 등록된 재고번호입니다. 다른 재고번호를 선택해주세요.")
			}
		
		});
		
		if(!isExistStock_cd){
			
		$("input[name=stock_cd]").eq(tr_index).val(stock_cd);
		$("input[name=out_schedule_qty]").eq(tr_index).attr("max",stock_qty);
		$("input[name=out_schedule_qty]").eq(tr_index).attr("placeholder","최대 "+stock_qty+"개");
		
		//모달창 닫기
		 $('#stock_search_modalDiv').modal('hide'); 
		 $('#stock_search_modalDiv').hide();
		 $('.jquery-modal').click();
		}
		
	
	});
	
	
	//품목input태그 클릭시 품목검색 div open
	$(document).on("click","input[name=product_cd]",function(){
		$("input[name=product_cd]").removeClass("here");
		let here = $(this).addClass("here");//이 위치를 찾기위해서 here이라는 클래스 넣어줌
		 $('#product_search_modalDiv').show();
// 		 $('#product_search_modalDiv').modal('show'); 

		$.ajax({
			url:"findProduct_StockExist.ajax",
		    type: "get",
		    data:{
		    	"keyword":""
		    },
		    contentType: "html",
		    success: function(data,status,xhr) {
		    	
		    	$("#product_search_modalDiv").html(data);
				//모달창 열기

		    },
	        error: function(xhr,status,error) {
	            console.log(error);
	        }
			
		});

	});
	
	//품목검색 모달창에서 선택시 품목 및 품목명value값 넣기
	$(document).on("click","#product_search_modalDiv table tbody tr",function(){
		
		let product_cd = $(this).children().attr("id")
		let product_name = $(this).children("td").next().text();
		
		//넣어야할 위치 찾기
		$here = $(".here").closest("tr");
		$here.find("input[name=product_cd]").val(product_cd);
		$here.find("input[name=product_name]").val(product_name);
		$here.find("input[name=product_cd]").removeClass("here");
		
		//재고번호 input태그 내의 value2에 product_cd 설정
		$here.find("input[name=stock_cd]").attr("value2",product_cd);
		
		//모달창 닫기
		 $('#product_search_modalDiv').modal('hide'); 
		 $('#product_search_modalDiv').hide();
		 $('.jquery-modal').click();
	
	});
	
	//[모달] 재고번호input창 클릭시 모달창
	$(document).on("click","input[name=stock_cd]",function(){
		let index = $(this).closest("tr").index();
		if($("input[name=product_cd]").eq(index).val() == ""){
			//상품선택 입력 안했으면
			alert("품목 선택이 필요합니다. ")
		}else{
			
			let product_cd = $("input[name=product_cd]").eq(index).val();
			$("#tr_index").val($(this).closest("tr").index());

			//ajax요청하는  함수 실행
			getStockcode_byProductcd(product_cd);
			
			//모달창 열기
			$('#stock_search_modalDiv').modal('show'); 
		}
	});//재고번호 모달창 끝
	

	
	
	
$(function () {

//담당자 검색 모달창 내 검색바
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
			        	$("#emp_search_modalDiv table tbody").empty();
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
											+"</tr>";
				     		 	
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
			
			
	$("#addProduct").on("click",function(){
		let addCode="<tr>"
						+'<td><input type="text" class="form-control" name="product_cd" required="required" readonly="readonly"></td>'
						+'<td><input type="text" class="form-control" name="product_name" readonly="readonly"></td>'
						+'<td align="center"><input type="number" class="form-control" name="out_schedule_qty" max="" required="required"></td>'
						+'<td align="center"><input type="date" class="form-control" name="p_out_date" required="required"></td>'
						+'<td><input type="text" class="form-control" name="p_remarks" value=""></td>'
						+'<td align="center">'
								+'<div class="d-flex">'
									+'<input type="text" class="form-control" name="stock_cd" readonly="readonly" placeholder=" 클릭하세요." required="required"><span class="badge bg-danger m-2 deleteProduct">-</span>'
								+'</div>'
						+'</td>'
					+'</tr>'
		$("#table_bottom > tbody").append(addCode);
	});

	

	

	


	
});

	
//==============================================	
	//사원검색에서 사원번호 클릭 시
	function selectedEmp(emp_num, emp_name){

	$("#emp_num").val(emp_num);
	$("#emp_name").val(emp_name);
	
	
		//모달창 닫기
		 $('#emp_search_modalDiv').modal('hide'); 
	     $('#emp_search_modalDiv').hide();
	     $('.jquery-modal').click();
	}
	

	//재고번호 검색하는 ajax
	function getStockcode_byProductcd(product_cd) {
		
		$.ajax({
			
	        type: "get",
	        url: "StockAdjust_loc.ajax",
	        data: {
	        	"product_cd":product_cd
// 	        	"keyword":keyword
	        	
	        },
	         
	        contentType: 'application/json;charset=UTF-8',
	        success: function(data,status,xhr) {
	        	$("#stock_search_modalDiv_content tbody").empty();
		     	   let parsingData = JSON.parse(data);
// 		     	  alert(JSON.stringify(parsingData));
					
		     	   JSON.stringify(parsingData)
		     		 for(let prod of parsingData){
		     		
					let result = "<tr>"
									+"<td>"+prod.stock_cd+"</td>"
									+"<td><small>"+prod.product_name+"</small></td>"
									+"<td>"+prod.wh_name+"-"+prod.wh_area+"-"+prod.wh_loc_in_area+"</td>"
									+"<td>"+prod.stock_qty+"</td>"
								+"</tr>"
		     		 	
				     		$("#stock_search_modalDiv_content tbody").prepend(result);
		     		 }
	     	 
	        },
	        error: function(xhr,status,error) {
	            console.log(error);
	        }
		
		});//$.ajax({
			

	}
	
//==============================================	
	


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
                               <h1 class="m-1"><b>출고 신규 등록</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="#">출고 예정</a></li>
                                    <li><a href="#">출고 관리</a></li>
                                   
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
			<form action="OutInsertFormPro" method="post">
	<!-- =====================상단 테이블===================== -->
				<table class="table" id="table_top">
					<thead>
						<tr>
							<td><b>일 자</b></td>
							<td id="today_date">${now}</td>
							<td><b>유형</b></td>
							<!-- 수정해서 사용하세요!! 기존꺼 복붙해둠!! -->
							<td align="left">
								<div class="m-1">
									<input type="radio" value="1" name="out_type"
										class="form-check-input" id="Purchase_Order"> 발주서
								</div>
								<div class="m-1">
									<input type="radio" value="2" name="out_type"
										class="form-check-input" id="release"> 출고
								</div>
							</td>
						</tr>
						<tr>
							<!-- 구매거래처(거래처 테이블에서 검색하여 선택)  -->
							<td><b>거래처</b></td>
							<td>
								<div class='d-flex'>
									<input type="text" class="form-control rounded-start"
										id="cust_name" readonly="readonly" placeholder=" 검색하세요.">
									<input type="hidden" name="business_no" id="business_no">
									<input type="button" value="검색" class="btn btn-sm btn-dark p-2"
										id="cust_searchBtn">
								</div>
							</td>
							<td><b>납기 일자</b></td>
							<td><input type="date" pattern="yyyy/mm/dd"
								class="form-control" name="out_date" required="required"></td>
						</tr>
						<tr>
							<td><b>담당자</b></td>
							<td>
								<div class='d-flex'>
									<input type="text" class="form-control rounded-start"
										id="emp_name" readonly="readonly" placeholder=" 검색하세요.">
									<input type="hidden" name="emp_num" id="emp_num"> <a
										href="#emp_search_modalDiv" rel="modal:open"><input
										type="button" value="검색" class="btn btn-sm btn-dark p-2"></a>
								</div>
							</td>
							<td><b>비고</b></td>
							<td><input type="text" name="remarks"
								class="rounded-start form-control" ></td>
						</tr>
				</table>
	<!-- =====================하단 테이블===================== -->
				<table class="table" id="table_bottom">
					<thead>
						<tr>
							<th>품목코드</th>
							<th>품목명</th>
							<th>수량</th>
							<th>납기일자</th>
							<th>적요</th>
							<th>재고번호</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								name="product_cd" required="required" readonly="readonly"></td>
							<td><input type="text" class="form-control"
								name="product_name" readonly="readonly"></td>
							<td align="center"><input type="number" class="form-control"
								name="out_schedule_qty" max="" required="required" min="1"></td>
							<!-- 출고예정수량? -->
							<td align="center"><input type="date" class="form-control"
								name="p_out_date" required="required"></td>
							<td><input type="text" class="form-control" name="p_remarks"
								required="required"></td>
							<td align="center">
								<div class="d-flex">
									<input type="text" class="form-control" name="stock_cd"
										readonly="readonly" placeholder=" 클릭하세요." required="required"><span
										class="badge bg-danger m-2 deleteProduct">-</span>
								</div>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7" align="center" class="p-2" id="addProduct">
								+ 품목추가</td>
						</tr>
					</tfoot>
				</table>
				<input type="submit" value="등록" class="btn btn-primary mx-4" />
			</form>
		</div>
</div>



<!-- ===========================================================모달 DIV==================================================================== -->
<!-- 거래처 검색 DIV -->
<div id="client_search_modalDiv" class="modal">


</div>
	<!-- 담당자 검색 모달 영역 DIV -->
	<!-- Modal HTML embedded directly into document -->
	<div id="emp_search_modalDiv" class="modal">
		<div
			class=" m-3 border border-light border-top-0 rounded-2 border border-1">
			<div class="p-2 bg-dark text-white well rounded-2 mb-4">&#128270;사원
				검색</div>

			<div class="input-group m-3">
				<input type="search" class="form-control rounded-start"
					placeholder="Search" aria-label="Search"
					aria-describedby="search-addon" id="search_emp" />
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
	</div>
	<!-- end of DIV #modal_container -->

	<!-- 품목 검색 모달 DIV -->
<div id="product_search_modalDiv" class="modal">

</div><!-- end of DIV #product_search_modalDiv -->

	<!-- 재고번호 검색 DIV -->
	<div id="stock_search_modalDiv" class="modal">
		<input type="hidden" value="" id="tr_index">
	<div
			class=" m-3 border border-light border-top-0 rounded-2 border border-1">
			<div class="p-2 bg-dark text-white well rounded-2 mb-4">&#128270;재고 선택</div>
		<div id="stock_search_modalDiv_content">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>재고번호</th>
						<th>품목명</th>
						<th>위치</th>
						<th>재고</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>
	</div>
	<!-- end of DIV #stock_search_modalDiv -->


	<jsp:include page="../inc/footer.jsp"></jsp:include>
    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>