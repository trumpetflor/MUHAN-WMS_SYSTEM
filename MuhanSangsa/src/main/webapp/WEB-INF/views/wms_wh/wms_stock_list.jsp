<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title></title>

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
	
	select * from
	
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
	

	 a{
	 text-decoration: none;
	 color: 	#000080;
	}
	 a:visited :active{
	 text-decoration: none;
	 color: 	#000080;
	}
	
	/* 모달 */
	#modal_container_stock{
	  width: 70%;
	  height: 700px;
	  position: fixed;
	  top: 10%;
	  left: 50%;
	  overflow-y: scroll;
	}
</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->





<script type="text/javascript">
function openStockModal() {
	alert();
	
}





$(function(){
	//전체선택 버튼 클릭
	$('input:checkbox[name=AllChecked]').on("click",function(){
		if($(this).is(":checked") == true){
			$("input[name=stockChecked]").prop("checked",true);
		}else{
			$("input[name=stockChecked]").prop("checked",false);
		}
	});
	
	//체크박스 클릭
	$(document).on("change","input[name=stockChecked]",function(){
		$("#selectCount > small").html($('input:checkbox[name=stockChecked]:checked').length +" 개 선택됨");
		let stock_cd = $(this).val();
		
		
		
		
	});
	//하단 조정버튼 클릭시
	$("#stockAdjustmentBtn").on("click",function(){
		
		let stock_cd = [];//배열 선언, 변수명 컨트롤러 파라미터명과 동일
     	$('input:checkbox[name=stockChecked]').each(function (index) {
     		
     		if($(this).is(":checked")==true){
     	    	console.log("id값=stock_cd :"+$(this).val());
     	   		stock_cd.push($(this).val());//배열에 추가
     	    }
     	});
		
    	console.log("stock_cd[] : "+ stock_cd);
    	let result = confirm("재고번호 "+$('input:checkbox[name=stockChecked]:checked').length+ " 개를 조정하시겠습니까? ");
    	if(result){
	    	location.href="StockAdjustment?stock_cd="+stock_cd
    	}
	});
	
	
	
	
	//-----------------------------
	//전체합을 계산할 변수 선언
	let sum = 0;
	
	$('.stock_qty').each(function(index,item){

// 		console.log($(".stock_qty").eq(index).text());
// 		console.log(typeof(Number($(".stock_qty").eq(index).text())));
// 		console.log(isNaN(Number($(".stock_qty").eq(index).text())));
		sum += Number($(".stock_qty").eq(index).text());
		
		
	  });
	//전체합 계산
	$("#sum_result").html("<b>"+sum+"</b>");
	
});//$(function(){------------------------------------------------

function productInfo(product_cd) {
// 	$.ajax({
		
//         type: "get",
//         url: "getProduct_StockInfo.ajax",
//         data: {
//         	"product_cd":product_cd
//         },
         
//         contentType: 'application/json;charset=UTF-8',
//         success: function(data,status,xhr) {
//         	$("#"+product_cd + "  .search_div ul").empty();
        
// 			//JSON데이터 이상함 ! 나중에 물어볼것
// //	               JSON.parse(JSON.stringify(data));
// //		     	   alert(JSON.parse(JSON.stringify(data)));
	     	   
// 	     	   let parsingData = JSON.parse(data);
// //		     	  alert(parsingData);
// //		     	  alert(JSON.stringify(parsingData));
				
// 	     	   JSON.stringify(parsingData)
// 	     		 for(let prod of parsingData){
	     			 
// 	     		  let inner_stock_cd_product_cd = "\'"+stock_cd+"','"+product_cd+"'," //재고번호
// 	     		  let inner_var2 = "\'"+prod.wh_loc_in_area_cd+"\',";//위치코드
// 	     		  let inner_var3 = "\'"+prod.wh_loc_in_area+"\'";
	     		 
// 	     			let result = "<li onclick=\"selected_loc("+ inner_stock_cd_product_cd+inner_var2+inner_var3+");\"> <b>[ "+ prod.wh_name + "-" + prod.wh_area + "-" + prod.wh_loc_in_area + " / 재고번호"+prod.stock_cd+" ]</b><br> "
// 	     			                + prod.product_name+" (재고:"+prod.stock_qty + ")" +"</li>"
	     		 	
// 			     		$("#"+stock_cd+"_"+product_cd + "  .search_div ul").prepend(result);
// 	     		 }
     	 
//         },
//         error: function(xhr,status,error) {
//             console.log(error);
//         }
	
// 	});//$.ajax({
	
}
</script>
<body>

        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 rounded-pill">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <ol class="breadcrumb text-right ">
                               		<c:if test="${not empty wh_name && wh_name ne '' }">
	                                    <li>${wh_name }</li>
	                                    <c:if test="${not empty wh_area && wh_area ne '' }">
		                                    <li>${wh_area }</li>
			                                    <c:if test="${not empty wh_loc_in_area && wh_loc_in_area ne '' }">
			                                    <li>${wh_loc_in_area }</li>
			                                    </c:if>
	                                    </c:if>
                               		</c:if>
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
<!-- 창고 구역 내의 상세 위치에 등록되어 있는 재고 목록 표시 
	 재고번호, 품목명, 규격, 창고명, 구역명, 위치명, 재고수량 표시 
	 재고번호 클릭 시 재고 이력 표시 화면(창) 띄우기 -->

	<div id = "selectCount"><small class="text-secondary"> 0 개 선택됨</small></div>
	<table class="table"  id="">
		<thead>
			<tr>
				<th><input type="checkbox" name="AllChecked"></th>
				<th>재고번호</th><!-- 	 재고번호 클릭 시 재고 이력 표시 화면(창) 띄우기 --> 
				<th>품목명</th>
				<th>창고명</th>
				<th>구역명</th>
				<th>위치명</th>
				<th>재고수량</th>
			</tr> 
		</thead>
		<tbody>
		<c:forEach items="${stockList }" var="stock" varStatus="status" >
			<tr>
			<td align="center"><input type="checkbox" name="stockChecked" class="form-check-input" value="${stock.stock_cd }"></td>
<%-- 				<td onclick="openStockModal('${stock.stock_cd }')">${stock.stock_cd }</td> --%>
				<td><a href="Inventory_History_View?stock_cd=${stock.stock_cd }">${stock.stock_cd }</a></td>
				<td onclick="productInfo('${stock.product_cd}');">${stock.product_name}</td>
				<td>${stock.wh_name }</td>
				<td>${stock.wh_area }</td>
				<td>${stock.wh_loc_in_area }</td>
				<td class="stock_qty">${stock.stock_qty }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right"><b>합계 :</b></td><td id="sum_result"></td>
			<tr>
		</tbody>
	
	</table>

</div>
</div>
<!-- 재고번호 클릭시 보이는 모달 영역 DIV  -->

	<div id="modal_container_product" class="modal">

 		 <a href="#" rel="modal:close">Close</a>
 
	</div><!-- end of DIV #modal_container -->
    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>