<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>사원 상세 정보 수정</title>
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

</style>
<script type="text/javascript">

	//상품 수정 클릭 시 확인창
	function confirm_modify() {
		let result = confirm("상품을 수정하시겠습니까?");
		
		if(result){
			const form = document.getElementById('empListDetailUpdatePro');
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
		
	});
	
	

</script>
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
                                <form action="empListDetailUpdatePro" id="empListDetailUpdatePro" method="post" enctype="multipart/form-data" class="form-horizontal">
                                 <!-- 사진 이미지 -->
                                 <div class="row form-group">   
                                 	<div class="col col-md-3"><label class=" form-control-label" style="margin-top: 80px;">사진 이미지</label></div>
                                  		<div class=" col-12 col-md-4" id="imgWapper">
											<img id="photo" alt="증명사진" style="width: 150px" name="photo"
											src="<%=request.getScheme()+"://"+request.getServerName() + ":" + request.getServerPort() +"/"+request.getContextPath()%>/resources/upload/${employees.photo }"	
											onerror="this.src='${pageContext.request.contextPath}/resources/images/profile.png';" width="150px" />
										</div>
								  </div>
                                    <!-- 사원번호(코드) -->
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">사원번호(코드)</label></div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="emp_num" name="emp_num" value="${employees.emp_num }"
												class="form-control bg-gradient-light" required="required">
                                        </div>
                                    </div>
                                    <!-- 사원번호(코드) -->
                                    <!-- 사원명 -->                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">사원명</label></div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="emp_name" name="emp_name" value="${employees.emp_name }"
												class="form-control bg-gradient-light" required="required">                                            
                                        </div>
                                    </div>
                                    <!-- 부서명 -->                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="department" class=" form-control-label">부서코드</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="dept_cd" id="department" class="form-control">
                                                <option>부서명을 선택하세요</option>
                                                <option value="01" <c:if test="${employees.dept_cd eq '01'}">selected</c:if>>인사팀</option>
                                                <option value="02" <c:if test="${employees.dept_cd eq '02'}">selected</c:if>>개발팀</option>
                                                <option value="03" <c:if test="${employees.dept_cd eq '03'}">selected</c:if>>물류관리팀</option>
                                                <option value="04" <c:if test="${employees.dept_cd eq '04'}">selected</c:if>>영업팀</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- 직급 -->                                                                        
                                     <div class="row form-group">
                                        <div class="col col-md-3"><label for="position" class=" form-control-label">직급코드</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="grade_cd" id="grade_cd" class="form-control">
                                                <option>직급을 선택하세요</option>
                                                <option value="1" <c:if test="${employees.grade_cd eq '1'}">selected</c:if>>사원</option>
                                                <option value="2" <c:if test="${employees.grade_cd eq '2'}">selected</c:if>>대리</option>
                                                <option value="3" <c:if test="${employees.grade_cd eq '3'}">selected</c:if>>부장</option>
                                                <option value="4" <c:if test="${employees.grade_cd eq '4'}">selected</c:if>>대표</option>
                                            </select>
                                        </div>
                                    </div>                                    
                                    <!-- 연락처(개인) -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">연락처(개인)</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="phone_number" name="emp_tel" 
                                        value="${employees.emp_tel}" placeholder="전화번호를 입력하세요" class="form-control"></div>
                                    </div>
                                    <!-- 연락처(사무실) -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">연락처(사무실)</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="office_number" name="emp_dtel" 
                                        value="${employees.emp_dtel}" placeholder="전화번호를 입력하세요" class="form-control"></div>
                                    </div>
                                    <!-- 이메일 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">Email</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="email-input" name="emp_email" 
                                        value="${employees.emp_email}" placeholder="Enter Email" class="form-control"></div>
                                    </div>
									<!-- 우편번호  -->
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="text-input" class="form-control-label">주소<font></font></label>
										</div>
										<div class="col-12 col-md-4 d-flex">
											<input type="text" id="postcode" name="emp_post_no"
												value="${employees.emp_post_No }"
												class="form-control bg-gradient-light" required="required">
											<input type="button" class=" mx-1 btn btn-outline-secondary"
												value="우편번호" onclick="kakaoAddr()">
										</div>
									</div>
									<!-- 도로명 주소  -->
									<div class="row form-group">
										<div class="col col-md-3"></div>
										<div class="col-12 col-md-8">
											<input type="text" id="emp_addr" name="emp_addr "
												value="${employees.emp_addr }"
												class="form-control bg-gradient-light" required="required">
											<small class="form-text text-muted">도로명주소</small>
										</div>
									</div>
									<!-- 상세주소 -->
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="text-input" class=" form-control-label"></label>
										</div>
										<div class="col-12 col-md-8">
											<input type="text" id="emp_addrDetail" name="emp_addrDetail"
												value=""
												class="form-control bg-gradient-light">
												<small class="form-text text-muted">상세주소</small>
										</div>
									</div>
                                   
	                                 <!-- 입사일 -->
	                                  <div class="row form-group">
                                        <div class="col col-md-3"><label for="hireDate" class=" form-control-label">입사일</label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="date" id="hire_date" name="hire_date" class="form-control" value="${employees.hire_date }">
                                        </div>
                                     </div>
                                     <!-- 입사일 -->                               
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">재직여부</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="inline-radio1" name="work_cd" value="1" class="form-check-input" <c:if test="${employees.work_cd eq '1'}">checked</c:if>> 
                                                    재직&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="work_cd" value="2" class="form-check-input" 
                                                    <c:if test="${employees.work_cd eq '2'}">checked</c:if>> 휴직
                                                	&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="work_cd" value="3" class="form-check-input" 
                                                    <c:if test="${employees.work_cd eq '3'}">checked</c:if>> 퇴사
                                                </label>
                                            </div>
                                        </div>
                                    </div>
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
                                    <!--사진이미지 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">사진이미지</label></div>
                                        <div class="col-12 col-md-6"><input type="file" id="file" name="file" class="form-control-file">
                                       		<br><small>(기존파일 : ${employees.photo })</small>
                                        </div>
                                    </div>
                                    <!--  -->
                                </form>
                            </div>
                        </div>
                        <div align="center">
                        <!--수정, 확인 버튼 -->
							<input class="btn btn-outline-dark" type="button" value="수정" onclick="javascript:confirm_modify()">&nbsp;&nbsp;
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

<%-- 카카오 주소 API 적용하기 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function kakaoAddr() { // onclick 시 작동할 함수 선언
		new daum.Postcode({
			oncomplete: function(data) {
				var roadAddr = data.roadAddress;
				// 회원이 검색해서 찾은 주소 클릭 시 폼에 뿌리기
				document.getElementById("postcode").value = data.zonecode;
				document.getElementById("emp_addr").value = data.roadAddress;
			}
		}).open();
	}
</script>

</body>
</html>