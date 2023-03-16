<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>창고 등록 | 창고 관리</title>
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
<style type="text/css">

	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}

	
	@font-face {
	    font-family: 'NEXON Lv1 Gothic OTF';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	body {
	 font-family: 'NEXON Lv1 Gothic OTF';
	 width: 100%;
	 height: 100%;
	}
	
	.col-lg-6 {
		flex: 100%;
	    max-width: 100%;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
// 위치=외부(2) 이거나 구분=공장(2) 일때 주소 입력
function isOut(){
	let wh_location = $("input[name='wh_location']:checked").val();
	let wh_gubun = $("input[name='wh_gubun']:checked").val();
	if(wh_location == '1'){
		alert("창고가 외부일 때만 입력해주세요!");
	} else if(wh_location == '2' || wh_gubun == '2') {
		kakaoAddr();
	}

} // isOut()

$(function() {
	$checkNameResult = false;
	
	// 창고코드 중복 확인
// 	$("#wh_cd").on("focusout", function(){
// 		let wh_cd = $("#wh_cd").val();
// 		$.ajax({
// 			type: "GET",
// 			url: "WarehouseCheckCode",
// 			data: { wh_cd: $("#wh_cd").val()},
// 			success: function(result) {
// 				$("#checkCode").html(result);
				
// 				if(result == "true"){
// 					$("#checkCode").html("코드 중복입니다!!").css("color", "red");
// 					checkResult = false;
// 				} else {
// 					$("#checkCode").html("사용 가능한 코드입니다.").css("color", "green");
// 					CheckResult = true;
// 				}
// 			},
// 		});
// 	});// 창고코드 확인
	
	// 물류팀 확인
	$("#wh_man_name").on("focusout", function(){
		let wh_man_name = $("#wh_man_name").val();
		$.ajax({
			type: "GET",
			url: "WarehouseCheckMan",
			data: { wh_man_name: $("#wh_man_name").val()},
			success: function(result) {
				$("#checkMan").html(result);
				
				if(result == "true"){
					$("#checkMan").html("물류팀 직원만 가능합니다!!!!").css("color", "red");
					checkNameResult = false;
				} else {
					$("#checkMan").html("물류팀 직원입니다.").css("color", "green");
					checkNameResult = true;
				}
			},
		});
	});// 물류팀 확인
	
	// 구분 = 창고 일때만 위치 선택
	$("input[name='wh_gubun']").on("change", function(){
		let wh_gubun = $("input[name='wh_gubun']:checked").val();
// 		alert(wh_gubun);
// 		alert(typeof(wh_gubun));
		if(wh_gubun == '2'){ // 공장이면 선택 못하게함
			$("input:radio[name=wh_location]").prop("disabled", true);
			$("input:radio[name=wh_location]").prop("checked", false);
		} else if(wh_gubun == '1') { // 창고는 선택 가능
			$("input:radio[name=wh_location]").prop("disabled", false);
		}
	}); // 구분 제어
	
});
</script>
</head>
<body>

<jsp:include page="../inc/left.jsp"></jsp:include>
 <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>창고 등록</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li>재고 관리</li>
                                    <li>창고 관리</li>
                                    <li class="active">창고 등록</li>
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
            	<div class="col-lg-6">
            		<div class="card">
            			<div class="card-header">
                        	<strong class="card-title">창고 등록</strong>
                        </div>
                        <div class="card-body card-block">
                        	<form action="WarehouseInsertPro" method="post" enctype="multipart/form-data" class="form-horizontal">
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">창고코드<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="wh_cd" name="wh_cd" class="form-control" readonly="readonly">
	                        			<small id="checkCode" class="form-text text-muted">창고 코드는 자동 부여됩니다</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">창고명<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="text-input" name="wh_name" class="form-control" required="required">
	                        			<small class="form-text text-muted">최대 100자</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">구분<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
                        				<div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio1" class="form-check-label ">
		                                            <input type="radio" id="wh_gubun1" name="wh_gubun" required="required" value="1" class="form-check-input">1 : 창고
		                                        </label>
		                                    </div>
	                                    </div>
	                                    <div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio2" class="form-check-label ">
		                                            <input type="radio" id="wh_gubun2" name="wh_gubun" required="required" value="2" class="form-check-input">2 : 공장
		                                        </label>
		                                    </div>
	                                	</div>
	                                </div>
	                             </div>
	                             <div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">위치<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
                        				<div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio1" class="form-check-label ">
		                                            <input type="radio" id="wh_location1" name="wh_location" required="required" value="1" class="form-check-input">1 : 내부
		                                        </label>
		                                    </div>
	                                    </div>
	                                    <div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio2" class="form-check-label ">
		                                            <input type="radio" id="wh_location2" name="wh_location" required="required" value="2" class="form-check-input">2 : 외부
		                                        </label>
		                                    </div>
	                                    </div>
	                                </div>
	                             </div>
	                             <div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">주소</label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="wh_pcode" name="wh_pcode" style="width:150px;" placeholder="우편번호" readonly="readonly" class="form-control">
	                        			<input type="button" id="addrSearch" value="주소 검색" onclick="isOut()">
	                        			<input type="text" id="wh_addr1" name="wh_addr1" placeholder="주소" readonly="readonly" class="form-control">
	                        			<input type="text" id="wh_addr2" name="wh_addr2" placeholder="상세주소 입력" class="form-control">
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">전화번호<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="text-input" name="wh_tel" class="form-control" required="required">
	                        			<small class="form-text text-muted">(ex : 010-0000-0000)</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label for="wh_man_name" class=" form-control-label">관리자명<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
<!-- 	                        			<input type="text" id="wh_man_name" name="wh_man_name" class="form-control" required="required"> -->
                        				<select class="form-control" id="wh_man_name" name="wh_man_name" data-placeholder="관리자를 선택해주세요" required="required">
                        					<c:forEach var="logi" items="${employees }">
                        						<option value="${logi }">${logi }</option>
                        					</c:forEach> 
                        				</select>
	                        			<small class="form-text text-muted">물류팀 직원만 가능합니다</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">사용여부<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
                        				<div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio1" class="form-check-label ">
		                                            <input type="radio" id="radio1" name="wh_use" value="1" class="form-check-input" required="required">1 : 사용
		                                        </label>
		                                    </div>
	                                    </div>
	                                    <div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio2" class="form-check-label ">
		                                            <input type="radio" id="radio2" name="wh_use" value="2" class="form-check-input" required="required">2 : 미사용
		                                        </label>
		                                    </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">적요</label></div>
                        			<div class="col-12 col-md-9">
	                        			<textarea cols="70" rows="10" required="required" style="resize:none;" name="remarks" required="required"></textarea>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-12">
<!--                                         <div class="input-group"> -->
                                            <div class="input-group-btn"><button class="btn btn-primary">Submit</button></div>
<!--                                         </div> -->
                                    </div>
                                </div>
                        	</form>
                        </div>
            		</div>
            	</div>
            </div>





        	</div><!-- .animated -->
    	</div><!-- .content -->

    <div class="clearfix"></div>

<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../inc/footer.jsp"></jsp:include>

<!-- Right Panel -->

<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->


</body>
<%-- 카카오 주소 API 적용하기 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function kakaoAddr() { // onclick 시 작동할 함수 선언
		new daum.Postcode({
			oncomplete: function(data) {
				var roadAddr = data.roadAddress;
				// 회원이 검색해서 찾은 주소 클릭 시 폼에 뿌리기
				document.getElementById("wh_pcode").value = data.zonecode;
				document.getElementById("wh_addr1").value = data.roadAddress;
				
			}
		}).open();
	}
</script>
</html>