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
	
	.click:not(:disabled):not(.disabled) {
    cursor: pointer;
	}
	
</style>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">

	//AJAX 를 활용한 게시물 목록 표시에 사용될 페이지 번호값 미리 저장
	let pageNum = 1;
// 	let pageList = '';
	
	$(function() {
		
		let searchType = $("#searchType").val(); // 검색 타입
		let keyword = $("#keyword").val(); // 검색어
		
		load_list(pageNum, searchType, keyword); // 게시물 목록 조회 함수 호출 (pageNum 까지 파라미터로)
		
	});
	
	// 게시물 목록 조회 함수 (ajax)
	function load_list(pageNum, searchType, keyword) { // 파라미터 : 현재 페이지, 검색 타입, 검색어
		$.ajax({
			type: "GET",
			url: "ClientListJson?pageNum=" + pageNum + "&searchType=" + searchType + "&keyword=" + keyword,
			dataType: "json"
		})
		.done(function(jsonArray) { // 요청 성공 시
			
			$("#client_table > tbody").empty(); // 리스트 출력 테이블 구역 비우기
			$("#pageArea").empty(); // 페이지 번호 구역 비우기
			$('html'). scrollTop(0); // 스크롤 맨 위로 보내기
			pageList = ''; // 페이지 번호 출력 코드 변수 선언 (블록 외부에서 사용하기 위해서!)
			
			// <<<<< 향상된 for문 버전, for문 버전 둘 중에 하나만 사용!! >>>>>>>
			
			// ============================== 향상된 for문 사용 =========================================
// 			let index = 0; // 향상된 for 문 인덱스 용 변수
// 			for(let json of jsonArray) {
// 				// index 가 jsonArray 크기 - 1 보다 작을 경우
// 				// jsonArray 에 저장된 맨 마지막 객체(PageInfo) 이전까지(ClientVO 객체에만) 접근
// 				if(index < jsonArray.length - 1) { 
// // 					alert(client.business_no);
// 					let strBn = '"' + json.business_no + '"'; // 파라미터 문자열로 보내려면 "" 결합해주기ㅠㅠㅠ!! - by. 킹갓제너럴영진
// 					let result = "<tr>"
// 								+ "<td class='click' onclick='openClientDetail(" + strBn + ")'>" + json.business_no + "</td>"
// 								+ "<td class='click' onclick='openClientDetail(" + strBn + ")'>" + json.cust_name + "</td>"
// // 								+ "<td><a href='ClientDetail?business_no=" + json.business_no + "'>" + client.business_no + "</a></td>"
// // 								+ "<td><a href='ClientDetail?business_no=" + json.business_no + "'>" + client.cust_name + "</a></td>"
// 								+ "<td>" + json.boss_name + "</td>"
// 								+ "<td>" + json.tel + "</td>"
// 								+ "<td>" + json.mobile_no + "</td>"
// 								+ "<td>" + json.addr + "</td>"
// 								+ "<td>" + json.remarks + "</td>"
// 								+ "</tr>";
// 					$("#client_table").append(result);
					
// 				} else { // index 가 jsonArray 크기 - 1 과 같을 경우 (jsonArray 에 저장된 마지막 객체 = PageInfo 객체)
// 					let valSt = "'" + searchType + "'";
// 					let valKey = "'" + keyword + "'";
					
// 					for(let i = json.startPage; i <= json.endPage; i++) {
// 						if(i == pageNum) {
// 							pageList += '<a class="active" href="javascript:(0)">' + i +'</a>';
// 						} else {
// 							pageList += '<a href="javascript:load_list(' + i + ', ' + valSt + ', ' + valKey + ')">' + i + '</a>';
// 						}
// 					}
// 				}
				
// 				index++; // 인덱스 번호 1 증가시키기
// 			} // 향상된 for문 끝
			
// // 			alert(pageList);
			
// 			$("#pageArea").append(pageList); // 페이지 번호 표출 div(id="pageArea") 에 페이지 숫자 목록(pageList) 넣기
			
			// =================================================================================================
				
			// ================================= for문 사용 ====================================================
			
			// jsonList(json 배열) ClientVO 객체 목록만 돌도록 설정 (맨 마지막 PageInfo 객체 접근 X)
			for(let index = 0; index < jsonArray.length - 1; index++) { 
				// 자바 스크립트 함수 파라미터 용 변수 선언 (숫자를 문자열로 보내기 위함)
				let strBn = '"' + jsonArray[index].business_no + '"'; // 파라미터 문자열로 보내려면 "" 결합해주기ㅠㅠㅠ!! - by. 킹갓제너럴영진
				// 뿌릴 내용
				// 받아온jsonArray변수명[인덱스명].접근할컬럼변수명 => 각 VO 객체의 변수에 접근)
				let result = "<tr>"
							+ "<td class='click' onclick='openClientDetail(" + strBn + ")'>" + jsonArray[index].business_no + "</td>"
							+ "<td class='click' onclick='openClientDetail(" + strBn + ")'>" + jsonArray[index].cust_name + "</td>"
// 							+ "<td><a href='ClientDetail?business_no=" + client.business_no + "'>" + jsonArray[index].business_no + "</a></td>"
// 							+ "<td><a href='ClientDetail?business_no=" + client.business_no + "'>" + jsonArray[index].cust_name + "</a></td>"
							+ "<td>" + jsonArray[index].boss_name + "</td>"
							+ "<td>" + jsonArray[index].tel + "</td>"
							+ "<td>" + jsonArray[index].mobile_no + "</td>"
							+ "<td>" + jsonArray[index].addr + "</td>"
							+ "<td>" + jsonArray[index].remarks + "</td>"
							+ "</tr>";
				$("#client_table").append(result); // 뿌릴 내용 테이블 영역에 넣기
			}
			
			// 자바 스크립트 함수 파라미터 용 변수 선언(문자열)
			let valSt = "'" + searchType + "'";
			let valKey = "'" + keyword + "'";
			
			// PageInfo 객체 접근 (jsonArray 의 맨 마지막 인덱스) 해서 startPage 와 endPage 얻어오기 -> 차례대로 숫자 목록 저장
			for(let i = jsonArray[jsonArray.length - 1].startPage; i <= jsonArray[jsonArray.length - 1].endPage; i++) {
				if(i == pageNum) { // 현재 페이지와 같을 경우 작동 X
					pageList += '<a class="active" href="javascript:(0)">' + i +'</a>'; 
				} else { // 현재 페이지와 다를 경우 ajax 를 호출하는 함수가 동작하도록
					pageList += '<a href="javascript:load_list(' + i + ', ' + valSt + ', ' + valKey + ')">' + i + '</a>';
				}
			}
// 			alert(pageList);
			
			$("#pageArea").append(pageList); // 페이지 번호 표출 div(id="pageArea") 에 페이지 숫자 목록(pageList) 넣기
			
		})
		.fail(function() {
			$("#client_table").append("요청 실패..ㅠㅠ");
		}); // ajax 끝
	} // load_list 함수 끝
	
	// 거래처 세부 정보 창 - 아아ㅏ아가가각가가각!!!1!!!!!! 파라미터 왜 이따구로 넘어와ㅠㅠㅠ 
	// => 해겨류ㅠㅠㅠㅠㅠㅠ!!!!! - by. 킹갓제너럴영진
	function openClientDetail(business_no) {
// 		let business_no = strBn.replace("N", "");
// 		alert(business_no);
		window.open("ClientDetail?business_no=" + business_no, "_blank", "width=650, height=800, top=100, left=1000");
		
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
				   <form action=ClientList>
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
            	<!-- 페이징처리 -->
				<div class="row" id="pageList">
					<div class="col-lg-12">
						<div class="product_pagenation" id="pageArea">
						</div>
					</div>
				</div>
            	<c:if test="${priv eq '1' }">
					<button type="button" class="mx-1 btn btn-sm btn-dark rounded-1 float-right" onclick="location.href='ClientInsertForm'">거래처 등록</button>
            	</c:if>
            </div><!-- .animated -->
        </div><!-- .content -->

    <div class="clearfix"></div>
    <!-- footer -->
	   	<br><br><br><br><br><br><br><br><br><br><br><br>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
<!-- Right Panel -->

<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script> --%>


</body>
</html>