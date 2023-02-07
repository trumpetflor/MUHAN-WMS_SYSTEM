<style>

	@font-face {
	    font-family: 'NEXON Lv1 Gothic OTF' !important;
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}

	*{
		font-family: 'NEXON Lv1 Gothic OTF';

	}
	
	a{
	text-decoration: none;
	}
	
	li{
		font-family: 'NEXON Lv1 Gothic OTF' !important;
	
	}
</style>
		
 <!-- 로그아웃 확인 -->
<script>
	function logout() {
		let isLogout = confirm("로그아웃 하시겠습니까?");
		
		if(isLogout) {
			location.href = "Logout";
		}
	}
</script>

<!-- ~~~~~~~~~~~~~~수정해서 쓰세요~~~~~~~~~~~~~~ -->
   <meta charset="utf-8">
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script>
   <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href=""><i class="menu-icon fa fa-laptop"></i>Main </a>
                    </li>
                    <li class="menu-title"><b>인사</b></li><!-- /.menu-title -->
                    <li>
                        <a href="employeeRegisterForm"><i class="menu-icon ti-email"></i>사원 등록</a>
                    </li>
                    <li>
                        <a href="employees"> <i class="menu-icon ti-email"></i>사원 조회</a>
                    </li>
                        
                    <li class="menu-title">재고관리</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>기본 등록</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="ClientList">거래처 조회</a></li>
                            <li><i class="fa fa-table"></i><a href="ClientInsertForm">거래처 등록</a></li>
                            <li> ------------------ </li>
                            <li><i class="fa fa-table"></i><a href="WarehouseList">창고 조회</a></li>
                            <li><i class="fa fa-table"></i><a href="WarehouseInsertForm">창고 등록</a></li>
                              <li> ------------------ </li>
                            <li><i class="fa fa-table"></i><a href="ProdSelectList">품목 조회</a></li>
                            <li><i class="fa fa-table"></i><a href="ProdInsertForm">품목 등록</a></li>
                        </ul>
                    </li>
                    
                    <li class="menu-title">구매 관리</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>구매</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="">구매 조회</a></li>
                            <li><i class="fa fa-table"></i><a href="">구매 입력</a></li>
                            <li><i class="fa fa-table"></i><a href="">구매 현황</a></li>
                        </ul>
                    </li>
                    
                    <li class="menu-title">WMS</li><!-- /.menu-title -->
                    <li>
                        <a href="WmsWarehouse"><i class="menu-icon ti-email"></i>창고 관리</a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>입고 관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="InSchedule">입고 예정</a></li>
                            <li><i class="fa fa-table"></i><a href="InScheduleInsert">입고 처리</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>출고 관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="OutWaitingSelectList">출고 예정</a></li>
                            <li><i class="fa fa-table"></i><a href="OutProcessingSeletList">출고 처리</a></li>
                        </ul>
                    </li>


                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>재고 관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="Inventory_View">재고 조회</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="#">재고 입력</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="#">재고 이동</a></li>
                        </ul>
                    </li>
                    <li>
 



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
                            <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/resources/images/login.png" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu login" >
                        	<c:choose>
                        	<%-- 로그인 상태일 경우 아이디 표시, 마이페이지, Logout 링크 표시 --%>
							<%-- EL 을 사용하여 세션 객체 접근 시 sessionScope.속성명 으로 접근 --%>
							<c:when test="${not empty sessionScope.sId }">
                            	<a class="nav-link" href="./Mypage"><i class="fa fa-user"></i>${sessionScope.sId } 님</a>
                            	<a class="nav-link" href="./Mypage"><i class="fa fa-bell-o"></i>MYPAGE <span class="count">13</span></a>
<!-- 	                           	<a class="nav-link" href="#"><i class="fa fa-cog"></i>Settings</a> -->
	                            <a class="nav-link" href="javascript:logout()"><i class="fa fa-power-off"></i>Logout</a>
                        	</c:when>
                        		<c:otherwise>
                        	<%-- 로그인 상태가 아닐 경우 Login, Join 링크 표시 --%>
                        			<a class="nav-link" href="./Login"><i class="fa fa-user"></i>LOGIN</a>
<!--                         			<a class="nav-link" href="#"><i class="fa fa-cog"></i>Settings</a> -->
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </header><!-- /header -->
        <!-- Header-->



<!-- Right Panel -->

<!-- <!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
