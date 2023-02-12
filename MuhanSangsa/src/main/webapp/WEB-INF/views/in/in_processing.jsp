<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title>입고 처리 | 입고 관리</title>

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
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
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
		
	#vertical-align{
		 vertical-align: middle;
	}
	table{
	 text-align: center;
	}
	
	inproList-table > th{
	height: 100px;
	}
		
	.id_pht{
	 width: 80px;
	 transition: 0.5s;
	}
	
/* 스크롤바 크기 설정*/
  #modal_container::-webkit-scrollbar {
     width: 3px; 
  }
  #modal_container_dept::-webkit-scrollbar {
     width: 3px; 
    } 
  
/* #modal_container > th { */
/* 	height: 50px; */
/* } */
 a{
 text-decoration: none;
 color: 	#000080;
}
 a:visited :active{
 text-decoration: none;
 color: 	#000080;
}


/* #modal_container select{ */
/* /* 	display: none; */ */
/* } */

/* .modal a.close-modal{ */
/* 	display: none; */
/* } */

/* 모달 */
#modal_container{
  width: 80%; 
  height: 80%;
  position: absolute; 
  top: 30%; 
/*   left: 50%;  */
/*   overflow-y: scroll; */
}
.modal{
	width: 55%!important;
  	max-width: 1000px!important;
  	left: 10%!important;
  	height: 70%!important;
/*   width: 1000px!important;  */
/*   --bs-modal-width: 1000px!important;  */
}

</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->
<script type="text/javascript">
	// 입고예정코드 클릭 시 수정 페이지 이동
	function modify(item){
		var code=$(item).text();
		window.open('InProcessingModifyForm?in_schedule_cd='+code,'InProcessingModifyForm','width=760, height=900, top= 40,left=540,location=no,status=no,scrollbars=yes');

	} // 수정페이지
	
	
	$(function(){
		//전체선택 버튼 클릭
		$('input:checkbox[name=AllChecked]').on("click",function(){
			if($(this).is(":checked") == true){
				$("input[name=inChecked]").prop("checked",true);
			}else{
				$("input[name=inChecked]").prop("checked",false);
			}
		});	//전체선택버튼
		
		// 체크박스 클릭
		$(document).on("change","input[name=inChecked]",function(){
			$("#selectCount > small").html($('input:checkbox[name=inChecked]:checked').length +" 개 선택됨");
			let in_schedule_cd = $(this).val();
		});//체크박스
		
		// 입고 버튼 클릭 시
		$("#inScheduleBtn").on("click", function(){
			let inRegisterList = []; // 배열 선언, 변수명 컨트롤러 파라미터명과 동일
			$('input:checkbox[name=inChecked]').each(function(index){
				if($(this).is(":checked")==true){
					console.log("id값=in_schedule_cd : "+$(this).val());
					inRegisterList.push($(this).val()); // 배열에 추가
					
					console.log("inRegisterList[] : "+ inRegisterList);
						window.open('InRegister?inRegisterList='+inRegisterList,'InRegister','width=1500, height=800,location=no,status=no,scrollbars=yes');
						console.log(inRegisterList);
				}
							
			});
					
					
		}); //입고버튼
			
			
		
		
		
		
		
	
	
	
	
	
	
	
	});//제이쿼리
	

	
	
	
</script>
<body>

<!-- left bar -->
<jsp:include page="../inc/left.jsp"></jsp:include>

<!-- 선택 탭 -->
<div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>입고 처리</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href='javascript:void(0);'>입고 관리</a></li>
                                    <li><a href='javascript:void(0);'>입고 처리</a></li>
                                   
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<div class="content">
   <div class="animated fadeIn">
	<section id="searchSection" class="m-0 d-flex justify-content-end">
  		<form action="employees_search ">
				<!-- 검색 타입 추가 -->
				<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1">
					<option value="emp_name" <c:if test="${param.searchType eq 'emp_name'}">selected</c:if>>보낸곳명</option>
					<option value="emp_num" <c:if test="${param.searchType eq 'emp_num'}">selected</c:if>>품목명</option>
				</select>			
				<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword" value="${param.keyword }"> 
				<input type="submit" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" >
		</form>
		
		
	 </section>
	<c:if test="${priv eq 1 }">
 	 	<div id = "selectCount"><small class="text-secondary"> 0 개 선택됨</small></div>

  	</c:if>
<!-- 	<form action="InRegister" method="post" name="form" enctype="multipart/form-data" class="form-horizontal"> -->
	<table class="table  vertical-align"  id="empList-table">
		<thead>
			<tr>
				<th><input type="checkbox" name="AllChecked"></th>
				<th>입고예정번호</th>
				<th>보낸곳명</th>
				<th>품목명[규격]</th>
				<th>납기일자</th>
				<th>입고예정수량</th>
				<th>입고수량</th>
				<th>미입고수량</th>
				<th>적요</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${inProList }" var="inlist" varStatus="status" >
			<tr>
				<td align="center"><input type="checkbox" name="inChecked" id="inChecked" value="${inlist.in_schedule_cd }/${inlist.product_name }/${inlist.in_date }"></td>
				<td><a id="in_schedule_cd" href='javascript:void(0);' onclick="modify(this)">${inlist.in_schedule_cd }</a></td>
				<td>${inlist.cust_name }</td>
				<td>${inlist.product_name }</td>
				<td>${inlist.in_date }</td>
				<td>${inlist.in_schedule_qty }</td>
				<td>${inlist.in_qty }</td>
				<td>${inlist.no_in_qty }</td>
				<td>${inlist.remarks }</td>
			</tr>
		</c:forEach>
		</tbody>
	
	</table>
	<div class="float-left">
	<div id="modal-btn-div" class="float-right mt-4">
		<input type="button" value="입고" class = "btn btn-sm btn-success m-2" id="inScheduleBtn">
	</div>
	</div>
<!-- 	</form> -->
<!-- onclick="javascript:register();"  -->









</div>
</div>
<!-- </div> -->


<!-- content -->
<!-- <div id="content_tab"> -->
<%-- <jsp:include page="in_schedule_form.jsp"></jsp:include> --%>
<!-- </div>content -->

<!-- <div id="container"> -->
<!-- 	<ul class="tab"> -->
<!-- 		<li data-tab="in_schedule_form" class='tabmenu'><a href="#">TabExample1</a></li> -->
<!-- 		<li data-tab="in_waiting_form" class='tabmenu'><a href="#">TabExample2</a></li> -->
<!-- 		<li data-tab="in_completed_form" class='tabmenu'><a href="#">TabExample3</a></li> -->
<!-- 	</ul> -->
<!-- 	<div id="tabcontent"></div> -->
<!-- </div> -->


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
