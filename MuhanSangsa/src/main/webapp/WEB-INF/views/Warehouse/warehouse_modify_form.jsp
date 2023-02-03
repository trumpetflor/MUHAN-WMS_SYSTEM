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
    <title>Warehouse Modify</title>
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
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script> --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
// 	var checkResult = false;
	
	//상품 수정 클릭 시 확인창
	function confirm_modify() {
		let result = confirm("창고 정보를 수정하시겠습니까?");
		
		if(result){
			const form = document.getElementById('WarehouseModifyForm');
				form.submit();
		}
	
	} // confirm_modify()
	
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
	
	// 물류팀 확인
	$(function() {
		$checkResult = false;
		
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
						checkResult = false;
					} else {
						$("#checkMan").html("물류팀 직원입니다.").css("color", "green");
						CheckResult = true;
					}
				},
			});
		}); // 물류팀 확인
		
		// 구분 = 창고 일때만 위치 선택
		$("input[name='wh_gubun']").on("change", function(){
			let wh_gubun = $("input[name='wh_gubun']:checked").val();
//	 		alert(wh_gubun);
//	 		alert(typeof(wh_gubun));
			if(wh_gubun == '2'){ // 공장이면 선택 못하게함
				$("input:radio[name=wh_location]").prop("disabled", true);
				$("input:radio[name=wh_location]").prop("checked", false);
			} else if(wh_gubun == '1') { // 창고는 선택 가능
				$("input:radio[name=wh_location]").prop("disabled", false);
			}
		}); // 구분 제어
		
		// 위치 = 1:내부 => 주소 내용 clear
		$("input[name='wh_location']").on("click", function(){
			let wh_location = $("input[name='wh_location']:checked").val();
			alert(wh_location);
			if(wh_location == '1'){
				$("#wh_addr1").val('');
				$("#wh_addr2").val('');
// 				$("text").empty();
			}
		});
	});
</script>
<style>
.col-lg-6 {
	flex: 100%;
    max-width: 100%;
}
</style>
</head>
<body>



        <div class="content">
            <div class="animated fadeIn">
            
            <div class="row">
            	<div class="col-lg-6">
            		<div class="card">
            			<div class="card-header">
                        	<strong class="card-title">창고 정보 수정</strong>
                        </div>
                        <div class="card-body card-block">
                        	<form action="WarehouseModifyPro" method="post" enctype="multipart/form-data" class="form-horizontal">
                        	<c:forEach var="warehouse" items="${whList }">
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">창고코드<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="text-input" name="wh_cd" value="${warehouse.wh_cd}" readonly="readonly" class="form-control">
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">창고명<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="text-input" name="wh_name" value="${warehouse.wh_name }" class="form-control" required="required">
	                        			<small class="form-text text-muted">최대 100자</small>
                        			</div>
                        		</div>
                        		<c:choose>
                        		<c:when test="${warehouse.wh_gubun eq '1'}">
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">구분<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
                        				<div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio1" class="form-check-label ">
		                                            <input type="radio" id="wh_gubun1" name="wh_gubun" value="1" checked="checked" class="form-check-input" required="required">1 : 창고
		                                        </label>
		                                    </div>
	                                    </div>
	                                    <div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio2" class="form-check-label ">
		                                            <input type="radio" id="wh_gubun2" name="wh_gubun" value="2" class="form-check-input" required="required">2 : 공장
		                                        </label>
		                                    </div>
	                                	</div>
	                                </div>
	                             </div>
	                             </c:when>
	                             <c:otherwise>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">구분<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
                        				<div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio1" class="form-check-label ">
		                                            <input type="radio" id="wh_gubun1" name="wh_gubun" value="1" class="form-check-input" required="required">1 : 창고
		                                        </label>
		                                    </div>
	                                    </div>
	                                    <div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio2" class="form-check-label ">
		                                            <input type="radio" id="wh_gubun2" name="wh_gubun" value="2" checked="checked" class="form-check-input" required="required">2 : 공장
		                                        </label>
		                                    </div>
	                                	</div>
	                                </div>
	                             </div>
	                             </c:otherwise>
	                             </c:choose>
	                             <c:choose>
	                             <c:when test="${warehouse.wh_location eq '1'}">
	                             <div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">위치<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
                        				<div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio1" class="form-check-label ">
		                                            <input type="radio" id="radio1" name="wh_location" value="1" checked="checked" class="form-check-input" required="required">1 : 내부
		                                        </label>
		                                    </div>
	                                    </div>
	                                    <div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio2" class="form-check-label ">
		                                            <input type="radio" id="radio2" name="wh_location" value="2" class="form-check-input" required="required">2 : 외부
		                                        </label>
		                                    </div>
	                                    </div>
	                                </div>
	                             </div>
	                             </c:when>
	                             <c:otherwise>
	                             <div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">위치<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
                        				<div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio1" class="form-check-label ">
		                                            <input type="radio" id="wh_location1" name="wh_location" value="1" class="form-check-input" required="required">1 : 내부
		                                        </label>
		                                    </div>
	                                    </div>
	                                    <div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio2" class="form-check-label ">
		                                            <input type="radio" id="wh_location2" name="wh_location" value="2" checked="checked" class="form-check-input" required="required">2 : 외부
		                                        </label>
		                                    </div>
	                                    </div>
	                                </div>
	                             </div>
	                             </c:otherwise>
	                             </c:choose>
	                             <div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">주소</label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="wh_pcode" name="wh_pcode" style="width:150px;" placeholder="우편번호" readonly="readonly" class="form-control">
	                        			<input type="button" value="주소 검색" onclick="isOut()">
	                        			<input type="text" id="wh_addr1" name="wh_addr1" value="${warehouse.wh_addr1 }" placeholder="주소" readonly="readonly" class="form-control">
	                        			<input type="text" id="wh_addr2" name="wh_addr2" value="${warehouse.wh_addr2 }" placeholder="상세주소 입력" class="form-control">
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">전화번호<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="text-input" name="wh_tel" value="${warehouse.wh_tel }" class="form-control" required="required">
	                        			<small class="form-text text-muted">(ex : 010-0000-0000)</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">관리자명<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="wh_man_name" name="wh_man_name" value="${warehouse.wh_man_name }" class="form-control" required="required">
	                        			<small id="checkMan" class="form-text text-muted">물류팀 직원만 가능합니다</small>
                        			</div>
                        		</div>
                        		<c:choose>
                        		<c:when test="${warehouse.wh_use eq '1'}">
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">사용여부<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
                        				<div class="form-check-inline form-check">
		                                    <div class="radio">
		                                        <label for="radio1" class="form-check-label ">
		                                            <input type="radio" id="radio1" name="wh_use" value="1" checked="checked" class="form-check-input" required="required">1 : 사용
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
	                            </c:when>
	                            <c:otherwise>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">사용여부</label></div>
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
		                                            <input type="radio" id="radio2" name="wh_use" value="2" checked="checked" class="form-check-input" required="required">2 : 미사용
		                                        </label>
		                                    </div>
	                                    </div>
	                                </div>
	                            </div>
	                            </c:otherwise>
	                            </c:choose>
	                            <div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">적요</label></div>
                        			<div class="col-12 col-md-9">
	                        			<textarea cols="70" rows="10" required="required" style="resize:none;" name="remarks" required="required">${warehouse.remarks }</textarea>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-12">
                                        <div class="input-group">
                                            <div class="input-group-btn">
                                            	<button class="btn btn-primary" onclick="javascript:confirm_modify()">수정</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        	</form>
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


<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="resources/assets/js/main.js"></script>


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