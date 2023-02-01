<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MuhanSangsa - Client List</title>
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
		
	#client_table{
		 vertical-align: middle;
	}
	table{
	 text-align: center;
	}
	
	td {
	height: 100px;
	}
		
	.id_pht{
	 width: 80px;
	 transition: 0.5s;
	}
	
</style>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function() {
		load_list();
		
	});
	
	// 게시물 목록 조회 함수
	function load_list() {
		$.ajax({
			type: "GET",
			url: "ClientListJson",
			dataType: "json"
		})
		.done(function(clientList) { // 요청 성공 시
			for(let client of clientList) {
// 				alert(client.business_no);
// 				let strBn = "N" + client.business_no;
				let result = "<tr>"
// 							+ "<td onclick='openClientDetail(" + client.business_no + ")'>" + client.business_no + "</td>"
// 							+ "<td onclick='openClientDetail(" + client.business_no + ")'>" + client.cust_name + "</td>"
							+ "<td><a href='ClientDetail?business_no=" + client.business_no + "'>" + client.business_no + "</a></td>"
							+ "<td><a href='ClientDetail?business_no=" + client.business_no + "'>" + client.cust_name + "</a></td>"
							+ "<td>" + client.boss_name + "</td>"
							+ "<td>" + client.tel + "</td>"
							+ "<td>" + client.mobile_no + "</td>"
							+ "<td>" + client.addr + "</td>"
							+ "<td>" + client.remarks + "</td>"
							+ "</tr>";
				$("#client_table").append(result);
			}
		})
		.fail(function() {
			$("#client_table").append("요청 실패..ㅠㅠ");
		});
	}
	
	// 거래처 세부 정보 창 - 아아ㅏ아가가각가가각!!!1!!!!!! 파라미터 왜 이따구로 넘어와ㅠㅠㅠ
	function openClientDetail(business_no) {
// 		alert(strBn);
// 		let business_no = strBn.replace("N", "");
		alert(business_no);
		window.open("ClientDetail?business_no=" + business_no, "거래처 세부 정보");
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
                               <h1 class="m-1"><b>거래처 조회</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">기본 등록</a></li>
                                    <li><a href="ClientList">거래처 등록</a></li>
                                    <li class="active">거래처 조회</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
            	<section id="searchSection" class="m-0 d-flex justify-content-end">
				   <form action=ClientListJson>
						<!-- 검색 타입 추가 -->
						<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1">
							<option value="business_no" <c:if test="${param.searchType eq 'business_no'}">selected</c:if>>거래처 코드</option>
							<option value="cust_name" <c:if test="${param.searchType eq 'cust_name'}">selected</c:if>>거래처명</option>
							<option value="boss_name" <c:if test="${param.searchType eq 'boss_name'}">selected</c:if>>대표자명</option>
							<option value="addr" <c:if test="${param.searchType eq 'addr'}">selected</c:if>>주소</option>
						</select>			
						<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword" value="${param.keyword }"> 
						<input type="submit" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" >
					</form>
				</section>

                                <table id="client_table" class="table ">
                                    <thead>
                                        <tr>
                                            <th>거래처 코드</th>
                                            <th>거래처명</th>
                                            <th>대표자명</th>
                                            <th>전화번호1</th>
                                            <th>전화번호2</th>
                                            <th>주소</th>
                                            <th>비고</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- AJAX를 통해 얻은 JSON 데이터 뿌려짐 -->
                                    </tbody>
                                </table>


            </div><!-- .animated -->
        </div><!-- .content -->

    <div class="clearfix"></div>

    <footer>
    	<br><br><br><br><br><br><br><br><br><br><br><br>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
    </footer>



<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


</body>
</html>