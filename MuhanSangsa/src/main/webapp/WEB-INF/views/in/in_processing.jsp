<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
	<title>In Processing</title>

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
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<!-- jQuery Modal -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
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
	

/* 	#empChecked{ */
/* 		margin: 10px; */
	
/* 	} */



/* 모달 */
/* #modal_container{ */
/*   position: absolute; */
/*   width:1800px; */
/*   height: auto; */
/*   position: fixed; */
/*   top:50%; */
/*   left: 50%; */
/*   transform:translate(-50%,-50%); */
/*   overflow-y: scroll; */


/* } */
/* .close-modal{ */
/*   display: none; */
/* } */
	
/* #modal_container_dept{ */
/*   position: absolute; */
/*    height: 70%; */
/*   position: fixed; */
/*   top:50%; */
/*   left: 50%; */
/*   transform:translate(-50%,-50%); */
/*   overflow-y: scroll; */
/*   padding: 2px; */

/* } */
	
/* 스크롤바 크기 설정*/
  #modal_container::-webkit-scrollbar {
     width: 3px; 
  }
  #modal_container_dept::-webkit-scrollbar {
     width: 3px; 
    } 
  
#modal_container > th {
	height: 50px;
}
 a{
 text-decoration: none;
 color: 	#000080;
}
 a:visited :active{
 text-decoration: none;
 color: 	#000080;
}


#modal_container select{
/* 	display: none; */
}

.modal a.close-modal{
	display: none;
}

</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->
<script type="text/javascript">
	
	//체크박스 선택 시
	$(document).on("change","input[name=inproChecked]",function(){
		
		$("#selectCount > small").html($('input:checkbox[name=inproChecked]:checked').length +" 개 선택됨");
		
// 		alert("체크됨: "+ $(this).val());
		let idx = $(this).val().split("/")[0];
		let emp_name = $(this).val().split("/")[1];
		let emp_num = $(this).val().split("/")[2];
		let emp_info = {"emp_num":emp_num,"emp_name":emp_name};
	
		
	});
	
	$(function(){
		$("#inButton").on("click", function(){
			window.open('InRegisterForm','InRegisterForm', 'width=1000, height=920,location=no,status=no,scrollbars=yes');
		});
	});
	
	$("#inButton").on("click", function(){
		let in_schedule_cd = [];
		$('input:checkbox[name=inproChecked]').each(function(index){
			if($(this).is(":checked")==true){
				console.log("id값=in_schedule_cd : "+$(this).val());
				in_schedule_cd.push($(this).val());
			}
		});
		
		console.log("in_schedule_cd[] : "+ in_schedule_cd);
		let result = confirm("코드" +$('input:checkbox[name=inproChecked]:checked'));
		if(result){
			location.href="InRegisterPro";
		}
	});
	
	
	
</script>
<body>

<!-- left bar -->
<jsp:include page="../inc/left.jsp"></jsp:include>

<!-- 선택 탭 -->
<div class=" pr-4 mr-4 mb-1 mt-4 float-right"></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>입고 관리</b></h1>   
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
	<table class="table  vertical-align"  id="empList-table">
		<thead>
			<tr>
				<th></th>
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
				<td><input type="checkbox" name="empChecked" id="empChecked" class="form-check-input" value="${status.index}/${emp.emp_name }/${emp.emp_num }/${emp.dept_name}"></td>
				<td>${inlist.in_schedule_cd }</td>
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
		<input type="button" value="입고" class = "btn btn-sm btn-success m-2" name="inButton" id="inButton">
	</div>


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

<script type="text/javascript">
// function inSchedule(){
// 	alert("왜안떠");

// }

// 입고 대기

// function inWaiting() {
// 	pageContext.forward("in_waiting_form.jsp");
// 	$("#content_tab").load("in_waiting_form.jsp");
// 	$.ajax({
// 		type: "GET",
// 		url: "InWaiting",
// 		dataType: "script",
// 		success: function(result) {
// 			alert(result);
// 			$("#content_tab").empty();
// // 			document.getElementById("#content_tab").innerHTML = result;
// 			$("#content_tab").html(result);
// 		}

// 	});

// $.ajax({
// 	url : "in_waiting_form.jsp",
// 	dataType : "html",
// 	type : "post",
// 	success : function(result){
// 		$("#content_tab").empty();
// 		$("#content_tab").html(result);	
// 	}
// });


// }



// function inCompleted(){}

// $(function(){
// 	$('.tabmenu'.click(function(){
// 		var activeTab = $(this).attr('data-tab');
// 		$('li').css('background-color', 'white');
// 		$(this).css('background-color', 'green');
// 		$.ajax({
// 			type : 'GET',
// 			url : activeTab + ".jsp",
// 			dataType: "jsp",
// 			success : function(data){
// 				$('#tabcontent').html(data);
// 			}
// 		})
// 		})
// })
</script>

</body>
</html>
