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
    <title>MuhanSangsa - Client Insert Form</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

<style>
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

</style>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function() {
		
		// 거래처 코드 중복 확인 - 아직 미완성
		$("#business_no").on("focusout", function(){
			alert("거래처 코드 중복 확인");
			let business_no = $("#business_no").val();
			let regex = /^[0-9]{10, 30}$/; // 10 ~ 30 자리의 숫자
			
			if(!regex.exec(business_no)) {
				
			} else {
				$.ajax({
					url: "DuplicateBusinessNo",
					data: {
						business_no : $("#business_no").val()
					},
					success: function(result) {
						
					}
					
				});
			}
		});
		
		// 종목 입력창 추가
		$("#add").on("click", function(){
			$("#jongmokArea").append('<input type="text" id="jongmok1" name="jongmok" placeholder="ex) 동물용 사료 및 조제식품 제조업" class="form-control">');
		});
	
	});

</script>

<!-- 카카오 주소 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
   function kakaoAddr() { // onclick 시 작동할 함수 선언
      new daum.Postcode({
         oncomplete: function(data) {
            var roadAddr = data.roadAddress;
            // 주소 클릭 시 폼에 뿌리기
            $("#post_no").val(data.zonecode); // 우편번호
            $("#addr").val(data.roadAddress).prop("readonly", true); // 도로명주소
         }
      }).open();
   }
</script>

</head>
<body>
    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
                    </li>
                    <li class="menu-title">인사</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>사원 등록</a>
                        <ul class="sub-menu children dropdown-menu">                            <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">a</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">b</a></li>
                            <li><i class="fa fa-bars"></i><a href="ui-tabs.html">c</a></li>

                            <li><i class="fa fa-id-card-o"></i><a href="ui-cards.html">Cards</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="ui-alerts.html">Alerts</a></li>
                            <li><i class="fa fa-spinner"></i><a href="ui-progressbar.html">Progress Bars</a></li>
                            <li><i class="fa fa-fire"></i><a href="ui-modals.html">Modals</a></li>
                            <li><i class="fa fa-book"></i><a href="ui-switches.html">Switches</a></li>
                            <li><i class="fa fa-th"></i><a href="ui-grids.html">Grids</a></li>
                            <li><i class="fa fa-file-word-o"></i><a href="ui-typgraphy.html">Typography</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>사원 조회</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="tables-basic.html">Basic Table</a></li>
                            <li><i class="fa fa-table"></i><a href="tables-data.html">Data Table</a></li>
                        </ul>
                    </li>

                    <li class="menu-title">재고 관리</li><!-- /.menu-title -->

                    <li class="menu-item-has-children active dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>기본 등록</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome active dropdown-toggle" id="client" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i><a href="ClientList">거래처 등록</a>
                            	<span class="dropdown-menu grandchildren" aria-labelledby="client">
	                                <a class="dropdown-item media" href="ClientList">
	                                    <i class="fa fa-check"></i>
	                                    <p>거래처 조회</p>
	                                </a>
	                                <a class="dropdown-item media" href="ClientInsertForm">
	                                    <i class="fa fa-info"></i>
	                                    <p>거래처 등록</p>
	                                </a>
                            	</span>
                            </li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">창고 등록</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">품목 등록</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="widgets.html"> <i class="menu-icon ti-email"></i>Widgets </a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="charts-chartjs.html">Chart JS</a></li>
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="charts-flot.html">Flot Chart</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="charts-peity.html">Peity Chart</a></li>
                        </ul>
                    </li>

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>Maps</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="maps-gmap.html">Google Maps</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="maps-vector.html">Vector Maps</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">Extras</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li>
                        </ul>
                    </li>
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
                    <a class="navbar-brand" href="./"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="${pageContext.request.contextPath}/resources/images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                        <button class="search-trigger"><i class="fa fa-search"></i></button>
                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                            </form>
                        </div>

                        <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">3</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">You have 3 Notification</p>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-check"></i>
                                    <p>Server #1 overloaded.</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-info"></i>
                                    <p>Server #2 overloaded.</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-warning"></i>
                                    <p>Server #3 overloaded.</p>
                                </a>
                            </div>
                        </div>

                        <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-envelope"></i>
                                <span class="count bg-primary">4</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="message">
                                <p class="red">You have 4 Mails</p>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="${pageContext.request.contextPath}/resources/images/avatar/1.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Jonathan Smith</span>
                                        <span class="time float-right">Just now</span>
                                        <p>Hello, this is an example msg</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="${pageContext.request.contextPath}/resources/images/avatar/2.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Jack Sanders</span>
                                        <span class="time float-right">5 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="${pageContext.request.contextPath}/resources/images/avatar/3.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Cheryl Wheeler</span>
                                        <span class="time float-right">10 minutes ago</span>
                                        <p>Hello, this is an example msg</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="${pageContext.request.contextPath}/resources/images/avatar/4.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Rachel Santos</span>
                                        <span class="time float-right">15 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/resources/images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa-user"></i>My Profile</a>

                            <a class="nav-link" href="#"><i class="fa fa-bell-o"></i>Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa-cog"></i>Settings</a>

                            <a class="nav-link" href="#"><i class="fa fa-power-off"></i>Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </header><!-- /header -->
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>거래처 등록</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">기본 등록</a></li>
                                    <li><a href="ClientInsertForm">거래처 등록</a></li>
                                    <li class="active">거래처 등록</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">


                <div class="row">

                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>거래처 등록</strong> Elements
                            </div>
                            <div class="card-body card-block">
                                <form action="ClientInsertPro" method="post" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="business_no" class=" form-control-label">거래처 코드<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="business_no" name="business_no" placeholder="ex) 0123456789" class="form-control" required="required"><small class="form-text text-muted">'-' 를 제외한 숫자만 입력</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="cust_name" class=" form-control-label">상호 (거래처명)<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="cust_name" name="cust_name" placeholder="ex) 댕댕잇" class="form-control" required="required"><small class="form-text text-muted"></small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">거래처 구분<font style="color: red;">*</font></label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="g_gubun" class="form-check-label ">
                                                    <input type="radio" id="" name="g_gubun" value="01" class="form-check-input" checked="checked">사업자 (국내)
                                                    <input type="radio" id="" name="g_gubun" value="02" class="form-check-input">사업자 (해외)
                                                    <input type="radio" id="" name="g_gubun" value="03" class="form-check-input">비사업자 (국내)
                                                    <input type="radio" id="" name="g_gubun" value="04" class="form-check-input">비사업자 (해외)
                                                </label>
                                            </div>
                                          <small class="help-block form-text text-muted">미선택시 사업자(국내)로 구분</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="boss_name" class=" form-control-label">대표자명<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="boss_name" name="boss_name" placeholder="ex) 김댕댕" class="form-control" required="required"><small class="form-text text-muted"></small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="uptae" class=" form-control-label">업태<font style="color: red;">*</font></label></div>
                                        <div class="col col-md-9">
                                            <select name="uptae" id="uptae" data-placeholder="복수 선택 가능" multiple class="standardSelect" required="required">
                                                <option value="농업, 임업 및 어업">농업, 임업 및 어업</option>
                                                <option value="광업">광업</option>
                                                <option value="제조업">제조업</option>
                                                <option value="전기, 가스, 증기 및 공기조절 공급업">전기, 가스, 증기 및 공기조절 공급업</option>
                                                <option value="수도, 하수 및 폐기물 처리, 원료 재생업">수도, 하수 및 폐기물 처리, 원료 재생업</option>
                                                <option value="건설업">건설업</option>
                                                <option value="도매 및 소매업">도매 및 소매업</option>
                                                <option value="운수 및 창고업">운수 및 창고업</option>
                                                <option value="숙박 및 음식점업">숙박 및 음식점업</option>
                                                <option value="정보통신업">정보통신업</option>
                                                <option value="금융 및 보험업">금융 및 보험업</option>
                                                <option value="부동산업">부동산업</option>
                                                <option value="전문, 과학 및 기술 서비스업">전문, 과학 및 기술 서비스업</option>
                                                <option value="사업시설 관리, 사업지원 및 임대 서비스업">사업시설 관리, 사업지원 및 임대 서비스업</option>
                                                <option value="공공 행정, 국방 및 사회보장 행정">공공 행정, 국방 및 사회보장 행정</option>
                                                <option value="교육서비스업">교육서비스업</option>
                                                <option value="보건업 및 사회복지 서비스업">보건업 및 사회복지 서비스업</option>
                                                <option value="예술, 스포츠 및 여가관련 서비스업">예술, 스포츠 및 여가관련 서비스업</option>
                                                <option value="협회 및 단체, 수리 및 기타 개인 서비스업">협회 및 단체, 수리 및 기타 개인 서비스업</option>
                                                <option value="가구 내 고용활동 및 달리 분류되지 않은 자가소비 생산활동">가구 내 고용활동 및 달리 분류되지 않은 자가소비 생산활동</option>
                                                <option value="국제 및 외국기관">국제 및 외국기관</option>
                                                <option value="기타">기타</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="jongmok" class=" form-control-label">종목<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9">
                                        	<div id="jongmokArea">
                                        	<input type="text" id="jongmok" name="jongmok" placeholder="ex) 동물용 사료 및 조제식품 제조업" class="form-control" required="required">
                                        	</div>
                                        	<small class="form-text text-muted" id="add">+ 항목 추가</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="tel" class=" form-control-label">대표전화<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="tel" id="tel" name="tel" placeholder="" class="form-control" required="required">
                                        	<small class="form-text text-muted">'-' 를 제외한 숫자만 입력</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email" class=" form-control-label">이메일</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="email" name="email" placeholder="Enter Email" class="form-control"><small class="help-block form-text">Please enter your email</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="mobile_no" class=" form-control-label">모바일</label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="tel" id="mobile_no" name="mobile_no" placeholder="01012345678" class="form-control">
                                        	<small class="form-text text-muted">'-' 를 제외한 숫자만 입력</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="fax" class=" form-control-label">Fax</label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="tel" id="fax" name="fax" placeholder="" class="form-control">
                                        	<small class="form-text text-muted">'-' 를 제외한 숫자만 입력</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
										<div class="col col-md-3">
											<label for="post_no" class="form-control-label font-weight-bold">주소<font color="red">*</font></label>
										</div>
										<div class="col-12 col-md-4 d-flex">
											<input type="text" id="post_no" name="post_no" placeholder="ex) 00000" class="form-control bg-gradient-light" required="required">
											<input type="button" class=" mx-1 btn btn-outline-secondary" value="우편번호" onclick="kakaoAddr()">
										</div>
									</div>
									<div class="row form-group">
										<div class="col col-md-3"></div>
										<div class="col-12 col-md-8">
											<input type="text" id="addr" name="addr" placeholder="ex) 부산진구 동천로 1" class="form-control bg-gradient-light" required="required">
											<small class="form-text text-muted">도로명주소</small>
										</div>
									</div>
									<div class="row form-group">
										<div class="col col-md-3">
										</div>
										<div class="col-12 col-md-8">
											<input type="text" id="detailedAddr" name="detailedAddr" placeholder="" class="form-control bg-gradient-light">
											<small class="form-text text-muted">상세주소</small>
										</div>
									</div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="url_path" class=" form-control-label">홈페이지</label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="url" id="url_path" name="url_path" placeholder="ex) http://www.itwillbs.co.kr/" class="form-control">
                                        	<small class="form-text text-muted"></small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="man_name" class=" form-control-label">담당자<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="man_name" name="man_name" placeholder="ex) 김무한" class="form-control" required="required"><small class="form-text text-muted"></small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="man_tel" class=" form-control-label">담당자 전화번호<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="tel" id="man_tel" name="man_tel" placeholder="" class="form-control" required="required">
                                        	<small class="form-text text-muted">'-' 를 제외한 숫자만 입력</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="man_email" class=" form-control-label">담당자 이메일</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="man_email" name="man_email" placeholder="Enter Email" class="form-control"><small class="help-block form-text">Please enter your email</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="remarks" class=" form-control-label">적요(비고)</label></div>
                                        <div class="col-12 col-md-9"><textarea name="remarks" id="remarks" rows="9" placeholder="기타 입력 사항" class="form-control"></textarea></div>
                                    </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                            </div>
                        </div>

           			 </div>
          		  </div>


       		 </div><!-- .animated -->
    	</div><!-- .content -->

    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright &copy; 2018 Ela Admin
                </div>
                <div class="col-sm-6 text-right">
                    Designed by <a href="https://colorlib.com">Colorlib</a>
                </div>
            </div>
        </div>
    </footer>

</div><!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>

<script>
    jQuery(document).ready(function() {
        jQuery(".standardSelect").chosen({
            disable_search_threshold: 10,
            no_results_text: "Oops, nothing found!",
            width: "100%"
        });
    });
</script>

</body>
</html>