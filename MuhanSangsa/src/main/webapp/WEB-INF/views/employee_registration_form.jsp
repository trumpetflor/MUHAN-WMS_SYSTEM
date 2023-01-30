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

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
	<style type="text/css">
	
	.col-lg-6{
		margin: auto;
		max-width: 60%;
		flex: 100 100;
	}
	
	@font-face {
    font-family: 'EliceDigitalBaeum-Bd';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_elice@1.0/EliceDigitalBaeum-Bd.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}
	
	*{
	font-family: 'EliceDigitalBaeum-Bd';
	 font-weight: normal;
    font-style: normal;
	}
	</style>
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
                    <li class="menu-title">UI elements</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>Components</a>
                        <ul class="sub-menu children dropdown-menu">                            <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Buttons</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Badges</a></li>
                            <li><i class="fa fa-bars"></i><a href="ui-tabs.html">Tabs</a></li>

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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Tables</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="tables-basic.html">Basic Table</a></li>
                            <li><i class="fa fa-table"></i><a href="tables-data.html">Data Table</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children active dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Forms</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-basic.html">Basic Form</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">Advanced Form</a></li>
                        </ul>
                    </li>

                    <li class="menu-title">Icons</li><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Icons</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="font-fontawesome.html">Font Awesome</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">Themefy Icons</a></li>
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
                    <a class="navbar-brand" href="./"><img src="images/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
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
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/1.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Jonathan Smith</span>
                                        <span class="time float-right">Just now</span>
                                        <p>Hello, this is an example msg</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/2.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Jack Sanders</span>
                                        <span class="time float-right">5 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/3.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Cheryl Wheeler</span>
                                        <span class="time float-right">10 minutes ago</span>
                                        <p>Hello, this is an example msg</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/4.jpg"></span>
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
                            <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
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

		<!-- 사원 등록 form  -->
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>사원 등록</strong> Form
                            </div>
                            <div class="card-body card-block">
                                <form action="employeeRegisterPro" method="post" enctype="multipart/form-data" class="form-horizontal">
                                		<!-- 고정 요소 (사원번호, 인덱스 번호 등 필요 시 사용 가능) -->
<!--                                     <div class="row form-group"> -->
<!--                                         <div class="col col-md-3"><label class=" form-control-label">Static</label></div> -->
<!--                                         <div class="col-12 col-md-9"> -->
<!--                                             <p class="form-control-static">Username</p> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="name" class=" form-control-label">사원명</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="name" name="emp_Name" placeholder="사원명을 입력하세요" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="department" class=" form-control-label">부서코드</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="dept_Cd" id="department" class="form-control">
                                                <option value="0">부서명을 선택하세요</option>
                                                <option value="인사팀">인사팀</option>
                                                <option value="개발팀">개발팀</option>
                                                <option value="물류관리팀">물류관리팀</option>
                                                <option value="영업팀">영업팀</option>
                                            </select>
                                        </div>
                                    </div>
                                     <div class="row form-group">
                                        <div class="col col-md-3"><label for="position" class=" form-control-label">직급코드</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="grade_Cd" id="position" class="form-control">
                                                <option value="0">직급을 선택하세요</option>
                                                <option value="사원">사원</option>
                                                <option value="대리">대리</option>
                                                <option value="부장">부장</option>
                                                <option value="대표">대표</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="mobile" class=" form-control-label">연락처(개인)</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="mobile" name="emp_Tel" placeholder="ex) 010-1234-5678" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="dTel" class=" form-control-label">연락처(사무실)</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="" name="emp_Dtel" placeholder="ex) 051-123-4567" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email" class=" form-control-label">Email</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="email" name="emp_Email" placeholder="이메일을 입력하세요" class="form-control" >
                                        <small class="help-block form-text">사원의 이메일은 무한상사 관리시스템 아이디로 사용됩니다</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="password" class=" form-control-label">Password</label></div>
                                        <div class="col-12 col-md-9"><input type="password" id="password" name="emp_Passwd" placeholder="비밀번호를 입력하세요" class="form-control"><small class="help-block form-text">Please enter a complex password</small></div>
                                    </div>
                                    <!-- 주소 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="postCode" class=" form-control-label">우편번호</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="postCode" name="emp_Post_No" placeholder="우편번호를 입력하세요" class="form-control"><input type="button" value="주소 검색" onclick="kakaoAddr()" ></div>
                                    </div>
                               		 <div class="row form-group">
                                        <div class="col col-md-3"><label for="address1" class=" form-control-label">주소</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="address1" name="emp_Addr" placeholder="주소를 입력하세요" class="form-control"></div>
                                    </div>
                                     <div class="row form-group">
                                        <div class="col col-md-3"><label for="address2" class=" form-control-label">상세주소</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="address2" name="emp_Addr" placeholder="상세주소를 입력하세요" class="form-control"></div>
                                    </div>
	                                 <!-- 주소 -->
	                                 <!-- 입사일 -->
	                                  <div class="row form-group">
                                        <div class="col col-md-3"><label for="hireDate" class=" form-control-label">입사일</label></div>
                                        <div class="col-12 col-md-9"><input type="date" id="hireDate" name="hire_Date" class="form-control"></div>
                                     </div>
                                     <!-- 입사일 -->
	                                 <!-- 재직여부 -->
	                                  <div class="row form-group">
                                        <div class="col col-md-3"><label for="workCd" class=" form-control-label">재직여부</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="work_Cd" id="workCd" class="form-control">
                                                <option value="0">재직여부를 선택하세요</option>
                                                <option value="재직">재직</option>
                                                <option value="휴직">휴직</option>
                                                <option value="퇴사">퇴사</option>
                                            </select>
                                        </div>
                                    </div>
                                     <!-- 재직여부 -->
                                     <!-- 권한 -->
                                     <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">권한설정</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="level1" class="form-check-label ">
                                                    <input type="checkbox" id="level1" name="priv_Cd" value="10000" class="form-check-input">기본등록&nbsp;&nbsp;
                                                </label>
                                                <label for="level2" class="form-check-label ">
                                                    <input type="checkbox" id="level2" name="priv_Cd" value="1000" class="form-check-input" >사원조회&nbsp;&nbsp;
                                                </label>
                                                <label for="level2" class="form-check-label ">
                                                    <input type="checkbox" id="level3" name="priv_Cd" value="100" class="form-check-input" >사원관리&nbsp;&nbsp;
                                                </label>
                                                <label for="level3" class="form-check-label ">
                                                    <input type="checkbox" id="level4" name="priv_Cd" value="10" class="form-check-input">재고조회&nbsp;&nbsp;
                                                </label>
                                                <label for="level4" class="form-check-label ">
                                                    <input type="checkbox" id="level5" name="priv_Cd" value="1" class="form-check-input">재고관리&nbsp;&nbsp;
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 권한 -->
                                    <!-- 사진 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">사진</label></div>
                                        <div class="col-12 col-md-9"><input type="file" name="file" class="form-control-file"></div>
                                    </div>
                                    <!-- 사진 -->
                                    <!-- 제출 & 리셋 푸터 -->
	                                <hr>
	                            	<div align="right" >
	                                <button type="submit" class="btn btn-primary btn-sm">
	                                    <i class="fa fa-dot-circle-o"></i> Submit
	                                </button>
	                                <button type="reset" class="btn btn-danger btn-sm">
	                                    <i class="fa fa-ban"></i> Reset
	                                </button>
									</div>
									<!-- 제출 & 리셋 푸터 -->
                                </form>
                            </div>
                        </div> <!-- card -->
                    </div> <!-- col-lg-6 -->

            </div> <!-- row -->
        </div><!-- .animated -->
    </div><!-- .content -->

    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright &copy; 2023 
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
<script src="assets/js/main.js"></script>
<%-- 카카오 주소 API 적용하기 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function kakaoAddr() { // onclick 시 작동할 함수 선언
		new daum.Postcode({
			oncomplete: function(data) {
				var roadAddr = data.roadAddress;
				// 회원이 검색해서 찾은 주소 클릭 시 폼에 뿌리기
				document.getElementById("postCode").value = data.zonecode;
				document.getElementById("address1").value = data.roadAddress;
			}
		}).open();
	}
</script>

</body>
</html>