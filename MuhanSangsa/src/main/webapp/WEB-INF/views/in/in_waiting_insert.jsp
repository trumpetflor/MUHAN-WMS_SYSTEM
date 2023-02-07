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

<!--     <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> -->

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

<style>
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
	table, th, td { border: 1px solid #999999; 
					padding-top: 5px;
					padding-bottom: 5px;
					padding-left: 10px;
					padding-right: 10px;
					}
	thead {background-color: #e6e6e6;
			text-align: center;}
	small { text-align: left;}
	#test{
		width: 60px;
		height: auto;
	}
	tfoot {background-color: #e6e6e6;
		width: 60px;
		height: auto;
		text-align: right;
	}
	#hireDate1 {
		width: 130px;
		height: auto;
	}
	.input-field {
		width: 70px;
		height: auto;
		text-align: right;
	}
	.product-f {
		width: 150px;
		height: auto;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
	var index = 1;
// 	$(document).on("change","input[class=test]",function(){
// 		let sum = 0;
// 		sum = parseInt(sum);
// 		$(this).each(function(index){
// 			$("input[class=test]").eq(index).val();
// 			console.log($("input[class=test]").val());
// 			sum += parseInt($("input[class=test]").eq(index).val());
// 		});
// 		$(".rowSum").text(sum);
// 	});
	function calculateSum() {
    var sum = 0;
    var inputElements = document.getElementsByClassName("input-field");
    for (var i = 0; i < inputElements.length; i++) {
    	if (!isNaN(inputElements[i].value) && inputElements[i].value.length != 0) {
        sum += parseFloat(inputElements[i].value);
    	}
    }
    document.getElementById("sum").innerHTML = "Sum: " + sum;
  }

	var inputFields = document.querySelectorAll(".input-field");
	inputFields.forEach(function(inputField) {
    inputField.addEventListener("input", calculateSum);
	});
	
	
	$(function() {
		
		$("select[name=business_no]").change(function() {
			  var x = $(".cli").val();
			  console.log($(this).val());
			});
		
		
		
		// 종목 입력창 추가
		$("#add").on("click", function(){
			$("tbody").append(
// 					'<input type="text" name="jongmok" placeholder="ex) 동물용 사료 및 조제식품 제조업" class="form-control" required="required">'
// 					+'<small class="form-text text-muted text-right" name="remove">- 삭제</small>');
					'<tr>'
                       + '<td></td>'
                       + '<td></td>'
//                        + '<td><input type="text" id="numberTest-"'+ index +' name="qty"></td>'
                       + '<td><input type="text" class="input-field" onchange="calculateSum()"></td>'
                       + '<td><input type="date" id="hireDate1" name="hire_date1" class="form-control"></td>'
                       + '<td><input type="text"></td>'
                   +'</tr>');
		});
	
	

	// 종목 입력창 삭제
	$(document).on("click", "small[name=remove]", function(){
// 		alert("종목 삭제");
		$(this).prev().remove();
		$(this).remove();
	});
	
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
                                <form action="InInsertPro" method="post" class="form-horizontal">
                                    
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
                                        <select name="business_no" id="client" data-placeholder="거래처를 선택해주세요" required="required">
                                                <c:forEach var="client" items="${clientList }">
                                                	<option class="cli" value="${client.business_no }">${client.cust_name }</option>
                                                </c:forEach>
                                        </select>
                                        </div>
                                    </div>
                                    
                                    <!-- 담당자 선택 -->
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="emp" class=" form-control-label">담당자<font style="color: red;">*</font></label></div>
                                        <div class="col col-md-9">
                                            <select name="emp_num" id="emp" data-placeholder="담당자를 선택해주세요" required="required">
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
                                    <div class="col col-md-3">
                                    <small  id="add">+ 품목 추가</small>
                                    </div>
                                    <table>
                                    	<thead>
                                    		<tr>
                                    			<th>품목코드</th>
                                    			<th>품목명</th>
                                    			<th>수량</th>
                                    			<th>납기일자</th>
                                    			<th>적요</th>
                                    		</tr>
                                    	</thead>
                                    	<tbody>
                                    		<tr>
                                    			
                                    			<td class="product-f">
	                                    			<select name="business_no" id="client" data-placeholder="품목 선택"  required="required">
		                                                	<c:forEach var="client" items="${clientList }">
		                                                	<option value="${client.business_no }">${client.cust_name }</option>
		                                                	</c:forEach>
	                                        		</select>
                                    			</td>
                                    			
                                    			<td class="product-f"></td>
                                    			<td><input type="text" class="input-field" onchange="calculateSum()"></td>
                                    			<td><input type="date" id="hireDate1" name="hire_date" class="form-control"></td>
                                    			<td><input type="text"></td>
                                    		</tr>
                                    	</tbody>
                                    	<tfoot>
                                    		<tr>
                                    			<td></td>
                                    			<td></td>
                                    			<td id="sum"></td>
                                    			<td></td>
                                    			<td></td>
                                    		</tr>
                                    	</tfoot>
                                    </table>
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

           			 </div><!-- card -->
          		  </div><!-- col-lg-10 -->
          		 </div><!-- .row -->
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
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
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