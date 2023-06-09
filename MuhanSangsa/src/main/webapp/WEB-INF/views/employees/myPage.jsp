<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>마이페이지</title>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<script type="text/javascript">

	//상품 수정 클릭 시 확인창
	function confirm_modify() {
		let result = confirm("상품을 수정하시겠습니까?");
		
		if(result){
			const form = document.getElementById('MypageUpdate');
				form.submit();
		}
	
	}

	$(function() {
		
		//등록 성공 시 alert창
		var msg = '${msg}'; //컨트롤러에서 액션이후 msg값이 있을 경우 해당 msg alert창 실행하기 위한 용도
		
		if(msg==1){
			alert('수정이 완료되었습니다.');
			 opener.location.reload();

		}
		
		//라디오 버튼 변경 비활성화
		$("input:radio[name=inline-radios]").prop('disabled', 'disabled');
	});
	
	
	//첨부파일 이미지 미리보기
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('myPagephoto').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('myPagephoto').src = "";
	  }
	}
	
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
	 font-family: 'NEXON Lv1 Gothic OTF' !important;
	}

	.col-lg-10{
		margin: auto;
		max-width: 85%;
		flex: 100 100;
	}

</style>
<body>
<jsp:include page="../inc/left.jsp"></jsp:include>

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>마이페이지</h1>
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
                                <strong>나의 정보</strong> 
                            </div>
                            <div class="card-body card-block">
                                <form action="MypageUpdate" method="post" enctype="multipart/form-data" class="form-horizontal" id="MypageUpdate" style="font-family:NEXON Lv1 Gothic OTF">
                                 <!-- 사진 이미지 -->
                                 <div class="row form-group">   
                                 	<div class="col col-md-3"><label class=" form-control-label" style="margin-top: 80px;">사진 이미지<font style="color: red;">*</font></label></div>
                                  		<div class=" col-12 col-md-9" id="imgWapper">
                                  			<!-- 사진 미리보기  -->
											<img id="myPagephoto" alt="증명사진" style="width:150px;" name="photo" 
											src="${pageContext.request.contextPath}/resources/upload/${employees.photo }"	
											onerror="this.src='${pageContext.request.contextPath}/resources/images/profile.png';" width="150px" />
											<!-- 이미지 파일 첨부  -->
										<div class="col-12 col-md-9 mt-3" style="padding-left: 0;">
											<input type="file" id="file" onchange="readURL(this);" name="file" class="form-control-file">
                                        </div>
									</div>
								  </div>
								  
                                    <!-- 사원번호(코드) -->
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">사원번호(코드)</label></div>
    									<div class="col-12 col-md-9">
											<input type="text" id="emp_num" name="emp_num" value="${employees.emp_num }"
												class="form-control bg-gradient-light" readonly="readonly">
										</div>                                     
                                        
                                    </div>
                                    <!-- 사원번호(코드) -->
                                    <!-- 사원명 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">사원명</label></div>
    									<div class="col-12 col-md-9">
											<input type="text" id="emp_name" name="emp_name" value="${employees.emp_name }"
												class="form-control bg-gradient-light" readonly="readonly">
										</div>                                            
                                    </div>
                                    <!-- 부서명 -->
                                     <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">부서명</label></div>
                                        <div class="col-12 col-md-9">
											<input type="text" id="dept_name" name="dept_name" value="${employees.dept_name }"
												class="form-control bg-gradient-light" readonly="readonly">
										</div>  
                                    </div>
                                    <!-- 직급 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">직급</label></div>
                                        <div class="col-12 col-md-9">
											<input type="text" id="grade_name" name="grade_name" value="${employees.grade_name }"
												class="form-control bg-gradient-light" readonly="readonly">
										</div>
                                    </div>
                                    <!-- 연락처(개인) -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">연락처(개인)<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="text" id="phone_number" name="emp_tel" value="${employees.emp_tel}" 
                                        		placeholder="전화번호를 입력하세요" class="form-control">
                                     	</div>
                                    </div>
                                    <!-- 연락처(사무실) -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">연락처(사무실)<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="office_number" name="emp_dtel" value="${employees.emp_dtel}" placeholder="전화번호를 입력하세요" class="form-control"></div>
                                    </div>
                                    <!-- 이메일 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">이메일</label></div>
<!--                                         <div class="col-12 col-md-4"> -->
<%--                                             <p class="form-control-static">${employees.emp_email}</p> --%>
<%--                                             <input type="hidden" name="emp_email" value="${employees.emp_email}"> --%>
<!--                                         </div> -->
                                         <div class="col-12 col-md-9">
											<input type="text" id="emp_email" name="emp_email" value="${employees.emp_email }"
												class="form-control bg-gradient-light" readonly="readonly">
										</div>  
                                    </div>
                                    <!-- 신규 비밀번호 -->
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="newPass" class=" form-control-label">신규 비밀번호<font style="color: red;">*</font></label>
										</div>
										<div class="col-12 col-md-9">
											<input type="password" id="emp_passwd" name="emp_passwd"
												class="form-control bg-gradient-light"> <small
												class="help-block form-text text-muted" id="checkPw">변경
												시 입력 (영문 대소문자/숫자/특수문자(!@#$%) 8자~16자)</small>
										</div>
									</div>
                                    <!-- 신규 비밀번호 확인-->
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="confirmNewPass"
												class="form-control-label">신규 비밀번호 확인<font style="color: red;">*</font></label>
										</div>
										<div class="col-12 col-md-9">
											<input type="password" id="emp_passwd" name="emp_comfirmPasswd"
												class="form-control bg-gradient-light"
												onkeyup="confirmPw(this.value)"> <span
												class="help-block form-text" id="checkPasswdConfirmResult"></span>
										</div>
									</div>
	                                 <!-- 입사일 -->
	                                  <div class="row form-group">
                                        <div class="col col-md-3"><label for="hire_date" class=" form-control-label">입사일</label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="date" id="hire_date" name="hire_date" class="form-control" value="${employees.hire_date }" readonly="readonly">
                                        </div>
                                     </div>
                                     <!-- 입사일 -->                          
                                    <!-- 재직여부 -->                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">재직여부</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="inline-radio1" class="form-check-label">
                                                    <input type="radio" id="inline-radio1" name="inline-radios" value="1" class="form-check-input" 
													<c:if test="${employees.work_cd eq '1'}">checked</c:if>>재직
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
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
                         
                                    <!--수정, 확인 버튼 -->
									<div align="center">
										<input class="btn btn-outline-dark" type="button" value="수정" onclick="javascript:confirm_modify()">&nbsp;&nbsp;
										<input class="btn btn-outline-dark" type="button" value="확인" onclick="history.back()">&nbsp;&nbsp;
									</div>
								</form>
                            </div>
                        </div>
                    </div>
            </div>

        </div><!-- .animated -->
    </div><!-- .content -->

    <div class="clearfix"></div>

<jsp:include page="../inc/footer.jsp"></jsp:include>

<!-- Right Panel -->

<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script> --%>
</body>
</html>