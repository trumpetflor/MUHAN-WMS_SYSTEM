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
function openStockModal() {
	alert();
	
}

$(function () {
	$(".loc_search").on("click",function(){
		
	
		//id="재고번호_상품번호" 로 넘어옴
		let stock_cd = $(this).closest('td').attr('id').split("_")[0];
		let product_cd = $(this).closest('td').attr('id').split("_")[1];
		

		$(".search_div").css("display","none");
		
		//div버튼 보이기
		 $(this).next().show();
		
		$("#"+stock_cd+"_"+product_cd + "  .search_div ul").empty();
		
		$.ajax({
			
	        type: "get",
	        url: "StockAdjust_loc.ajax",
	        data: {
	        	"product_cd":product_cd
	        },
	         
	        contentType: 'application/json;charset=UTF-8',
	        success: function(data,status,xhr) {
	        	$("#"+product_cd + "  .search_div ul").empty();
	        
				//JSON데이터 이상함 ! 나중에 물어볼것
// 	               JSON.parse(JSON.stringify(data));
// 		     	   alert(JSON.parse(JSON.stringify(data)));
		     	   
		     	   let parsingData = JSON.parse(data);
// 		     	  alert(parsingData);
// 		     	  alert(JSON.stringify(parsingData));
					
		     	   JSON.stringify(parsingData)
		     		 for(let prod of parsingData){
		     			 
		     		  let inner_stock_cd_product_cd = "\'"+stock_cd+"','"+product_cd+"'," //재고번호
		     		  let inner_var2 = "\'"+prod.wh_loc_in_area_cd+"\',";//위치코드
		     		  let inner_var3 = "\'"+prod.wh_loc_in_area+"\'";
		     		 
		     			let result = "<li onclick=\"selected_loc("+ inner_stock_cd_product_cd+inner_var2+inner_var3+");\"> <b>[ "+ prod.wh_name + "-" + prod.wh_area + "-" + prod.wh_loc_in_area + " / 재고번호"+prod.stock_cd+" ]</b><br> "
		     			                + prod.product_name+" (재고:"+prod.stock_qty + ")" +"</li>"
		     		 	
				     		$("#"+stock_cd+"_"+product_cd + "  .search_div ul").prepend(result);
		     		 }
	     	 
	        },
	        error: function(xhr,status,error) {
	            console.log(error);
	        }
		
		});//$.ajax({
		
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
	
	
	//셀렉트박스 '조정' 선택시에만 조정항목 able처리
	$("select").on("change", function(){
		
		if($(this).val() == "adjust"){
			console.log("select option:selected : 조정선택됨");
			
			//조정수량 input able처리
			$(this).closest("td").next().children("input").prop("disabled", false);
			//위치선택 input disable처리
			$(this).closest("td").next().next().children("input").prop("disabled", true);
			$(this).closest("td").next().next().children("input").val("");
			//이동수량 input disable처리
			$(this).closest("td").next().next().next().children("input").prop("disabled", true);
			$(this).closest("td").next().next().next().children("input").val("");
		}else{
			//조정수량 input disabled처리
			$(this).closest("td").next().children("input").prop("disabled", true);
			$(this).closest("td").next().children("input").val("");
			//위치선택 input able처리
			$(this).closest("td").next().next().children("input").prop("disabled", false);
			//이동수량 input able처리
			$(this).closest("td").next().next().next().children("input").prop("disabled", false);
		}
		
	});
	
	//합계수량 sum_result: 조정수량 + 이동수량 jquery로 만들기
	
	
});

function openSearchArea() {
  document.getElementById("search_div").style.display = 'block';
 alert("openSearchArea");
}

//
function selected_loc(stock_cd, product_cd, wh_loc_in_area_cd, wh_loc_in_area) {
	console.log("선택된 위치:" + wh_loc_in_area_cd + "/"+ product_cd+"/"+wh_loc_in_area );
	//https://hianna.tistory.com/718
	$(function(){
		$("#"+stock_cd+"_"+product_cd).children("input").val(stock_cd+"["+wh_loc_in_area+"]");
		$("#"+stock_cd+"_"+product_cd).children("input").attr("value2",wh_loc_in_area_cd);
		$("#"+stock_cd+"_"+product_cd).children(".search_div").css("display","none");
	});
	
}

//새위치 추가 버튼 클릭시 실행되는 함수
function open_addLoc_modal(stock_cd,product_cd) {

	console.log("stock_cd: "+ stock_cd);
	console.log("product_cd: "+ product_cd);
	
	$.ajax({
		
        type: "get",
        url: "Search_location.ajax",
        data: {
        	"product_cd":product_cd,
        	"stock_cd":stock_cd
        },
        contentType: 'html',
        success: function(data,status,xhr) {
//         	alert(data);
        
			$("#modal_container_content").html(data);
     	 
        },
        error: function(xhr,status,error) {
            console.log(error);
        }
	
	});//$.ajax({
	
}
</script>
<body>
<br>
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
	 
	<table class="table" id=" ">
		<thead>
            <tr>
				<th>일 자</th>
				<td><input type="date" class="form-control" name=" " value=" " required="required"></td>
				<th>유형</th> <!-- 수정해서 사용하세요!! 기존꺼 복붙해둠!! -->
				<td><div class="input-group mb-3"> 
						  <input type="hidden" class="form-control" id="product_group_bottom_cd" name="product_group_bottom_cd"
						  	value="${product.product_group_bottom_cd }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px">									
						  <input type="text" class="form-control" id="product_group_bottom_name" name="product_group_bottom_name"
						   value="${product.product_group_bottom_name }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" readonly="readonly" required="required">
						  <button class="btn btn-outline-secondary " type="button" id="button-addon"
						  onclick="window.open('Product/GroupBottomSelectList','GroupBottomSelectList','width=500, height=500,location=no,status=no,scrollbars=yes');">검색</button>
					</div>
				 </td>
			</tr>
			<tr><!-- 구매거래처(거래처 테이블에서 검색하여 선택)  -->
				<th>거래처</th>
				<td>
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
				<th>납기 일자</th>
				<td><input type="date" class="form-control" name=" " value=" " required="required"></td>
			</tr>
			<tr>
				<th>담당자</th>
				<td>
					<div> <!-- 수정필요 -->
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
				<th>비고</th>
				<td><input type="text" class="form-control" value=" " name=" "></td>
			</tr>
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
			<c:forEach items="${modList }" var="inList" varStatus="status" >
				<tr>
					<!-- 품목코드 -->
					<td><input type="text" value="${inList.product_cd}" readonly="readonly"></td>
					<!-- 품목명 -->
					<td>
						<div class="input-group">
						 <input type="hidden" class="form-control" name="business_no" id="business_no"
						  	value="${inList.business_no }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client">
						 <input type="text" class="form-control" name="cust_name" id="cust_name" readonly="readonly"
						  	value="${inList.product_name }" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client" required="required">
						  <button class="btn btn-outline-secondary " type="button" id="button-addon"
						  onclick="window.open('Product/ClientSelectList','ClientSelectList','width=500, height=500,location=no,status=no,scrollbars=yes');">검색
						  </button>
						</div>
					</td>
					<!-- 수량 -->
					<td><input type="text" value="${inList.in_qty}"></td>
					<!-- 납기일자 -->
					<td><input type="date" class="form-control" name=" " value="${inList.in_date } " required="required"></td>
					<!-- 적요 -->
					<td><input type="text" value="${inList.remarks}"></td>
				</tr> 
			</c:forEach>
			</tbody>
	
	</table>
	<input type="submit" value="등록" class = "btn btn-primary mx-4"  onclick="OutInsertForm"/>
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
	

    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>