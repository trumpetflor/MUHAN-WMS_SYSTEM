<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>사원 상세 정보</title>
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
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">

//라디오 버튼 변경 비활성화
	$(function() {
		$("input:radio[name=inline-radios]").prop('disabled', 'disabled');
		
	});

</script>
</head>
<style>
	@font-face {
	    font-family: 'NEXON Lv1 Gothic OTF';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}

	body {
	 font-family: 'NEXON Lv1 Gothic OTF';
	}

	p {
	 font-family: 'NEXON Lv1 Gothic OTF';
	}

</style>
<body>

    <!-- Right Panel -->

    <div id="" class="">

        <!-- Header-->
 
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                              <!--   <h1>사원 상세 페이지</h1> -->
                            </div>
                        </div>
                    </div>
<!--                     <div class="col-sm-8"> -->
<!--                         <div class="page-header float-right"> -->
<!--                             <div class="page-title"> -->
<!--                                 <ol class="breadcrumb text-right"> -->
<!--                                     <li><a href="#">Dashboard</a></li> -->
<!--                                     <li><a href="#">Forms</a></li> -->
<!--                                     <li class="active">Basic</li> -->
<!--                                 </ol> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>사원 상세 정보</strong> 
                            </div>
                            <div class="card-body card-block">
                                <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                 <!-- 사진 이미지 -->
                                 <div class="row form-group">   
                                 	<div class="col col-md-3"><label class=" form-control-label" style="margin-top: 80px;">사진 이미지</label></div>
                                  		<div class=" col-12 col-md-4" id="imgWapper">
											<img id="id_photo" alt="증명사진" style="width: 150px"
											src="<%=request.getScheme()+"://"+request.getServerName() + ":" + request.getServerPort() +"/"+request.getContextPath()%>/resources/upload/${employees.photo }"	
											onerror="this.src='${pageContext.request.contextPath}/resources/images/id_photo01.jpg';" width="150px" />
									</div>
								  </div>
                                    <!-- 사원번호(코드) -->
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">사원번호(코드)</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${employees.emp_num }</p>
                                        </div>
                                    </div>
                                    <!-- 사원번호(코드) -->
                                    <!-- 사원명 -->                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">사원명</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${employees.emp_name }</p>
                                        </div>
                                    </div>
                                    <!-- 부서명 -->                                    
                                     <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">부서명</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${employees.dept_name }</p>
                                        </div>
                                    </div>
                                    <!-- 직급 -->                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">직급</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${employees.grade_name }</p>
                                        </div>
                                    </div>
                                    <!-- 연락처 -->                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">연락처(개인)</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${employees.emp_tel }</p>
                                        </div>
                                    </div>
                                     <!-- 이메일 -->                                   
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">연락처(사무실)</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${employees.emp_dtel }</p>
                                        </div>
                                    </div>    
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">이메일</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${employees.emp_email }</p>
                                        </div>
                                    </div>      
                                    <!-- 우편번호  -->
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="text-input" class="form-control-label">주소<font></font></label>
										</div>
										<div class="col-12 col-md-4 d-flex">
											<input type="text" id="postcode" name="emp_postcode"
												value="${employees.emp_post_No }"
												class="form-control bg-gradient-light" readonly="readonly">
											<input type="button" class=" mx-1 btn btn-outline-secondary"
												value="우편번호" onclick="kakaoAddr()">
										</div>
									</div>
									<!-- 도로명 주소 -->
									<div class="row form-group">
										<div class="col col-md-3"></div>
										<div class="col-12 col-md-8">
											<input type="text" id="addr1" name="emp_addr1"
												value="${employees.emp_addr }"
												class="form-control bg-gradient-light" readonly="readonly">
<!-- 											<small class="form-text text-muted">도로명주소</small> -->
										</div>
									</div>
<!-- 									<div class="row form-group"> -->
<!-- 										<div class="col col-md-3"> -->
<!-- 											<label for="text-input" class=" form-control-label"></label> -->
<!-- 										</div> -->
<!-- 										<div class="col-12 col-md-8"> -->
<!-- 											<input type="text" id="addr2" name="member_addr2" -->
<%-- 												value="${employees.emp_addr }" --%>
<!-- 												class="form-control bg-gradient-light"> <small -->
<!-- 												class="form-text text-muted">상세주소</small> -->
<!-- 										</div> -->
<!-- 									</div> -->
                                   	<!-- 입사일 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">입사일</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${employees.hire_date }</p>
                                        </div>
                                    </div>
                                    <!-- 재직여부 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">재직여부</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="inline-radio1" name="inline-radios" value="1" class="form-check-input" <c:if test="${employees.work_cd eq '1'}">checked</c:if>> 
                                                    재직&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="inline-radios" value="2" class="form-check-input" 
                                                    <c:if test="${employees.work_cd eq '2'}">checked</c:if>> 휴직
                                                	&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="inline-radios" value="3" class="form-check-input" 
                                                    <c:if test="${employees.work_cd eq '3'}">checked</c:if>> 퇴사
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!--사진이미지 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">사진이미지</label></div>
                                        <div class="col-12 col-md-4"><input type="file" id="file-input" name="file-input" class="form-control-file"></div>
                                    </div>
                                    <!--사진이미지 -->
                                </form>
                            </div>
                        </div>
                        <div align="center">
							<input class="btn btn-outline-dark" type="button" value="확인" onclick="top.window.close()">&nbsp;&nbsp;
						</div>
                    </div>
            </div>

        </div><!-- .animated -->
    </div><!-- .content -->

</div><!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


</body>
</html>