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


	}
	th {
	width: 200px;
/* 	text-align: right; */
	vertical-align: middle;
	border-right: 1px;
	height: 30px;
	}
	#imgWapper{
	width:180px;
	border: 1px;
	margin: 1px;
	border: 10px;
	border-color: black;
/* 	background: black; */
	}
	#id_photo {
	 width:180px;
	margin-top:20px;
	align-self: center;
	border-radius: 1px;
	border: 1px;
	background-color: black;
	}

	.caption-top{
	 caption-side: top; 
	}

</style>
<script src="resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">


	$(function() {
		
// 		if(${sessionScope.sId}==${emp.emp_email}){//조회 대상이 자신의 아이디와 일치할 경우
// 			//패스워드 수정 항목 표시
// 			$("#emp_name_tr").append()
// 		}
		 
		

		////조회 대상이 자신의 아이디와 일치할 경우 패스워드 수정 
		$("input[type=password]").on("change", function () {
// 			alert("");
			if($("#emp_NewPasswd").val() == $("#emp_NewPasswdCheck").val()){
				
			}else{
				alert("비밀번호가 일치하지 않습니다 !")
			}
			
		})
		
		//submit이벤트
		$( "form" ).submit(function () {
			
			
		});
		
	});


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
                               <h1 class="m-1"><b>붕어빵 님 상세정보</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="employees">인사</a></li>
                                    <li><a href="#">사원 상세조회</a></li>
                                   
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<div class="content">
   <div class="animated fadeIn">
 

<!-- 상세 조회 시 E-Mail, 우편번호, 주소, 상세주소, 입사일, 재직여부, 권한, 사진이미지 포함하여 표시 -->
<!-- 조회 대상이 자신의 아이디와 일치할 경우 패스워드 수정 항목 표시
(기존 패스워드, 새 패스워드, 새 패스워드 확인 입력창 및 수정 버튼 표시) -->
<form action="employeesUpdate">
	<div class="container m-0">
			<div class="m-2 row">
				<div class=" col-8">
					<table class=" table">
					<caption class="caption-top">기본 정보</caption>
								<tr id="emp_name_tr">
									<th>사원명</th>
									<td> <!-- ${emp.emp_name} --> </td>
								</tr>
								<tr>
									<th>사원번호</th>
									<td><%-- ${emp.emp_num} --%> </td>
								</tr>
								<!-- 조회 대상이 자신의 아이디와 일치할 경우 패스워드 수정  -->
								<c:if test="">
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name="emp_NewPasswd" placeholder=""></td>
									</tr>
									<tr>
										<th>새비밀번호</th>
										<td><input type="password" id="emp_NewPasswd"></td>
									</tr>
									<tr>
										<th>새비밀번호 확인</th>
										<td><input type="password" id="emp_NewPasswdCheck"></td>
									</tr>
								</c:if>
								<tr>
									<th>E-Mail</th>
									<td><%-- ${emp.emp_email} --%></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><%-- ${emp.emp_tel} --%> </td>
								</tr>
								<tr>
									<th>주소</th>
									<td><%-- ${emp.emp_addr} --%></td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td><%-- ${emp.hire_date } --%></td>
								</tr>
					 </table>
				</div>
				<div class=" col-2" id="imgWapper">
					<img id="id_photo" alt="증명사진" src="resources/images/id_photo01.jpg" width="150px" >
				</div>
			</div>
	</div>	
		
		<div class="m-4">

			 <table class="table">
			 <caption class="caption-top">재직 정보</caption>
						<tr>
							<th>부서명</th>
							<td><%-- ${dept.dept_name } --%></td>
						</tr>
		
						<tr>
							<th>직급</th>
							<td><%-- ${grade.grade_name } --%></td>
						</tr>
						<tr>
							<th>연락처(사무실)</th>
							<td><%-- ${emp.emp_dtel} --%> </td>
						</tr>
						<tr>
							<th>입사일</th>
							<td></td>
						</tr>
						<tr>
							<th>재직여부</th>
							<td></td>
						</tr>
						<tr>
							<th>권한</th>
							<td></td>
						</tr>
			</table>
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
