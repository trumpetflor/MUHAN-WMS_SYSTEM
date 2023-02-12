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
<title>인사관리 | 사원 등록</title>
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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<style type="text/css">

.col-lg-6{
	margin: auto;
	max-width: 50%;
	flex: 100 100;
}

/*        23/02/10 수정 사항     */
@font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	font-family: 'NEXON Lv1 Gothic OTF';
}
.col-md-3 {
padding-left: 3em;
}
input[name=emp_name],[name=emp_tel],[name=emp_dtel],[name=emp_email],[name=emp_post_No]{
	width: 300px;
}
input[name=emp_addr],[type=date], select[name=work_cd] {
	width: 450px;
}
select[name=dept_cd],[name=grade_cd]{
	width: 300px;
}

/*        23/02/10 수정 사항     */
</style>
<script type="text/javascript">
// 이메일 중복 확인용 전역변수
var idResult = false;

// jquery 시작 부분 페이지 동작시 적용
	$(function() {
		//// ID = 이메일 미입력시 체크 ////
		$("#email").on("focusout", function() {
			let id = $("#email").val();
			console.log(id);
			if(id == "") {
				$("#checkId").html("필수 입력").css("color","red");
				idResult = false;
			} else {
				//// ID 중복체크 ////
				$.ajax({
					url: "EmployeeIdCheck",
					data: { id: $("#email").val()},
					success: function(result) {
						$("#checkId").html(result);
						if(result == "true") {
							$("#checkId").html("사용 중인 이메일입니다").css("color","red");
							idResult = false;
						} else {
							$("#checkId").html("사용 가능한 이메일입니다").css("color","#00ff00");
							idResult = true;
						}
					}// success
						
				}); // ajax
				
			} // if
		}); // focus
		
		
}); // func()

</script>
</head>
<body>
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
                                        <div class="col-12 col-md-9"><input type="text" id="name" name="emp_name" placeholder="사원명을 입력하세요" class="form-control" required="required"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="department" class=" form-control-label">부서코드</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="dept_cd" id="department" class="form-control" required="required">
                                                <option value="0">부서명을 선택하세요</option>
                                                <option value="01">인사팀</option>
                                                <option value="02">개발팀</option>
                                                <option value="03">물류관리팀</option>
                                                <option value="04">영업팀</option>
                                            </select>
                                        </div>
                                    </div>
                                     <div class="row form-group">
                                        <div class="col col-md-3"><label for="position" class=" form-control-label">직급코드</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="grade_cd" id="position" class="form-control" required="required">
                                                <option value="0">직급을 선택하세요</option>
                                                <option value="1">사원</option>
                                                <option value="2">대리</option>
                                                <option value="3">부장</option>
                                                <option value="4">대표</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="mobile" class=" form-control-label">연락처(개인)</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="mobile" name="emp_tel" required="required" placeholder="ex) 010-1234-5678" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="dTel" class=" form-control-label">연락처(사무실)</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="" name="emp_dtel" placeholder="ex) 051-123-4567" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email" class=" form-control-label">Email</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="email" name="emp_email" required="required" placeholder="이메일을 입력하세요" class="form-control" >
                                        <div id="checkId" class="help-block form-text"><small class="help-block form-text" ></small></div></div>
                                    </div>
                                    <!-- 주소 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="postCode" class=" form-control-label">우편번호</label></div>
                                        <div class="col-12 col-md-9 d-flex"><input type="text" id="postCode" name="emp_post_No" placeholder="우편번호를 입력하세요" class="form-control"><input type="button" value="주소 검색" onclick="kakaoAddr()" ></div>
                                    </div>
                               		 <div class="row form-group">
                                        <div class="col col-md-3"><label for="address1" class=" form-control-label">주소</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="address1" name="emp_addr" placeholder="주소를 입력하세요" class="form-control"></div>
                                    </div>
                                     <div class="row form-group">
                                        <div class="col col-md-3"><label for="address2" class=" form-control-label">상세주소</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="address2" name="emp_addr" placeholder="상세주소를 입력하세요" class="form-control"></div>
                                    </div>
	                                 <!-- 주소 -->
	                                 <!-- 입사일 -->
	                                  <div class="row form-group">
                                        <div class="col col-md-3"><label for="hireDate" class=" form-control-label">입사일</label></div>
                                        <div class="col-12 col-md-9"><input type="date" id="hireDate" required="required" name="hire_date" class="form-control"></div>
                                     </div>
                                     <!-- 입사일 -->
	                                 <!-- 재직여부 -->
	                                  <div class="row form-group">
                                        <div class="col col-md-3"><label for="workCd" class=" form-control-label">재직여부</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="work_cd" id="workCd" class="form-control" required="required">
                                                <option value="0">재직여부를 선택하세요</option>
                                                <option value="1">재직</option>
                                                <option value="2">휴직</option>
                                                <option value="3">퇴사</option>
                                            </select>
                                        </div>
                                    </div>
                                     <!-- 재직여부 -->
                                     <!-- 권한 -->
                                     <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">권한설정</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check" >
                                                <label for="level1" class="form-check-label ">
                                                    <input type="checkbox" id="level1" name="priv_cd" value="10000000" class="form-check-input">기본등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="level2" class="form-check-label ">
                                                    <input type="checkbox" id="level2" name="priv_cd" value="1000000" class="form-check-input" >사원조회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="level2" class="form-check-label ">
                                                    <input type="checkbox" id="level3" name="priv_cd" value="100000" class="form-check-input" >사원관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="level3" class="form-check-label ">
                                                  	<input type="checkbox" id="level4" name="priv_cd" value="10000" class="form-check-input">재고조회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                              </div>
                                               <div class="form-check-inline form-check">
                                                <label for="level4" class="form-check-label ">
                                                    <input type="checkbox" id="level5" name="priv_cd" value="1000" class="form-check-input">재고관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="level5" class="form-check-label ">
                                                    <input type="checkbox" id="level6" name="priv_cd" value="100" class="form-check-input">거래처등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="level6" class="form-check-label ">
                                                    <input type="checkbox" id="level7" name="priv_cd" value="10" class="form-check-input">창고등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="level7" class="form-check-label ">
                                                    <input type="checkbox" id="level8" name="priv_cd" value="1" class="form-check-input">WMS관리&nbsp;&nbsp;&nbsp;&nbsp;
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

    <jsp:include page="inc/footer.jsp"></jsp:include>


<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="assets/js/main.js"></script> -->
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