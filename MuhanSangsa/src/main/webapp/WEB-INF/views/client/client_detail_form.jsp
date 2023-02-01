<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MuhanSangsa - Client Detail Form</title>
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

</head>
<body>
	<jsp:include page="../inc/left.jsp"></jsp:include>

        <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner" >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left  ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>거래처 조회</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 ">
                        <div class="page-header float-right">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">기본 등록</a></li>
                                    <li><a href="ClientList">거래처 등록</a></li>
                                    <li class="active">거래처 등록</li>
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

                    <div class="col-lg-10">
                        <div class="card">
                            <div class="card-header">
                                <strong>거래처 등록</strong>
                            </div>
                            <div class="card-body card-block">
                                <form action="ClientInsertPro" method="post" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="business_no" class=" form-control-label">거래처 코드<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="business_no" name="business_no" value="${client.business_no }" class="form-control" required="required"><small class="form-text text-muted" id="check_bn">'-' 를 제외한 숫자만 입력</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="cust_name" class=" form-control-label">상호 (거래처명)<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="cust_name" name="cust_name" value="${client.cust_name }" class="form-control" required="required"><small class="form-text text-muted"></small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">거래처 구분<font style="color: red;">*</font></label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="g_gubun" class="form-check-label ">
                                                    <input type="radio" id="" name="g_gubun" value="01" class="form-check-input" <c:if test="${client.g_gubun eq '01' }">checked</c:if>>사업자 (국내)
                                                    <input type="radio" id="" name="g_gubun" value="02" class="form-check-input" <c:if test="${client.g_gubun eq '02' }">checked</c:if>>사업자 (해외)
                                                    <input type="radio" id="" name="g_gubun" value="03" class="form-check-input" <c:if test="${client.g_gubun eq '03' }">checked</c:if>>비사업자 (국내)
                                                    <input type="radio" id="" name="g_gubun" value="04" class="form-check-input" <c:if test="${client.g_gubun eq '04' }">checked</c:if>>비사업자 (해외)
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
                                                <option value="농업 · 임업 및 어업" <c:if test="${client.uptae eq '농업, 임업 및 어업' }">selected</c:if>>농업, 임업 및 어업</option>
                                                <option value="광업" <c:if test="${client.uptae eq '광업' }">selected</c:if>>광업</option>
                                                <option value="제조업" <c:if test="${client.uptae eq '제조업' }">selected</c:if>>제조업</option>
                                                <option value="전기 · 가스, 증기 및 공기조절 공급업" <c:if test="${client.uptae eq '전기, 가스, 증기 및 공기조절 공급업' }">selected</c:if>>전기, 가스, 증기 및 공기조절 공급업</option>
                                                <option value="수도 · 하수 및 폐기물 처리, 원료 재생업" <c:if test="${client.uptae eq '수도, 하수 및 폐기물 처리, 원료 재생업' }">selected</c:if>>수도, 하수 및 폐기물 처리, 원료 재생업</option>
                                                <option value="건설업" <c:if test="${client.uptae eq '건설업' }">selected</c:if>>건설업</option>
                                                <option value="도매 및 소매업" <c:if test="${client.uptae eq '도매 및 소매업' }">selected</c:if>>도매 및 소매업</option>
                                                <option value="운수 및 창고업" <c:if test="${client.uptae eq '운수 및 창고업' }">selected</c:if>>운수 및 창고업</option>
                                                <option value="숙박 및 음식점업" <c:if test="${client.uptae eq '숙박 및 음식점업' }">selected</c:if>>숙박 및 음식점업</option>
                                                <option value="정보통신업" <c:if test="${client.uptae eq '정보통신업' }">selected</c:if>>정보통신업</option>
                                                <option value="금융 및 보험업" <c:if test="${client.uptae eq '금융 및 보험업' }">selected</c:if>>금융 및 보험업</option>
                                                <option value="부동산업" <c:if test="${client.uptae eq '부동산업' }">selected</c:if>>부동산업</option>
                                                <option value="전문 · 과학 및 기술 서비스업" <c:if test="${client.uptae eq '전문, 과학 및 기술 서비스업' }">selected</c:if>>전문, 과학 및 기술 서비스업</option>
                                                <option value="사업시설 관리 · 사업지원 및 임대 서비스업" <c:if test="${client.uptae eq '사업시설 관리, 사업지원 및 임대 서비스업' }">selected</c:if>>사업시설 관리, 사업지원 및 임대 서비스업</option>
                                                <option value="공공 행정 · 국방 및 사회보장 행정" <c:if test="${client.uptae eq '공공 행정, 국방 및 사회보장 행정' }">selected</c:if>>공공 행정, 국방 및 사회보장 행정</option>
                                                <option value="교육서비스업" <c:if test="${client.uptae eq '교육서비스업' }">selected</c:if>>교육서비스업</option>
                                                <option value="보건업 및 사회복지 서비스업" <c:if test="${client.uptae eq '보건업 및 사회복지 서비스업' }">selected</c:if>>보건업 및 사회복지 서비스업</option>
                                                <option value="예술 · 스포츠 및 여가관련 서비스업" <c:if test="${client.uptae eq '예술, 스포츠 및 여가관련 서비스업' }">selected</c:if>>예술, 스포츠 및 여가관련 서비스업</option>
                                                <option value="협회 및 단체 · 수리 및 기타 개인 서비스업" <c:if test="${client.uptae eq '협회 및 단체, 수리 및 기타 개인 서비스업' }">selected</c:if>>협회 및 단체, 수리 및 기타 개인 서비스업</option>
                                                <option value="가구 내 고용활동 및 달리 분류되지 않은 자가소비 생산활동" <c:if test="${client.uptae eq '가구 내 고용활동 및 달리 분류되지 않은 자가소비 생산활동' }">selected</c:if>>가구 내 고용활동 및 달리 분류되지 않은 자가소비 생산활동</option>
                                                <option value="국제 및 외국기관" <c:if test="${client.uptae eq '국제 및 외국기관' }">selected</c:if>>국제 및 외국기관</option>
                                                <option value="기타" <c:if test="${client.uptae eq '기타' }">selected</c:if>>기타</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="jongmok" class=" form-control-label">종목<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9">
                                        	<div id="jongmokArea">
                                        	<input type="text" id="jongmok" name="jongmok" value="${client.jongmok }" class="form-control" required="required">
                                        	</div>
                                        	<small class="form-text text-muted text-right" id="add">+ 종목 추가</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="tel" class=" form-control-label">대표전화<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="tel" id="tel" name="tel" value="${client.tel }" class="form-control" required="required">
                                        	<small class="form-text text-muted">'-' 를 제외한 숫자만 입력</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email" class=" form-control-label">이메일</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="email" name="email" value="${client.email }" class="form-control"><small class="help-block form-text">Please enter your email</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="mobile_no" class=" form-control-label">모바일</label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="tel" id="mobile_no" name="mobile_no" value="${client.mobile_no }" class="form-control">
                                        	<small class="form-text text-muted">'-' 를 제외한 숫자만 입력</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="fax" class=" form-control-label">Fax</label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="tel" id="fax" name="fax" value="${client.fax }" class="form-control">
                                        	<small class="form-text text-muted">'-' 를 제외한 숫자만 입력</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
										<div class="col col-md-3">
											<label for="post_no" class="form-control-label font-weight-bold">주소<font color="red">*</font></label>
										</div>
										<div class="col-12 col-md-6 d-flex">
											<input type="text" id="post_no" name="post_no" value="${client.post_no }" class="form-control bg-gradient-light" required="required">
											<input type="button" class=" mx-1 btn btn-outline-secondary" value="우편번호" onclick="kakaoAddr()">
										</div>
									</div>
									<div class="row form-group">
										<div class="col col-md-3"></div>
										<div class="col-12 col-md-9">
											<input type="text" id="addr" name="addr" value="${client.addr }" class="form-control bg-gradient-light" required="required">
											<small class="form-text text-muted">도로명주소</small>
										</div>
									</div>
									<div class="row form-group">
										<div class="col col-md-3">
										</div>
										<div class="col-12 col-md-9">
											<input type="text" id="detailedAddr" name="detailedAddr" value="${client.detailedAddr }" class="form-control bg-gradient-light">
											<small class="form-text text-muted">상세주소</small>
										</div>
									</div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="url_path" class=" form-control-label">홈페이지</label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="url" id="url_path" name="url_path" value="${client.url_path }" class="form-control">
                                        	<small class="form-text text-muted"></small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="man_name" class=" form-control-label">담당자<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="man_name" name="man_name" value="${client.man_name }" class="form-control" required="required"><small class="form-text text-muted"></small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="man_tel" class=" form-control-label">담당자 전화번호<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="tel" id="man_tel" name="man_tel" value="${client.man_tel }" class="form-control" required="required">
                                        	<small class="form-text text-muted">'-' 를 제외한 숫자만 입력</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="man_email" class=" form-control-label">담당자 이메일</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="man_email" name="man_email" value="${client.man_email }" class="form-control"><small class="help-block form-text">Please enter your email</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="remarks" class=" form-control-label">적요(비고)</label></div>
                                        <div class="col-12 col-md-9"><textarea name="remarks" id="remarks" rows="9" class="form-control">${client.remarks }</textarea></div>
                                    </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i> 수정하기
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                                <button type="button" class="btn btn-danger btn-sm" onclick="">
                                    <i class="fa fa-ban"></i> 닫기
                                </button>
                            </div>
                        </div>

           			 </div>
          		  </div>


       		 </div><!-- .animated -->
    	</div><!-- .content -->
        
        
        <!-- ----------------------------------------------------------- -->

        <div class="content">
            <div class="animated fadeIn">


                <div class="row">

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>Basic Form</strong> Elements
                            </div>
                            <div class="card-body card-block">
                                <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Static</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">Username</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">Text Input</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="Text" class="form-control"><small class="form-text text-muted">This is a help text</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">Email Input</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="email-input" name="email-input" placeholder="Enter Email" class="form-control"><small class="help-block form-text">Please enter your email</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="password-input" class=" form-control-label">Password</label></div>
                                        <div class="col-12 col-md-9"><input type="password" id="password-input" name="password-input" placeholder="Password" class="form-control"><small class="help-block form-text">Please enter a complex password</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">Disabled Input</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="disabled-input" name="disabled-input" placeholder="Disabled" disabled="" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">Textarea</label></div>
                                        <div class="col-12 col-md-9"><textarea name="textarea-input" id="textarea-input" rows="9" placeholder="Content..." class="form-control"></textarea></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="select" class=" form-control-label">Select</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="select" id="select" class="form-control">
                                                <option value="0">Please select</option>
                                                <option value="1">Option #1</option>
                                                <option value="2">Option #2</option>
                                                <option value="3">Option #3</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="selectLg" class=" form-control-label">Select Large</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="selectLg" id="selectLg" class="form-control-lg form-control">
                                                <option value="0">Please select</option>
                                                <option value="1">Option #1</option>
                                                <option value="2">Option #2</option>
                                                <option value="3">Option #3</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="selectSm" class=" form-control-label">Select Small</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="selectSm" id="selectSm" class="form-control-sm form-control">
                                                <option value="0">Please select</option>
                                                <option value="1">Option #1</option>
                                                <option value="2">Option #2</option>
                                                <option value="3">Option #3</option>
                                                <option value="4">Option #4</option>
                                                <option value="5">Option #5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="disabledSelect" class=" form-control-label">Disabled Select</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="disabledSelect" id="disabledSelect" disabled="" class="form-control">
                                                <option value="0">Please select</option>
                                                <option value="1">Option #1</option>
                                                <option value="2">Option #2</option>
                                                <option value="3">Option #3</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="multiple-select" class=" form-control-label">Multiple select</label></div>
                                        <div class="col col-md-9">
                                            <select name="multiple-select" id="multiple-select" multiple="" class="form-control">
                                                <option value="1">Option #1</option>
                                                <option value="2">Option #2</option>
                                                <option value="3">Option #3</option>
                                                <option value="4">Option #4</option>
                                                <option value="5">Option #5</option>
                                                <option value="6">Option #6</option>
                                                <option value="7">Option #7</option>
                                                <option value="8">Option #8</option>
                                                <option value="9">Option #9</option>
                                                <option value="10">Option #10</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Radios</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="radio">
                                                    <label for="radio1" class="form-check-label ">
                                                        <input type="radio" id="radio1" name="radios" value="option1" class="form-check-input">Option 1
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radio2" class="form-check-label ">
                                                        <input type="radio" id="radio2" name="radios" value="option2" class="form-check-input">Option 2
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radio3" class="form-check-label ">
                                                        <input type="radio" id="radio3" name="radios" value="option3" class="form-check-input">Option 3
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Inline Radios</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="inline-radio1" name="inline-radios" value="option1" class="form-check-input">One
                                                </label>
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="inline-radios" value="option2" class="form-check-input">Two
                                                </label>
                                                <label for="inline-radio3" class="form-check-label ">
                                                    <input type="radio" id="inline-radio3" name="inline-radios" value="option3" class="form-check-input">Three
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Checkboxes</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="checkbox">
                                                    <label for="checkbox1" class="form-check-label ">
                                                        <input type="checkbox" id="checkbox1" name="checkbox1" value="option1" class="form-check-input">Option 1
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label for="checkbox2" class="form-check-label ">
                                                        <input type="checkbox" id="checkbox2" name="checkbox2" value="option2" class="form-check-input"> Option 2
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label for="checkbox3" class="form-check-label ">
                                                        <input type="checkbox" id="checkbox3" name="checkbox3" value="option3" class="form-check-input"> Option 3
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Inline Checkboxes</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="inline-checkbox1" class="form-check-label ">
                                                    <input type="checkbox" id="inline-checkbox1" name="inline-checkbox1" value="option1" class="form-check-input">One
                                                </label>
                                                <label for="inline-checkbox2" class="form-check-label ">
                                                    <input type="checkbox" id="inline-checkbox2" name="inline-checkbox2" value="option2" class="form-check-input">Two
                                                </label>
                                                <label for="inline-checkbox3" class="form-check-label ">
                                                    <input type="checkbox" id="inline-checkbox3" name="inline-checkbox3" value="option3" class="form-check-input">Three
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">File input</label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-input" name="file-input" class="form-control-file"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-multiple-input" class=" form-control-label">Multiple File input</label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-multiple-input" name="file-multiple-input" multiple="" class="form-control-file"></div>
                                    </div>
                                </form>
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
<script src="assets/js/main.js"></script>


</body>
</html>