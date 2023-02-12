<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title> 재고 조정 | 재고관리</title>

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
	        

		     	   
		     	   let parsingData = JSON.parse(data);
// 		     	  alert(JSON.stringify(parsingData));
					
		     	   JSON.stringify(parsingData)
		     		 for(let prod of parsingData){
		     			 
		     		  let inner_stock_cd_product_cd = "\'"+stock_cd+"','"+product_cd+"'," //재고번호
		     		  let inner_var2 = "\'"+prod.wh_loc_in_area_cd+"\',";//위치코드
		     		  let inner_var3 = "\'"+prod.wh_loc_in_area+"\',";
		     		  let inner_var4 = "\'"+prod.stock_cd+"\'";
		     		 
		     			let result = "<li onclick=\"selected_loc("+ inner_stock_cd_product_cd+inner_var2+inner_var3+inner_var4+");\"> <b>[ "+ prod.wh_name + "-" + prod.wh_area + "-" + prod.wh_loc_in_area + " / 재고번호"+prod.stock_cd+" ]</b><br> "
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
	
	//-------------------------------------------------------- 23/02/07 추가
	// 이동수량과 조정수량 입력 시 합계수량 변겅
	// 합계수량 sum_result: 조정수량 + 이동수량 jquery로 만들기
	// input type = number min = "0"으로 세팅 변경	
	$("#stock-table td").on("change", function() {
		
		// 1. 조정수량, 이동수량 name 설정 가능한 경우	
// 		$(this).closest("tr").find('.sum_result').text(
// 			Number($(this).closest("tr").find(".stockQty").text()) -
// 			($(this).closest("tr").find("input[name=RemoveStockQty]").val()) -
// 			($(this).closest("tr").find("input[name=MVStockQty]").val()) 
// 		)

		// 2. qty 로 조정수량, 이동수량 묶는 경우
		
		// (1). 합계 수량 = 재고 수량 - (이동수량 or 조정수량)
		var qty = Number($(this).closest("tr").find(".stockQty").text()) - 
				  $(this).closest("td").find("input[type=Number]").val();
		// (2). 만약, 이동수량과 조정수량이 선택되지 않았다면 "합계수량 == 재고수량"
		if($(this).closest("td").find("input[type=Number]").val() == undefined) {
			qty = Number($(this).closest("tr").find(".stockQty").text());
		}
		// (3). 이동수량과 조정수량이 선택된 경우 합계수량을 표시한다
		$(this).closest("tr").find('.sum_result').text(qty);
		
	});
	

	
	//-------------------------------------------------------- 23/02/07 추가
	
});

function openSearchArea() {
  document.getElementById("search_div").style.display = 'block';
 alert("openSearchArea");
}

//
function selected_loc(stock_cd, product_cd, wh_loc_in_area_cd, wh_loc_in_area,change_stock_cd) {
	console.log("선택된 위치:" + wh_loc_in_area_cd + "/"+ product_cd+"/"+wh_loc_in_area );
	//https://hianna.tistory.com/718
	$(function(){
		$("#"+stock_cd+"_"+product_cd).children("input").val(change_stock_cd+"["+wh_loc_in_area+"]");
		$("#"+stock_cd+"_"+product_cd).children(".search_div").css("display","none");
		//
		
		$("#"+stock_cd+"_"+product_cd).closest("tbody").find("input[name=target_stock_cd]").val(parseInt(change_stock_cd));
		console.log(change_stock_cd);
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
	
//--------------------23/02/08 추가---------------------------

//--------------------23/02/08 추가---------------------------
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
                               <h1 class="m-1"><b>재고 관리</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="employees">재고 관리</a></li>
                                    <li><a href="#">재고 조회</a></li>
                                   
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
  		<form action="Inventory_View ">
				<!-- 검색 타입 추가 -->
				<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1">
					<option value="STOCK_CD" <c:if test="${param.searchType eq 'STOCK_CD'}">selected</c:if>>재고번호</option>
					<option value="PRODUCT_NAME" <c:if test="${param.searchType eq 'PRODUCT_NAME'}">selected</c:if>>품목명</option>
<%-- 					<option value="" <c:if test="${param.searchType eq ''}">selected</c:if>>창고명</option> --%>
				</select>			
				<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword" value="${param.keyword }"> 
				<input type="submit" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" >
		</form>
	   </section>
<!-- 재고번호, 품목명 , 구역명(창고명), 선반위치, 재고수량, //
  조정수량, 이동재고번호, 이동위치, 이동수량, 합계수량 -->

	<form action="StockModifyPro" method="post" name="formName" id="stockTable"> 
	<table class="table"  id="stock-table">
		
		<thead>
			<tr>
				<th>재고번호</th><!-- 	 재고번호 클릭 시 재고 이력 표시 화면(창) 띄우기 --> 
				<th>품목명</th>
				<th>창고 및 구역명</th>
				<th>세부위치</th>
				<th>재고수량</th>
				<th>작업 선택</th>
				<th>조정수량</th>
				<th>이동재고번호(이동위치)</th>
				<th>이동수량</th>
				<th>합계수량</th>
			</tr> 
		</thead>
		<tbody>
			<c:forEach items="${stockList }" var="stock" varStatus="i" >
				<input type="hidden" name="stock_cd" value="${stock.stock_cd}" >
				<input type="hidden" name="TotalStockQty" value="${stock.stock_qty }" >
				<input type="hidden" name="product_cd" value="${stock.product_cd }" >
				<input type="hidden" name="source_stock_cd" value="${stock.stock_cd}" >
				<input type="hidden" name="target_stock_cd" value=0 >
				
			 	
				<input type="hidden" name="stockHistoryList[${ i.index}].stock_cd" value="${stock.stock_cd}" >
				<input type="hidden" name="stockHistoryList[${ i.index}].stock_control_type_cd" value=0 >
				<input type="hidden" name="stockHistoryList[${ i.index}].product_cd" value="${stock.product_cd }" >
				<input type="hidden" name="stockHistoryList[${ i.index}].source_stock_cd" value="${stock.stock_cd}" >
				<input type="hidden" name="stockHistoryList[${ i.index}].target_stock_cd" value=0 >
				<input type="hidden" name="stockHistoryList[${ i.index}].qty" value=0 >
				
				<tr class="Stocktr">
					
					<td>${stock.stock_cd}</td>
					<td>${stock.product_name}</td>
					<td>${stock.wh_name} - ${stock.wh_area }</td>
					<td>${stock.wh_loc_in_area}</td>
					<td class="stockQty">${stock.stock_qty }</td>
					<td>
						<select name="stock_control_type_cd" class="bg-light border border-secondary rounded-1 px-1">
							<option value="move">이동</option>
							<option value="adjust">조정</option>
						</select>
					</td>
					<td><input type="number" name="qty" class=" bg-light border border-secondary rounded-1 px-1 adjust" disabled="disabled" min="0"></td>
					<td style="position: relative;" id="${stock.stock_cd}_${stock.product_cd}">
						<input type="text" placeholder="위치를 선택하세요" class="loc_search bg-light border border-secondary rounded-1 px-2 " >
					    <div class=" rounded-1 search_div">
						    <div class="float-right close-loc-Btn"><button type="button" class="btn-close" disabled aria-label="Close"></button></div>
						    	<div class="mt-3 add-New-loc" onclick="open_addLoc_modal('${stock.stock_cd}','${stock.product_cd}');"> <a href="#modal_container_stock" rel="modal:open">새 위치 추가 + </a></div>
						       <hr>
						     	<ul>
						     		
						     	</ul>
					    </div>
					</td>
					<td><input type="number" name="qty" class=" bg-light border border-secondary rounded-1 px-1" max="${stock.stock_qty }" min="0"></td>
					<td class="sum_result"></td>
				</tr> 
			</c:forEach>
			</tbody>
	
	</table>
		<input type="submit" value="조정" class=" mx-1 btn btn-sm btn-dark rounded-1" >
		<input type="reset" value="초기화" class="mx-1 btn btn-sm btn-dark rounded-1">
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