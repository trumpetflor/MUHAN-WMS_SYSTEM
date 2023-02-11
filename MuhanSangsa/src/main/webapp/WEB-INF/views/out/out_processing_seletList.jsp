<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html >
<head>
<title> 출고처리 | 출고관리</title>

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
<!-- JQUERY-UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
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

	input[type=number]{
		width: 75px;
	}
	

/* *********************** CSS jakyoung 시작 *************************** */	

	/* 출고 모달창 */
	#out_naga_modal table tbody tr :hover{
	cursor: pointer;
	}
	
	#out_naga_modal::-webkit-scrollbar {
    width: 2px;
 	}
	
	#out_naga_modal{
	max-width: 750px !important;
	height: 500px !important;
	position: absolute;
	top: 20%;
	left: 35%;
	overflow-y: scroll;
	
	}
	
	/* 재고 검색 모달창 */
	#out_naga_modal table tbody tr :hover{
	cursor: pointer;
	}
	
	#out_naga_modal::-webkit-scrollbar {
    width: 2px;
 	}
	
	#find_stock_modal {
		max-width: 200px !important;
		height: 100px !important;
		position: relative;
		top: 20%;
		left: 35%;
		overflow-y: scroll;
	}
	
	.select_stock_cd {
		display: none;
	}







/* *********************** CSS jakyoung 끝 *************************** */	
	
	
	
	
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
			$("input[name=outScheduleChecked]").prop("checked",true);
		}else{
			$("input[name=outScheduleChecked]").prop("checked",false);
		}
		$("#selectCount > small").html($('input:checkbox[name=outScheduleChecked]:checked').length +" 개 선택됨");
		let stock_cd = $(this).val();
	});
	
	//체크박스 클릭
	$(document).on("change","input[name=outScheduleChecked]",function(){
		$("#selectCount > small").html($('input:checkbox[name=outScheduleChecked]:checked').length +" 개 선택됨");
		let stock_cd = $(this).val();
		
		
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
	
	
// ======================= jquery jakyoung 시작 ====================================
	// 출고 처리 모달창 날짜 계산
	let today = new Date();

	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);

	let dateString = year + '-' + month  + '-' + day;
	
// 	alert(dateString); 
	$("#currentDate").val(dateString);

	// 체크박스 체크 시 출고 지시 수량 required
	$('input[type=checkbox][name=outScheduleChecked]').change(function() {
       	let tr_id = $(this).closest("tr").attr("id");
// 		alert(tr_id);
        if ($(this).is(':checked')) {
        	$("#" + tr_id).find("input[type=number][name=input_out_qty]").prop("readonly", false);
        } else {
        	$("#" + tr_id).find("input[type=number][name=input_out_qty]").prop("readonly", true);
        }
    });
	
	$("#naga").on("click", function() {
		
		let osppArr = new Array(); // Out_schedule_total_viewVO
		
		$("#out_table > tbody > tr").each(function(index, item) {
			let ospp = new Object();
			
			ospp.out_date = $("#currentDate").val();
			ospp.out_schedule_cd = $("#outList" + index + " td:eq(0)").text(); // 출고 예정 코드
			ospp.out_qty = $("#outList" + index + " td:eq(2)").text(); // 출고 지시 수량
			ospp.stock_cd = $("#outList" + index + " td:eq(3)").text(); // 재고 코드
			
			console.log(index + ", " + ospp);
			
			osppArr.push(ospp);
		});
		
		console.log(osppArr);
		
		$.ajax({
			type : "POST",
			url : "OutProcessing",
			dataType: "text", // 응답 데이터 타입
			contentType: "application/json", // 요청 시 전송 데이터 타입
			data: JSON.stringify(osppArr)
		})
		.done(function(result) {
			alert("출고 처리가 완료되었습니다.");
			location.href = "OutProcessingSeletList";
		})
		.fail(function(result) {
			alert("일시적인 오류로 인해 출고 처리가 완료되지 않았습니다.")
			location.reload();
		});
		
	});
	
	
// ======================= jquery jakyoung 끝 ====================================
	
});//$(function(){------------------------------------------------

function productInfo(product_cd) {

}

// ======================= 스크립트 함수 jakyoung 시작 ====================================

	// 모달에 모달을 더해서
// 	$(document).on('hidden.bs.modal', function (event) {
// 		if ($('.modal:visible').length) {
// 			$('body').addClass('modal-open');
// 		}
// 	});
	
// 	$(document).on('show.bs.modal', function (event) { 
// 		// 모달창 드래그 기능
//         $(this).find($('.modal-dialog')).draggable({ handle: ".modal-header" });
// 	});
	
	// 재고 입력 창에 포커스 들어오면 div 열기
// 	$(document).on("focus", "input[name=stock_cd]", function() {
// 		const div_id = "#select_" + $(this).val();
// 		let stock_cd = $(this).val();
// 		console.log("div 아이디 : " + div_id + "재고 코드 : " + stock_cd);
		
// 		$("#select_" + stock_cd).css("display", "block");
		
// 		$(this).on("keyup", function() {
			
// 		});
		
// 	});

	// 재고 입력창에 포커스 빠지면 div 닫기
// 	$(document).on("focusout", "input[name=stock_cd]", function() {
		
// 		let stock_cd = $(this).val();
// 		console.log(stock_cd);
		
// 		$("#select_" + stock_cd).css("display", "none");
		
// 	});
	
	
	// 출고 버튼 클릭 시 모달 창 open~~
	function openOutModal() {
		
		$("#out_table > tbody").empty();
		
		
		let inputQtySum = 0; // 출고 지시 수량 합계 변수 선언
		
		$('input[name=outScheduleChecked]:checked').each(function(i, elements) {
			
// 			console.log('나와랏');
// //	 		alert("모달창 열리네요~ 출고가 들어오죠");
// 			//모달창 열기
// 			$('#out_naga_modal').modal('show');
// 			$('#out_naga_modal').show();
			
			let index = $(elements).index('input[name=outScheduleChecked]:checked');
			
			let out_list = ''; // 출력문 비우기
			let result = 0; // 결과 초기화
			
			let tr_id = $(this).closest("tr").attr("id"); // 해당 <tr> id 값 저장
			
			console.log(tr_id);
			
			let out_schedule_cd = $(this).val().split("/")[0]; // 출고 예정 코드
			let product_name = $(this).val().split("/")[1]; // 품목명
			let out_qty = $(this).val().split("/")[2]; // 미출고수량
			let input_out_qty = $("#" + tr_id).find("input[name=input_out_qty]").val(); // 출고 지시수량
			let stock_cd = $(this).val().split("/")[3]; // 재고 코드
			let wh_loc_in_area = ''; // 위치명
			
// 			alert(input_out_qty);
			
			inputQtySum += input_out_qty;
			result = out_qty - input_out_qty;
			console.log(result);
			
			if(result >= 0 && input_out_qty > 1) {
// 				console.log('나와랏');
//		 		alert("모달창 열리네요~ 출고가 들어오죠");
				//모달창 열기
				$('#out_naga_modal').modal('show');
				$('#out_naga_modal').show();
			} else {
				alert("출고 불가능한 수량이 포함되어 있습니다.");
				return;
			}
			
			out_list += '<tr id="outList' + index + '">';
			out_list += '<td>' + out_schedule_cd + '</td>';
			out_list += '<td>' + product_name + '</td>';
			out_list += '<td>' + input_out_qty + '</td>';
			out_list += '<td class="stock_cd"><a href="javascript:findWhLocArea(' + stock_cd + ', ' + index + ')">' + stock_cd + '</a></td>';
// 			out_list += '<button type="button" class="btn-sm btn-dark " onclick="">확인</button>';
// 			out_list += '<div class="card select_stock_cd" id="select_' + stock_cd + '"></div></td>';
			out_list += '<td class="wh_loc_in_area">' + wh_loc_in_area + '</td>';
			out_list += '</tr>';
			
			$("#out_table").append(out_list);
			$("#input_qty_sum").text(inputQtySum);
			
		});
		
	
	}
	
	function findWhLocArea(stock_cd, index) {
		console.log(stock_cd);
		console.log(index);
		
		window.open("Out_Inventory_View?searchType=STOCK_CD&keyword=" + stock_cd + "&index=" + index, "출고처리 - 재고코드 검색", "width=650, height=450, top=50, left=800");
	}
	
	
	
	
	

// ======================= 스크립트 함수 jakyoung 끝 ====================================

</script>
</head>
<body>

<jsp:include page="../inc/left.jsp"></jsp:include>

 <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>출고 처리 관리</b></h1>   
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
	<section id="searchSection" class="m-0 d-flex justify-content-end">
  		<form action="OutProcessingSeletList ">
				<!-- 검색 타입 추가 -->
				<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1">
					<option value="OUT_SCHEDULE_CD" <c:if test="${param.searchType eq 'OUT_SCHEDULE_CD'}">selected</c:if>>출고예정번호</option>
					<option value="PRODUCT_NAME" <c:if test="${param.searchType eq 'PRODUCT_NAME'}">selected</c:if>>품목명</option>
					<option value="CUST_NAME" <c:if test="${param.searchType eq 'CUST_NAME'}">selected</c:if>>거래처명</option>
				</select>			
				<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword" value="${param.keyword }"> 
				<input type="submit" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" >
		</form>
	   </section>
			
<!-- 창고 구역 내의 상세 위치에 등록되어 있는 재고 목록 표시 
	 재고번호, 품목명, 규격, 창고명, 구역명, 위치명, 재고수량 표시 
	 재고번호 클릭 시 재고 이력 표시 화면(창) 띄우기 -->

	<div id = "selectCount"><small class="text-secondary"> 0 개 선택됨</small></div>
	<table class="table"  id="outScheduleTable">
		<thead>
			<tr>
				<th width="60px"><input type="checkbox" name="AllChecked" ></th>
				<th>출고예정번호</th>
				<th width="250px">받는곳명(거래처명)</th>
				<th width="250px">품목명</th>
				<th width="150px">납기일자</th>
				<th width="110px">출고예정수량</th>
				<th width="110px">미출고수량</th>
				<th>출고지시수량</th>
				<th width="200px">적요</th>
			</tr> 
		</thead>
		<tbody>
		<c:forEach items="${outTotalScheduleList }" var="total" varStatus="status" >
			<tr id="out_schedule_${status.index }">
				<td align="center"><input type="checkbox" name="outScheduleChecked" class="form-check-input" value="${total.out_schedule_cd }/${total.product_name }/${total.out_qty }/${total.stock_cd }"></td>
				<td><a onclick="window.open('outScheduleModifyForm?out_schedule_cd=${total.out_schedule_cd }','outScheduleModifyForm','width=1009, height=900, top= 40,left=450, location=no,status=no,scrollbars=yes')">${total.out_schedule_cd }</a></td>
				<td>${total.cust_name }</td>
				<td>${total.product_name }</td>
				<td>${total.out_date }</td>
				<td>${total.out_schedule_qty }</td>
				<td>${total.out_qty }</td>
				<td><input type="number" class=" bg-light border border-secondary rounded-1 px-1 adjust" name="input_out_qty" value="${total.out_qty }" min="1" max="${total.out_qty }" readonly="readonly"></td>
				<td>${total.remarks }</td>
			</tr>
			</c:forEach>

		</tbody>
	
	</table>
	<div class="float-left">
		<input type="button" value="출고" class = "btn btn-sm btn-success m-2"	onclick="openOutModal()">
	</div>
	
	<div class="float-right">
	<section id="pageList">
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
					<c:when test="${empty param.pageNum }">
						<c:set var="pageNum" value="1" />
					</c:when>
					<c:otherwise>
						<c:set var="pageNum" value="${param.pageNum }" />
					</c:otherwise>
				</c:choose>
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" class = "btn btn-primary btn-sm  " onclick="location.href='OutProcessingSeletList?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전" class = "btn btn-primary btn-sm  ">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="OutProcessingSeletList?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" value="다음" class = "btn btn-primary btn-sm  " onclick="location.href='OutProcessingSeletList?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음" class = "btn btn-primary btn-sm  ">
			</c:otherwise>
		</c:choose>
	</section>
	</div>
	
</div>
</div>
<!-- 재고번호 클릭시 보이는 모달 영역 DIV  -->

	<div id="modal_container_product" class="modal">

 		 <a href="#" rel="modal:close">Close</a>
 
	</div><!-- end of DIV #modal_container -->
	
<!-- -------------------------- jakyoung 시작 ------------------------------------- -->
<!-- 출고 버튼 클릭 시 모달 -->

	<div id="out_naga_modal" class="modal" data-backdrop="static">
		<form class="">
		
			<div class=" m-3 border border-light border-top-0 rounded-2 border border-1"> 
				<div class="p-2 bg-light text-black well rounded-2" >출고</div>
				
				<div class="row form-group">
				<div class="form"><label for="out_date" class=" form-control-label">일자</label></div>
				<div class="col-12 col-md-9"><input type="date" id="currentDate" class="form-control rounded-start" name="out_date" required="required"></div>
				</div>
					<table class="mt-3 table table-hover" id="out_table">
						<thead>
							<tr>
								<th>출고예정번호</th>
								<th>품목명</th>
								<th>출고 수량</th>
								<th>출고할 재고번호</th>
								<th>위치명</th>
							</tr>
						</thead>
						<tbody>
						
						
						</tbody>
					</table>		
				</div>
<!-- 				<div> -->
<!-- 					<b>합계 :</b><span id="input_qty_sum"></span> --> <!-- 문자열로 나옴 -->
<!-- 				</div> -->
	  		<button type="button" class="btn btn-dark" id="naga" >출고 처리</button>
		
		</form>
		
	</div>
<!-- 출고 모달 끝 -->
<!-- 재고 코드 검색 모달 -->	
<!-- 	<div id="find_stock_modal" class="modal" tabindex="-1">재고 코드</div> -->
<!-- 재고 번호 검색 모달 끝 -->	

<!-- -------------------------- jakyoung 끝 ------------------------------------- -->


<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>