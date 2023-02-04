<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title> 재고조회 | 재고관리</title>

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
		width: 70px;
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
	
	tr{
	 position: relative;
	}
	
	#search_div{
	    width: 400px;
	    height: 100px;
	    background-color: white;
	    position: absolute;
	    top: 35px;
	    margin-left: 10px;
	    overflow: scroll;
	    display: none;
	    z-index: 1;
	}
	
	#search_div::-webkit-scrollbar {
    width: 3px;
  }
	#search_div ul{
	padding-left: 0
	}
	#search_div li{
	
	text-align: left;
	vertical-align: middle;
	background:  url(${pageContext.request.contextPath}/resources/images/loc_pin.png) no-repeat 0px 1px;
    list-style-type: none;
    padding: 1px 1px 8px 20px;
    transition: 0.5s;
	}
	
	#search_div li:hover {
	background-color: rgba(169, 168, 167, 0.7);
	cursor: pointer;
	}
</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->





<script type="text/javascript">
function openStockModal() {
	alert();
	
}

$(function () {
	$(".loc_search").on("click",function(){
		
		let product_cd = $(this).closest('td').attr('id');
		console.log("td의 아이디:" + $(this).closest('td').attr('id') )
		 $(this).next().show();
	
		console.log("div의 아이디:" + $(this).next().attr('class') )
		
		
		$.ajax({
			
	        type: "get",
	        url: "StockAdjust_loc.ajax",
	        data: {
	        	"product_cd":product_cd
	        },
	         
	        contentType: 'application/json;charset=UTF-8',
	        success: function(data,status,xhr) {
				//JSON데이터 이상함 ! 나중에 물어볼것
// 	               JSON.parse(JSON.stringify(data));
// 		     	   alert(JSON.parse(JSON.stringify(data)));
		     	   
		     	   let parsingData = JSON.parse(data);
// 		     	  alert(parsingData);
// 		     	  alert(JSON.stringify(parsingData));
					
		     	   JSON.stringify(parsingData)
		     		 for(let prod of parsingData){
		     			 
		     		  let inner_var1 = "\""+prod.wh_loc_in_area_cd+"',";
		     		  let inner_var2 = "\""+prod.wh_loc_in_area_cd+"\"";
		     			let result = "<li onclick=\"selected_loc("+ inner_var1+inner_var2+");'> ["+ prod.wh_name + "-" + prod.wh_area + "-" + prod.wh_loc_in_area + "] "
		     			                + prod.product_name+" (재고:"+prod.stock_qty + ")" +"</li>"
		     		 	
				     		$("#"+product_cd + "  #search_div ul").append(result);
		     		 }
	     	 
	        },
	        error: function(xhr,status,error) {
	            console.log(error);
	        }
		
		});//$.ajax({
		
	});
	
	
	$("#closeBtn").on("click",function(){
		$("#search_div").css("display","none");
	});
	
});

function openSearchArea() {
  document.getElementById("search_div").style.display = 'block';
 alert("openSearchArea");
}

function selected_loc(wh_loc_in_area_cd , product_cd) {
	console.log("선택된 위치:" + wh_loc_in_area_cd + "/"+ product_cd)
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

	 
	<table class="table"  id="">
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
			<tr>
				<td>111111</td>
				<td>[농심]신라면</td>
				<td>A - 4 zone</td>
				<td>7-a</td>
				<td>1000개</td>
				<td>
					<select class=" bg-light border border-secondary rounded-1 px-1">
						<option>입고</option>
						<option>출고</option>
						<option>이동</option>
						<option>조정</option>
					</select>
				</td>
				<td><input type="number" class=" bg-light border border-secondary rounded-1 px-1"></td>
				<td style="position: relative;" id="1번">
					<input type="text" placeholder="위치를 선택하세요" class="loc_search bg-light border border-secondary rounded-1 px-1">
				    <div id="search_div" class="  rounded-1 ">
				    <div class="float-right" id="closeBtn"><button type="button" class="btn-close" disabled aria-label="Close"></button></div>
				    <div class="mt-3"> 새 위치 추가 + </div>
				       <hr>
				     	<ul>
				     		<li>[B창고-3zone-7] 신라면</li>
				     		<li>[C창고-5zone-7] 신라면</li>
				     		<li>[A창고-7zone-7] 신라면</li>
				     	</ul>
				     	
				    </div>
				</td>
				<td><input type="number"  class=" bg-light border border-secondary rounded-1 px-1"></td>
				<td></td>
				<td></td>
			</tr> 
			<tr>
				<td>111111</td>
				<td>[농심]신라면</td>
				<td>A - 4 zone</td>
				<td>7-a</td>
				<td>1000개</td>
				<td>
					<select class=" bg-light border border-secondary rounded-1 px-1">
						<option>입고</option>
						<option>출고</option>
						<option>이동</option>
						<option>조정</option>
					</select>
				</td>
				<td><input type="number" class=" bg-light border border-secondary rounded-1 px-1"></td>
				<td style="position: relative;" id="2번">
					<input type="text" placeholder="위치를 선택하세요" class=" loc_search bg-light border border-secondary rounded-1 px-1" id="loc_search">
				    <div id="search_div" class="search_div  rounded-1 ">
					    <div class="float-right" id="closeBtn"><button type="button" class="btn-close" disabled aria-label="Close"></button></div>
					    <div class="mt-3"> 새 위치 추가 + </div>
					       <hr>
					     	<ul>
					     		<li>[B창고-3zone-7] 신라면</li>
					     		<li>[C창고-5zone-7] 신라면</li>
					     		<li>[A창고-7zone-7] 신라면</li>
					     	</ul>
				     	
				    </div>
				</td>
				<td><input type="number"  class=" bg-light border border-secondary rounded-1 px-1"></td>
				<td></td>
				<td></td>
			</tr> 

		</tbody>
	
	</table>

</div>
</div>
<!-- 재고번호 클릭시 보이는 모달 영역 DIV  -->

	<div id="modal_container_stock" class="modal">

 		 <a href="#" rel="modal:close">Close</a>
 
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
