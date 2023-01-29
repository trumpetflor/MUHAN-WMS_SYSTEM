<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
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
    <link rel="stylesheet" href="resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="resources/assets/css/style.css">

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
	 text-align: center;
	 vertical-align: middle;
	}
	td {
	height: 100px
	
	}
		
	.id_pht{
	 width: 80px;
	 transition: 0.5s;
	}
/* 	.id_pht:hover{ */
/* 	 width: 300px; */
/* 	 position: absolute; */
/* 	} */
</style>
<script src="resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">

	$(function() {
		
		//상세조회 버튼 클릭
		$("#detailBtn").on("click", function () {
			alert(${sId});
			window.open("employeesDetail");
			
			
			
			
			
		});
		
		
		
		
	});


</script>
<body>

<jsp:include page="inc/left.jsp"></jsp:include>


        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                               <h1>사원조회</h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">인사</a></li>
                                    <li><a href="#">사원조회</a></li>
                                   
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<div class="content">
   <div class="animated fadeIn">
   <small> 접속 IP: </small>
	<table class="table">

		<thead>
			<tr>
				<th>이미지</th>
				<th>사원번호</th>
				<th>사원명</th>
				<th>부서명</th>
				<th>직급</th>
				<th>연락처</th>
				<th>E-Mail</th>
				<th>관리</th><!-- 관리 권한 부여 시 조회 가능 -->
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><img class="id_pht" alt="증명사진" src="resources/images/id_photo01.jpg"></td>
				<td>200043</td>
				<td>김대리</td>
				<td>개발팀</td>
				<td>대리</td>
				<td>010-0000-0000</td>
				<td><a href="#">asdaf@muhan.com</a></td>
				<th><!-- 관리 권한 부여 시 조회 가능 -->
					<input type="button" value="상세 조회" class = "btn btn-primary btn-sm m-1" name="detailBtn" id="detailBtn"> 
	 				<input type="button" value="수정" class = "btn btn-primary btn-sm m-1" name="updateBtn" id="updateBtn">
	 			</th>
			</tr>
			
			<tr>
				<td><img class="id_pht" alt="증명사진" src="resources/images/id_photo02.jpg"></td>
				<td>27896043</td>
				<td>정히히</td>
				<td>개발팀</td>
				<td>부장</td>
				<td>010-0000-0000</td>
				<td><a href="#">dfsdf@muhan.com</a></td>
				<th><!-- 관리 권한 부여 시 조회 가능 -->
					<input type="button" value="상세 조회" class = "btn btn-primary btn-sm m-1" name="detailBtn"> 
	 				<input type="button" value="수정" class = "btn btn-primary btn-sm m-1" name="updateBtn">
	 			</th>
			</tr>
		</tbody>
	
	</table>
	<div>
		<input type="button" value="신규등록" class = "btn btn-success m-2" name="">
	</div>

</div>
</div>

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
    
</div><!-- /#right-panel -->
    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>
