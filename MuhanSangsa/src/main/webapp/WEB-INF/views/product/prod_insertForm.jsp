<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>품목 등록</title>

    <meta charset="utf-8">
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
	<!-- CSS only -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->

</head>
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
	}
		
		
	table{
	vertical-align: middle;

	}


	.form-control{

	height: 30px;
	text-align: center;
	padding: 0%;
	}
	
	#button-addon{
	height: 30px;
	vertical-align: middle;
	padding-bottom: 0%;
	padding-top: 0%;
	}
	

	
	


</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">

	//품목 등록 클릭 시 확인창
	function confirm_insert() {
		let result = confirm("품목을 등록하시겠습니까?");
		
		if(result){
			const form = document.getElementById('ProdInsertPro');
				form.submit();
		}
	
	}	
	
	
	
	
	//등록 성공 시 alert창
	$(function() {
		
		var msg = '${msg}'; //컨트롤러에서 액션이후 msg값이 있을 경우 해당 msg alert창 실행하기 위한 용도
		
		if(msg==1){
			alert('등록이 완료되었습니다');
			 opener.location.reload();
		}
	});


	//그룹 목록 팝업 결과값 등록
	function fn_selectGroup(product_group_bottom_cd, product_group_bottom_name) {
		$("#product_group_bottom_cd").val(product_group_bottom_cd);
		$("#product_group_bottom_name").val(product_group_bottom_name);
		
	}

	//거래처 팝업 결과값 등록
	function fn_selectClient(business_no,cust_name) {
		$("#business_no").val(business_no);
		$("#cust_name").val(cust_name);
		
	}


</script>
<body>

<jsp:include page="../inc/left.jsp"></jsp:include>

 <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>품목 등록</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="./ProdSelectList">품목조회</a></li>
                                    <li><a href="./ProdInsertForm">품목등록</a></li>
                                   
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<div class="content">
   <div class="animated fadeIn">

<form action="ProdInsertPro" method="post" enctype="multipart/form-data" >
	<div class="container m-0">
			<div class="m-2 row">
			
					<table class=" table">
								<tr>
									<th>품목명</th>
									<td> <input type="text" class="form-control" name="product_name" required="required">  </td>
								</tr>
								<tr>
									<th>품목그룹</th>
									<td><div class="input-group mb-3">
											  <input type="hidden" class="form-control" id="product_group_bottom_cd" name="product_group_bottom_cd"
											  	placeholder="" aria-label="" aria-describedby="button-addon" width="100px">									
											  <input type="text" class="form-control" id="product_group_bottom_name" name="product_group_bottom_name"
											  	placeholder="" aria-label="" aria-describedby="button-addon" width="100px" readonly="readonly" required="required">
											  <button class="btn btn-outline-secondary " type="button" id="button-addon"
											  onclick="window.open('Product/GroupBottomSelectList','GroupBottomSelectList','width=500, height=500,location=no,status=no,scrollbars=yes');">검색</button>
										</div>
									 </td>
								</tr>
								<!-- 품목그룹(검색하여 선택) - 대분류&소분류 선택  -->
								
								<tr>
									<th>단위</th>
									<td>
										<select class="form-control" name="unit">
											<option disable="disable">-- 선택하세요 --</option>
											<option value="1">SET</option>
											<option value="2">BOX</option>
											<option value="3">EA</option>
									   </select>
									   </td>
								</tr>
								<tr>
									<th>입고단가</th>
									<td>  <input type="text" class="form-control" name="in_unit_price" required="required">  </td>
								</tr>
								<tr>
									<th>출고단가</th>
									<td>  <input type="text" class="form-control" name="out_unit_price" required="required">  </td>
								</tr>
								<tr>
									<th>품목구분</th>
									<td>									
										<select class="form-control" name="product_type_cd" required="required">
											<option disable="disable">-- 선택하세요 --</option>
											<option value="1">원재료</option>
											<option value="2">부재료</option>
											<option value="3">제품</option>
											<option value="4">반제품</option>
											<option value="5">상품</option>
									   </select>
									</td>
								</tr>
								<tr><!-- 구매거래처(거래처 테이블에서 검색하여 선택)  -->
									<th>거래처</th>
									<td>
										<div> 
											<div class="input-group">
											 <input type="hidden" class="form-control" name="business_no" id="business_no"
											  	placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client">
											 <input type="text" class="form-control" name="cust_name" id="cust_name" readonly="readonly"
											  	placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client" required="required">
											  <button class="btn btn-outline-secondary " type="button" id="button-addon"
											  onclick="window.open('Product/ClientSelectList','ClientSelectList','width=500, height=500,location=no,status=no,scrollbars=yes');">검색
											  </button>
											</div>
										</div> 
									</td>
								</tr>
								<tr>
									<th>대표이미지</th>
									<td> <input type="file" name="file" class="form-control" name="product_image">  </td>
								</tr>
								<tr>
									<th>적요</th>
									<td><input type="text" class="form-control" name="remarks"> </td>
								</tr>
					 </table>
			
			</div>
	</div>	

	<input type="submit" value="등록" class = "btn btn-primary mx-4"  onclick="javascript:confirm_insert()"/>
</form>


</div>
</div>

<jsp:include page="../inc/footer.jsp"></jsp:include>
    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>
