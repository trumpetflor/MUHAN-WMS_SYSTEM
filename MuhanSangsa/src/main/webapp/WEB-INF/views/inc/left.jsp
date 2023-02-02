<meta charset="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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

		<script src="/static/js/bootstrap.bundle.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	
	

	<style type="text/css">
		.grandchildren {
		display: none;
		position: absolute;
		}
		
		.children {
			position: relative;
		}
		
		.children:hover .grandchildren {
			display: block;
		}
	
		@font-face {
		    font-family: 'NEXON Lv1 Gothic OTF';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		*{
			font-family: 'NEXON Lv1 Gothic OTF';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
	</style>
</head>

</html>
 <!-- 로그아웃 확인 -->
<script>
	function logout() {
		let isLogout = confirm("로그아웃 하시겠습니까?");
		
		if(isLogout) {
			location.href = "Logout";
		}
	}
</script>
 <!-- Left Panel -->
 <aside id="left-panel" class="left-panel">
     <nav class="navbar navbar-expand-sm navbar-default">

         <div id="main-menu" class="main-menu collapse navbar-collapse">
             <ul class="nav navbar-nav">
                 <li>
                     <a href="#"><i class="menu-icon fa fa-laptop"></i>Main</a>
                 </li>
                 <li class="menu-title"><b>인사</b></li><!-- /.menu-title -->
                 <li>
                     <a href="employeeRegisterForm" > <i class="menu-icon fa fa-cogs"></i>사원 등록</a>
                 </li>
                     
                 
                 <li>
                     <a href="employees" > <i class="menu-icon fa fa-table"></i>사원 조회</a>
                 </li>


                 <li class="menu-title"><b>재고 관리</b></li><!-- /.menu-title -->

                 <li class="menu-item-has-children dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>기본 등록</a>
                     <ul class="sub-menu children dropdown-menu">
                         <li><i class="menu-icon fa fa-fort-awesome"></i><a href="ClientList">a. 거래처 조회</a></li>
                         <li><i class="menu-icon fa fa-fort-awesome"></i><a href="ClientInsertForm">a. 거래처 등록</a></li>
                         <li><i class="menu-icon ti-themify-logo"></i><a href="WarehouseList">b. 창고 조회</a></li>
                         <li><i class="menu-icon ti-themify-logo"></i><a href="WarehouseInsertForm">b. 창고 등록</a></li>
                         <li><i class="menu-icon ti-themify-logo"></i><a href="#">c. 품목 조회</a></li>
                         <li><i class="menu-icon ti-themify-logo"></i><a href="#">c. 품목 등록</a></li>
                     </ul>
                 </li>
                 
                 <li class="menu-title"><b>구매 관리</b></li><!-- /.menu-title -->
                 <li class="menu-item-has-children dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>구매</a>
                     <ul class="sub-menu children dropdown-menu">
                         <li><i class="menu-icon fa fa-fort-awesome"></i><a href="#">구매 조회</a></li>
                         <li><i class="menu-icon ti-themify-logo"></i><a href="#">구매 입력</a></li>
                         <li><i class="menu-icon ti-themify-logo"></i><a href="#">구매 현황</a></li>
                     </ul>
                 </li>
                 
                  <li class="menu-title"><b>WMS</b></li><!-- /.menu-title -->

                 <li class="menu-item-has-children dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>창고 관리</a>
                     <ul class="sub-menu children dropdown-menu">
                         <li><i class="menu-icon fa fa-fort-awesome"></i><a href="#">a. 거래처 등록</a></li>
                         <li><i class="menu-icon ti-themify-logo"></i><a href="#">b. 창고 등록</a></li>
                         <li><i class="menu-icon ti-themify-logo"></i><a href="#">c. 품목 등록</a></li>
                     </ul>
                 </li>
 
 				<li class="menu-item-has-children dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>입고 관리</a>
                     <ul class="sub-menu children dropdown-menu">
                         <li><i class="fa fa-table"></i><a href="#">입고 예정</a></li>
                         <li><i class="fa fa-table"></i><a href="#">입고 처리</a></li>
                     </ul>
                 </li>

 				<li class="menu-item-has-children dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>출고 관리</a>
                     <ul class="sub-menu children dropdown-menu">
                         <li><i class="fa fa-table"></i><a href="#">출고 예정</a></li>
                         <li><i class="fa fa-table"></i><a href="#">출고 처리</a></li>
                     </ul>
                 </li>

 				<li class="menu-item-has-children dropdown">
 				    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>재고 관리</a>
                     <ul class="sub-menu children dropdown-menu">
                         <li><i class="fa fa-table"></i><a href="#">재고 조회</a></li>
                         <li><i class="fa fa-table"></i><a href="#">재고 입력</a></li>
                         <li><i class="fa fa-table"></i><a href="#">재고 이동</a></li>
                     </ul>
                 </li>
<!--                  <li class="menu-title">Extras</li>/.menu-title -->
<!--                  <li class="menu-item-has-children dropdown"> -->
<!--                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a> -->
<!--                      <ul class="sub-menu children dropdown-menu"> -->
<!--                          <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li> -->
<!--                          <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li> -->
<!--                          <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li> -->
<!--                      </ul> -->
<!--                  </li> -->
             </ul>
         </div><!-- /.navbar-collapse -->
     </nav>
 </aside><!-- /#left-panel -->

 <!-- Left Panel -->

 <!-- Right Panel -->

 <div id="right-panel" class="right-panel">

     <!-- Header-->
     <header id="header" class="header">
         <div class="top-left">
             <div class="navbar-header">
                 <a class="navbar-brand" href="./"><img src="${pageContext.request.contextPath}/resources/images/logo_bg_white.png" style="width: 54px; margin: -5;"  alt="Logo"></a>
                 <a class="navbar-brand hidden" href="./"><img src="${pageContext.request.contextPath}/resources/images/logo_bg_white.png" alt="Logo"></a>
                 <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
             </div>
         </div>
         <div class="top-right">
             <div class="header-menu">
                 <div class="user-area dropdown float-right">
                     <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/resources/images/admin_cha.jpg" alt="User Avatar">
                     </a>

                     <div class="user-menu dropdown-menu">
                         <a class="nav-link" href="./Mypage"><i class="fa fa-user"></i>My Profile</a>

                         <a class="nav-link" href="javascript:logout()"><i class="fa fa-power-off"></i>Logout</a>
                     </div>
                 </div>
             </div>
         </div>
     </header><!-- /header -->
     <!-- Header-->

<!-- Right Panel -->

<!-- <!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script> --%>
