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

		$isConfirmBn = false; // 거래처 코드 확인용 변수
		
		// 거래처 코드 중복 확인
		$("#business_no").on("focusout", function(){
			let business_no = $("#business_no").val();
			let regex = /[0-9]{10,30}/; // 10 ~ 30 자리의 숫자
			
			if(!regex.exec(business_no)) {
				alert(business_no + " 는 유효하지 않은 코드입니다.");
// 				$("#business_no").focus();
				isConfirmBn = false;
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
							idResult = false;
						} else { // 거래처 코드 존재 X (중복 X)
							$("#check_bn").html("사용 가능한 코드입니다.").css("color","#00ff00");
							idResult = true;
						}
							
					}
					
				});
			}
		});
		
		$("form").submit(function() {
			if(!isConfirmBn) {
				alert("거래처 코드를 확인해주세요.");
				return false;
			}
		});
		
		
		// 종목 입력창 추가
		$("#add").on("click", function(){
			$("#jongmokArea").append(
					'<input type="text" name="jongmok" placeholder="ex) 동물용 사료 및 조제식품 제조업" class="form-control">'
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
                                        <div class="col-12 col-md-9"><input type="text" id="business_no" name="business_no" placeholder="ex) 0123456789" class="form-control" required="required"><small class="form-text text-muted" id="check_bn">'-' 를 제외한 숫자만 입력</small></div>
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
                                                <option value="농업 · 임업 및 어업">농업 · 임업 및 어업</option>
                                                <option value="광업">광업</option>
                                                <option value="제조업">제조업</option>
                                                <option value="전기 · 가스 · 증기 및 공기조절 공급업">전기 · 가스 · 증기 및 공기조절 공급업</option>
                                                <option value="수도 · 하수 및 폐기물 처리 · 원료 재생업">수도 · 하수 및 폐기물 처리 · 원료 재생업</option>
                                                <option value="건설업">건설업</option>
                                                <option value="도매 및 소매업">도매 및 소매업</option>
                                                <option value="운수 및 창고업">운수 및 창고업</option>
                                                <option value="숙박 및 음식점업">숙박 및 음식점업</option>
                                                <option value="정보통신업">정보통신업</option>
                                                <option value="금융 및 보험업">금융 및 보험업</option>
                                                <option value="부동산업">부동산업</option>
                                                <option value="전문 · 과학 및 기술 서비스업">전문, 과학 및 기술 서비스업</option>
                                                <option value="사업시설 관리 · 사업지원 및 임대 서비스업">사업시설 관리 · 사업지원 및 임대 서비스업</option>
                                                <option value="공공 행정 · 국방 및 사회보장 행정">공공 행정 · 국방 및 사회보장 행정</option>
                                                <option value="교육서비스업">교육서비스업</option>
                                                <option value="보건업 및 사회복지 서비스업">보건업 및 사회복지 서비스업</option>
                                                <option value="예술 · 스포츠 및 여가관련 서비스업">예술 · 스포츠 및 여가관련 서비스업</option>
                                                <option value="협회 및 단체 · 수리 및 기타 개인 서비스업">협회 및 단체 · 수리 및 기타 개인 서비스업</option>
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
                        </div>

           			 </div>
          		  </div>


       		 </div><!-- .animated -->
    	</div><!-- .content -->

    <div class="clearfix"></div>

    <footer>
    	<br><br><br><br><br><br><br><br><br><br><br><br>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
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