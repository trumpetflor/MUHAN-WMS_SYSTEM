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
			const form = document.getElementById('InRegisterForm');
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
                        <div class="row form-group">
	                        <div class="col col-md-3"><label for="hireDate" class=" form-control-label">일자</label></div>
	                        <div class="col-12 col-md-9"><input type="date" id="inDate" name="in_date" class="form-control"></div>
                        </div>
                        <div class="card-body card-block">
                        	<form action="WarehouseModifyPro" method="post" enctype="multipart/form-data" class="form-horizontal">
<%--                         	<c:forEach var="warehouse" items="${inproList }"> --%>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">입고예정번호</label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="text-input" name="wh_cd" value="${warehouse.wh_cd}" readonly="readonly" class="form-control">
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">품목명<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="text-input" name="wh_name" value="${warehouse.wh_name }" class="form-control" required="required">
	                        			<small class="form-text text-muted">최대 100자</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">입고예정수량<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="text-input" name="wh_tel" value="${warehouse.wh_tel }" class="form-control" required="required">
	                        			<small class="form-text text-muted">(ex : 010-0000-0000)</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">입고지시수량<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="wh_man_name" name="wh_man_name" value="${warehouse.wh_man_name }" class="form-control" required="required">
	                        			<small id="checkMan" class="form-text text-muted">물류팀 직원만 가능합니다</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">재고번호<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="wh_man_name" name="wh_man_name" value="${warehouse.wh_man_name }" class="form-control" required="required">
	                        			<small id="checkMan" class="form-text text-muted">물류팀 직원만 가능합니다</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-3"><label class=" form-control-label">구역명_선반위치<font style="color: red;">*</font></label></div>
                        			<div class="col-12 col-md-9">
	                        			<input type="text" id="wh_man_name" name="wh_man_name" value="${warehouse.wh_man_name }" class="form-control" required="required">
	                        			<small id="checkMan" class="form-text text-muted">물류팀 직원만 가능합니다</small>
                        			</div>
                        		</div>
                        		<div class="row form-group">
                        			<div class="col col-md-12">
                                        <div class="input-group">
                                            <div class="input-group-btn">
                                            	<button class="btn btn-primary" onclick="javascript:confirm_modify()">저장</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
<%--                             </c:forEach> --%>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="resources/assets/js/main.js"></script>


</body>
</html>