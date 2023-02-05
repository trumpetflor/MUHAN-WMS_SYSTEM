<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page isELIgnored="false" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Muhan - WMS Warehouse</title>
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

<link href="${pageContext.request.contextPath}/resources/assets/css/styles_wms.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
   
<style type="text/css">

.col-lg-6{
		margin: auto;
		max-width: 60%;
		flex: 100 100;
	}
	
	body{
	width: 100%;
	height: 100%;
	}
	
	#left {
	 width: 500px;
/* 	 background-color: grey; */
	 height: 1200px;
	 position: relative;
	}
	
	#right{
	 width: 800px;
	 background-color: white;
	 height: 1200px;
	 margin-left: 30px; 
/* 	  position: relative; */
	}
	
	#layoutSidenav {
    position: fixed;
    }
	
	#layoutSidenav_nav {
    width: 500px; 
    }
	
    .menu a{cursor:pointer;}
  	.menu .hide{display:none;}
   
    ul { 
    	list-style:none; 
    } 
    
    .w1 {
    	list-style:none;
    	padding-left: 20px; 
    }
     .w2 {
    	list-style:none;
    	padding-left: 70px; 
    }
	    
	    
</style>
<script type="text/javascript">

	$(document).ready(function() {

		//---------------------------------------토글 처리 부분

		// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때 (창고목록 > 창고구역명 )
		
		$(".menu a").click(function() {
			
			// 창고 구역 목록 보이기
			var submenu = $(this).next("ul");

			// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}

		});

		// 창고구역명 > 창고 구역 내 위치명       
		$(".hide>.w1").click(function() {
			var submenu2 = $(this).next("ul");

			if (submenu2.is(":visible")) {
				submenu2.slideUp();
			} else {
				submenu2.slideDown();
			}
		});

		$("#add_wh_area").focusout(function() {
			let add_wh_area = $("#add_wh_area").val();
			alert("창고명 : " + add_wh_area);
			
			$.ajax({
				
			});

		});
		
		
		
		
		//---------------------------------------토글 처리 부분 		

		// 이미지 롤오버 처리
		// 	        $("a.imgRollover").on("click", function(){
		// 	            // a 태그 하위에 있는 img 태그 찾기
		// 	            var img = $(this).find("img");
		// 	            var src = img.attr("src");

		// 	            // 현재 이미지가 on 인지 off 인지 판단
		// 	            var isOn = src.indexOf("_on.") > 0;

		// 	            // on 상태면 이미지 파일이름을 *_off 로 바꾸고 아니면 *_on 로 바꾸기
		// 	            if( isOn ){
		// 	                img.attr("src", src.replace("_on.", "_off."));
		// 	            }else{
		// 	                img.attr("src", src.replace("_off.", "_on."));
		// 	            }
		// 	        });

		// 메뉴 클릭 처리
		// 	        $(".menu>a").on("click", function(){
		// 	            // 전에 펼쳐져 있던 메뉴
		// 	            var oldMenu = $(".menu>ul").filter(":visible");
		// 	            var oldMenuImg = oldMenu.prev("a").find("img");

		// 	            // 전에 펼쳐져 있던 메뉴가 있으면
		// 	            if( oldMenu.length>0 ){
		// 	                // 메뉴버튼 이미지를 off 로 바꾸고 하위 메뉴를 안보이게 한다.
		// 	                oldMenuImg.attr("src", oldMenuImg.attr("src").replace("_on.", "_off."));
		// 	                oldMenu.hide();
		// 	            }

		// 	            // 지금 클릭한 메뉴
		// 	            var menu = $(this).next("ul");
		// 	            var menuImg = $(this).find("img");

		// 	            // 지금 클릭한 메뉴버튼 이미지는 on 으로 바꾸고 하위메뉴를 보이게 한다.
		// 	            menuImg.attr("src", menuImg.attr("src").replace("_off.", "_on."));
		// 	            menu.show();
		// 	        });
		// 	   	 });
		// --------------------------이미지 롤오버 처리

		//-------------------항목 + / - 처리

		// 항목 + 처리하기 
		// 		 $("#addColumn").on("click", (function(){

		// 			 $(".w1").after("<li class="w1"><a><img src="./resources/images/right-arrow.png" width="10px" />&nbsp;&nbsp;창고 구역명 1-3");

		//             });

	}); // document
	
	function whArea(wh_cd) { // 한 번만 되게 만들기... 어떻게..?
		$.ajax({
			type: "GET",
			url: "WmsWarehouseArea?wh_cd=" + wh_cd,
			dataType: "json"
		})
		.done(function(whaList) { // 요청 성공 시
			for(let whArea of whaList) {
				let wh_area_cd = whArea.wh_area_cd; // 창고 구역 코드 변수에 저장
// 				alert("창고 코드 : " + whArea.wh_cd + "창고 구역 코드 : " + wh_area_cd);
				let result = "<li class='w1'>"
							+ "<a href='javascript:whLocArea(" + wh_area_cd + ")'><img src='./resources/images/right-arrow.png' width='10px' />"
							+ "&nbsp;" + whArea.wh_area 
							+ "<input type='button' value='+' style='float: right;'>"
							+ "<input type='button' value='-' style='float: right;'></a></li>";
				$("#" + whArea.wh_cd).append(result);
				
			}
		})
		.fail(function() {
			$("#" + whArea.wh_cd).append("요청 실패..ㅠㅠ");
		});
	}
	
	function whLocArea(wh_area_cd) { // 걍 안 뜸
		$.ajax({
			type: "GET",
			url: "WmsWarehouseLocArea?wh_area_cd=" + wh_area_cd,
			dataType: "json"
		})
		.done(function(whlaList) { // 요청 성공 시
			for(let whLocArea of whlaList) {
				alert("창고 구역 코드 : " + whLocArea.wh_area_cd + "창고 구역 위치 코드 : " + whLocArea.wh_loc_in_area_cd);
				let html = "<ul class='hide warehouse-loc-area' id='" + whLocArea.wh_loc_in_area_cd + "'>"
							+ "<li class='w2'>"
							+ "<a>&nbsp;" + whLocArea.wh_loc_in_area
							+ "<input type='button' value='+' style='float: right;'>"
							+ "<input type='button' value='-' style='float: right;'></a></li>"
							+ "</ul>";
				alert(html);
// 				alert($(".warehouse-loc-area").text());
				$(".warehouse-loc-area").html(html);
			}
		})
		.fail(function() {
			$(".warehouse-loc-area").append("요청 실패..ㅠㅠ");
		});
	}
	
</script>

</head>
 <body class="sb-nav-fixed">
    <jsp:include page="../inc/left.jsp"></jsp:include>
		<!-- employee_registration_form body 내용 시작  -->
		
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>창고 관리</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li class="active">사원등록</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
         <div class="breadcrumbs">
         	<div class="breadcrumbs-inner">
                <div class="row m-0">
                	<div class="col-sm-4">
                		<div class="page-header float-left">
		                	<div class="page-title">
		                		<h1>수정/삭제 추가 자리</h1>
		                		<div style="display:inline"><input type="text" id="listW0"><input type="button" id="addListW0" value="+">
		                		<input type="text" id="add_wh_area" name="wh_area"><input type="button" id="addListW2" value="+"><input type="button" id="deleteListW1" value="-"></div>
		                		<input type="text" id="add_wh_loc_area" name="wh_loc_area"><input type="button" id="addListW2" value="+"><input type="button" id="deleteListW1" value="-"></div>
		                	</div>
                		</div>
                	</div>
                </div>
            </div>    
        
		<div class="content d-flex">
			<div>
			    <ul style=" width: 410px;">
			    	<c:forEach var="wh" items="${whList }" varStatus="wh_idx"> <!-- 창고 반복 -->
			        <li class="menu" style="">
			            <a href="javascript:whArea('${wh.wh_cd }')"><img src="./resources/images/right-arrow.png" width="10px" />&nbsp;<i>${wh.wh_name }</i> 
			            <input type="button" value="+" id="addColumn" style="float: right;"></a>
			            <ul class="hide warehouse-area" id="${wh.wh_cd }">
			                <li class="w1"><a><img src="./resources/images/right-arrow.png" width="10px" />&nbsp;창고 추가
			                <input type="button" value="+" style="float: right;"><input type="button" value="-" style="float: right;"></a>
			                	<ul class="hide warehouse-loc-area">
			                 		<li class="w2">창고 구역 위치<a>&nbsp;
			                 		<input type="button" value="+" style="float: right;"><input type="button" value="-" style="float: right;"></a>
			                 		</li>
		                 		</ul>
			                </li>
			            </ul>
			        </li>
			        </c:forEach>
				</ul>
			</div>
			
			<div id="right">
			
			</div>
			
		</div> <!-- content -->
       
    <div class="clearfix"></div>

<jsp:include page="../inc/footer.jsp"></jsp:include>
<!-- Right Panel -->

<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script> --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

	
</body>
</html>