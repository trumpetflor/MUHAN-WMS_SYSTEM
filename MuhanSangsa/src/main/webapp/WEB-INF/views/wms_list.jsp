<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
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
    
     <link href="resources/assets/css/styles_wms.css" rel="stylesheet" />
	
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
		 background-color: yellow;
		  height: 1200px;
		  position: relative;
		}
		
		#layoutSidenav {
	    position: fixed;
	    }
		
		#layoutSidenav_nav {
	    width: 500px; 
	    }
	    
	    #divBox {
		  width: 100px;
		  height: 100px;
		  margin-top: 10px;
		  line-height: 100px;
		  text-align: center;
		  border: 2px dashed black;
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
		$(document).ready(function(){
			
			//---------------------------------------토글 처리 부분
			
	        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때 (창고목록 > 창고구역명 )
	        $(".menu>a").click(function(){
	            var submenu = $(this).next("ul");
	            
	 
	            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	            if( submenu.is(":visible") ){
	                submenu.slideUp();
	            }else{
	                submenu.slideDown();
	            }
	          
	        });
	        
	 		// 창고구역명 > 창고 구역 내 위치명       
	        $(".hide>.w1").click(function() {
	        	var submenu2 = $(this).next("ul");
	        	
	        	if( submenu2.is(":visible") ){
	        		submenu2.slideUp();
	            }else{
	            	submenu2.slideDown();
	            }
	        	
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
	</script>


	
</head>
 <body class="sb-nav-fixed">
    <jsp:include page="inc/left.jsp"></jsp:include>
		<!-- employee_registration_form body 내용 시작  -->
		
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>인사 관리</h1>
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
		<div class="content d-flex">
			<div>
			    <ul style="border:  1px solid blue; width: 410px;">
			        <li class="menu" style="border:  1px solid red;">
			            <a><img src="./resources/images/right-arrow.png" width="10px" />&nbsp;&nbsp;<i>창고 목록 1</i>
			             <input type="button" value="+" id="addColumn" style="float: right;"></a> 
			            <ul class="hide">
			                <li class="w1"><a><img src="./resources/images/right-arrow.png" width="10px" />&nbsp;&nbsp;창고 구역명 1-1
			                <input type="button" value="+" style="float: right;"><input type="button" value="-" style="float: right;"></a></li>
			                	<ul class="hide">
			                 		<li class="w2"><a>창고 구역 내 위치 명 1-1-1&nbsp;&nbsp;&nbsp;&nbsp;
			                 		<input type="button" value="+" style="float: right;"><input type="button" value="-" style="float: right;"></a></li>
			                 		<li class="w2"><a>창고 구역 내 위치 명 1-1-2</a></li>
			                 		<li class="w2"><a>창고 구역 내 위치 명 1-1-3</a></li>
		                 		</ul>
			                <li class="w1">창고 구역명 1-2</li>
			                <li class="w1">창고 구역명 1-3</li>
			                <li class="w1">창고 구역명 1-4</li>
			                <li class="w1">창고 구역명 1-5</li>
			                <li class="w1">창고 구역명 1-6</li>
			            </ul>
			        </li>
			 
			        <li class="menu">
			            <a><img src="./resources/images/logo.png" width="30px"/>창고 목록 2</a>
			            <ul class="hide">
			                <li>메뉴2-1</li>
			                <li>메뉴2-2</li>
			                <li>메뉴2-3</li>
			                <li>메뉴2-4</li>
			                <li>메뉴2-5</li>
			                <li>메뉴2-6</li>
			            </ul>
			        </li>
			    </ul>
			</div>
			
			
		</div> <!-- content -->
       
    <div class="clearfix"></div>

<jsp:include page="inc/footer.jsp"></jsp:include>
<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

	
</body>
</html>