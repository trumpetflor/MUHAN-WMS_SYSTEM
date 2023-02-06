<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
	
	.col-lg-10{
		margin: auto;
		max-width: 85%;
		flex: 100 100;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
	
	$(function() {

		$isConfirmBn = false; // 거래처 코드 확인용 변수
		
		// 거래처 코드 중복 확인
		$("#business_no").on("focusout", function(){
			let business_no = $("#business_no").val();
			let regex = /[0-9]{10,30}/; // 10 ~ 30 자리의 숫자
			
			if(!regex.exec(business_no)) {
				alert(business_no + " 는 유효하지 않은 코드입니다.");
// 				$("#business_no").focus();
				$isConfirmBn = false;
			} else {
// 				alert("거래처 코드 중복 확인 완료");
				$.ajax({
					url: "DuplicateBusinessNo",
					data: {
						business_no : $("#business_no").val()
					},
					success: function(result) {
						$("#check_bn").html(result);
						
						if(result == "true") { // 거래처 코드 존재 (중복 O)
							$("#check_bn").html("이미 존재하는 코드입니다.").css("color","#00ff00");
							$isConfirmBn = false;
						} else { // 거래처 코드 존재 X (중복 X)
							$("#check_bn").html("사용 가능한 코드입니다.").css("color","#00ff00");
							$isConfirmBn = true;
						}
							
					}
					
				});
			}
		});
		
		$("form").submit(function() {
			if(!$isConfirmBn) {
				alert("거래처 코드를 확인해주세요.");
				return false;
			}
		});
		
		
		// 종목 입력창 추가
		$("#add").on("click", function(){
			$("#jongmokArea").append(
					'<input type="text" name="jongmok" placeholder="ex) 동물용 사료 및 조제식품 제조업" class="form-control" required="required">'
					+'<small class="form-text text-muted text-right" name="remove">- 삭제</small>');
		});
	
	});

	// 종목 입력창 삭제
	$(document).on("click", "small[name=remove]", function(){
// 		alert("종목 삭제");
		$(this).prev().remove();
		$(this).remove();
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

	<jsp:include page="../inc/left.jsp"></jsp:include>
	
        <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>입고예정 등록</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill">
                        <div class="page-header float-right rounded-start">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right">
<!--                                     <li><a href="#">기본 등록</a></li> -->
<!--                                     <li><a href="#">거래처 등록</a></li> -->
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
                                <strong>입고예정 물품등록</strong>
                            </div>
                            <div class="card-body card-block">
                                <form action="ClientInsertPro" method="post" class="form-horizontal">
                                    
                                    <!-- 입고 유형 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="cust_name" class=" form-control-label">입고 유형<font style="color: red;">*</font></label></div>
										<div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                            	<input type="radio" name="g_gubun" value="01" class="form-check-input" checked="checked">발주서 &nbsp;&nbsp;
                                                <input type="radio" name="g_gubun" value="02" class="form-check-input">구매
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- 거래처 선택 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="client" class=" form-control-label">거래처<font style="color: red;">*</font></label></div>
                                        <div class="col col-md-9">
                                        <select name="business_no" id="client" data-placeholder="거래처를 선택해주세요" multiple class="standardSelect" required="required">
                                                <c:forEach var="client" items="${clientList }">
                                                	<option value="${client.business_no }">${client.cust_name }</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <!-- 담당자 선택 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="emp" class=" form-control-label">담당자<font style="color: red;">*</font></label></div>
                                        <div class="col col-md-9">
                                            <select name="emp_num" id="emp" data-placeholder="담당자를 선택해주세요" multiple class="standardSelect" required="required">
                                                <c:forEach var="emp" items="${empList }">
                                                	<option value="${emp.emp_num }">${emp.emp_name } / ${emp.dept_name }</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <!-- 납기 일자 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="hireDate" class=" form-control-label">납기일자<font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9"><input type="date" id="hireDate" name="hire_date" class="form-control"></div>
                                    </div>
                                    
                                    <!-- 적요(비고) -->
                                    <div class="row form-group">
                                    	<div class="col col-md-3"><label class="form-control-label">비고</label></div>
                                    	<div class="col-12 col-md-9"><input type="text" id="text" name="remarks" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="jongmok" class=" form-control-label"><font style="color: red;">*</font></label></div>
                                        <div class="col-12 col-md-9">
                                        	<div id="jongmokArea">
                                        	<input type="text" id="jongmok" name="jongmok" placeholder="" class="form-control" required="required">
                                        	</div>
                                        	<small class="form-text text-muted text-right" id="add">+ 종목 추가</small>
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
										<div class="col-12 col-md-6 d-flex">
											<input type="text" id="post_no" name="post_no" placeholder="ex) 00000" class="form-control bg-gradient-light" required="required">
											<input type="button" class=" mx-1 btn btn-outline-secondary" value="우편번호" onclick="kakaoAddr()">
										</div>
									</div>
									<div class="row form-group">
										<div class="col col-md-3"></div>
										<div class="col-12 col-md-9">
											<input type="text" id="addr" name="addr" placeholder="ex) 부산진구 동천로 1" class="form-control bg-gradient-light" required="required">
											<small class="form-text text-muted">도로명주소</small>
										</div>
									</div>
									<div class="row form-group">
										<div class="col col-md-3">
										</div>
										<div class="col-12 col-md-9">
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
                            </form>
                        </div>

           			 </div>
          		  </div>
          		 </div>
       		 </div><!-- .animated -->
    	</div><!-- .content -->

    <div class="clearfix"></div>

	<!-- footer -->
	   	<br><br><br><br><br><br><br><br><br><br><br><br>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->


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