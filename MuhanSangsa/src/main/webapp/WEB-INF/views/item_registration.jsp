<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>인사 조회</title>

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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

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




</script>
<body>

<jsp:include page="inc/left.jsp"></jsp:include>

 <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>품목등록</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="employees">기본등록</a></li>
                                    <li><a href="#">품목등록</a></li>
                                   
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<div class="content">
   <div class="animated fadeIn">

<form action="">
	<div class="container m-0">
			<div class="m-2 row">
			
					<table class=" table">
								<tr>
									<th>품목명</th>
									<td> <input type="text" class="form-control">  </td>
								</tr>
								<tr>
									<th>품목그룹</th>
									<td><div class="input-group mb-3">
											  <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="button-addon" width="100px">
											  <button class="btn btn-outline-secondary " type="button" id="button-addon">검색</button>
										</div>
									 </td>
								</tr>
								<!-- 품목그룹(검색하여 선택) - 대분류&소분류 선택  -->

								<tr>
									<th>규격</th>
									<td>   <input type="text" class="form-control">  </td>
								</tr>
								<tr>
									<th>단위</th>
									<td>
										<select class="form-control">
											<option disable="disable" value="">-- 선택하세요 --</option>
											<option>SET</option>
											<option>BOX</option>
											<option>EA</option>
									   </select>
									   </td>
								</tr>
								<tr>
									<th>바코드</th>
									<td>  <input type="text" class="form-control"> </td>
								</tr>
								<tr>
									<th>입고단가</th>
									<td>  <input type="text" class="form-control">  </td>
								</tr>
								<tr>
									<th>출고단가</th>
									<td>  <input type="text" class="form-control">  </td>
								</tr>
								<tr>
									<th>품목구분</th>
									<td>									
										<select class="form-control">
											<option disable="disable" value="">-- 선택하세요 --</option>
											<option>원재료</option>
											<option>부재료</option>
											<option>제품</option>
											<option>반제품</option>
											<option>제품</option>
									   </select>
									</td>
								</tr>
								<tr><!-- 구매거래처(거래처 테이블에서 검색하여 선택)  -->
									<th>거래처</th>
									<td>
									<div> 
											<div class="input-group">
											  <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="button-addon" width="100px" id="search_client">
											  <button class="btn btn-outline-secondary " type="button" id="button-addon">검색</button>
											</div>
									
									</div> 
									 </td>
								</tr>
								<tr>
									<th>대표이미지</th>
									<td> <input type="file" class="form-control">  </td>
								</tr>
								<tr>
									<th>적요</th>
									<td><input type="text" class="form-control"> </td>
								</tr>
					 </table>
			
			</div>
	</div>	

	<!-- 조회 대상이 자신의 아이디와 일치할 경우 패스워드 수정  -->
		<c:if test="">
				<input type="button" value="수정" class = "btn btn-primary mx-4" name="updatePasswd">
		</c:if>
</form>


</div>
</div>

<jsp:include page="inc/footer.jsp"></jsp:include>
    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>
