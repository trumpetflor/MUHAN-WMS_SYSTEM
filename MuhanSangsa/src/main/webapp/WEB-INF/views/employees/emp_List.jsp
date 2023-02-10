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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 모달창 -->
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<style type="text/css">
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'NEXON Lv1 Gothic OTF';
	width: 100%;
	height: 100%;
}

#vertical-align {
	vertical-align: middle;
}

table {
	text-align: center;
}

empList-table>th {
	height: 100px;
}

.id_pht {
	width: 80px;
	transition: 0.5s;
}

/* 	#empChecked{ */
/* 		margin: 10px; */

/* 	} */

/* 모달 */
#modal_container {
	position: absolute;
	width: 600px;
	height: auto;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	overflow-y: scroll;
}

.close-modal {
	display: none;
}

#modal_container_dept {
	position: absolute;
	height: 70%;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	overflow-y: scroll;
	padding: 2px;
}

/* 스크롤바 크기 설정*/
#modal_container::-webkit-scrollbar {
	width: 3px;
}

#modal_container_dept::-webkit-scrollbar {
	width: 3px;
}

#modal_container>th {
	height: 50px;
}

a {
	text-decoration: none;
	color: #000080;
}

a:visited :active {
	text-decoration: none;
	color: #000080;
}

#modal_container select {
	/* 	display: none; */
	
}

.modal a.close-modal {
	display: none;
}
</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->
<script type="text/javascript">


	
	
	//체크박스 선택 시
	$(document).on("change","input[name=empChecked]",function(){
		
		$("#selectCount > small").html($('input:checkbox[name=empChecked]:checked').length +" 개 선택됨");
		
// 		alert("체크됨: "+ $(this).val());
		let idx = $(this).val().split("/")[0];
		let emp_name = $(this).val().split("/")[1];
		let emp_num = $(this).val().split("/")[2];
		let emp_info = {"emp_num":emp_num,"emp_name":emp_name};
	
		
	});
	
	//부서 및 재직상태 변경 메서드
	function dept_workChange_ajax(jsonArr) {

		console.log("jsonArr:"+  JSON.stringify(jsonArr));
			$.ajax({
				
		        type: "post",
		        url: "emp_update_part.ajax",
		        traditional:true,
		        data: JSON.stringify(jsonArr),
		        contentType: 'application/json;charset=UTF-8',
		        success: function(data,status,xhr) {
		               
		        	if(parseInt(data) > 0){
		        		 alert("변경되었습니다.");
		        		
		        	}else{
		        		alert("일시적인 오류로 변경에 실패했습니다.");
		        	}
		        	
		        	//모달창 닫기
	        		 $("modal_container").hide();
	    			 $('.jquery-modal').click();
		
		        },
		        error: function(xhr,status,error) {
		            console.log(error);
		        }
			
		});
		
	}


	$(function() {
		let empMap = new Map(); //체크한 사원을 보관할 Map객체
		let selectedModalRadioVal; //select박스 
		
		//전체선택 버튼 클릭
		$('#AllChecked').on("click",function(){
	
			if($(this).is(":checked") == true){
				$("input[name=empChecked]").prop("checked",true);
			}else{
				$("input[name=empChecked]").prop("checked",false);
			}
		});
		
		
		
		
		//1. 일괄변경 버튼 클릭시 - 모달창 open
		$("#changeCollective").on("click",function(){
			
				$("#selected_empList").empty();
				//선택된 사원이 없을 경우
				if($('input:checkbox[name=empChecked]:checked').length == 0 ){
					alert("선택된 사원이 없습니다.");
				}else{

					$("#modal_container").modal({
			        fadeDuration: 250 //모달창 올라오는 시간
//		 		    escapeClose: false,
//		 		    clickClose: false,
//		 		    showClose: false
			
		 	      });
					
				}
				
				//1. 비우기
				empMap.clear();//맵 초기화
				
				//2. 선택된 체크박스 값 추가
		     	$('input:checkbox[name=empChecked]').each(function (index) {
		     		
		     		if($(this).is(":checked")==true){
		     	    	console.log($(this).val());
		     			let idx = $(this).val().split("/")[0];
		     			let emp_name = $(this).val().split("/")[1];
		     			let emp_num = $(this).val().split("/")[2];
		     			let dept_name = $(this).val().split("/")[3];
		     			empMap.set(emp_num,emp_name);
		     			console.log("empMap: "+ empMap.keys());
				  		let text = " <span class='badge badge-dark p-1 m-1' id="+emp_num+">"+emp_name+" ("+emp_num+" / "+dept_name+")"+"</span> "
				  		$("#selected_empList").append(text);
		     	    }
		     	});
				
		});
		
		
		//2. 모달창 open 이후 이벤트
		
		//2-1 radio버튼(재직변경/부서변경) 클릭시 select박스 보이는 작업 실행
		$("#modal_container input[name=changeInfo]").on("click",function(){
			
			 $("#modal_container select").empty();//select영역 비우기
			 
			if($(this).val()=="work_change"){//재직상태 변경 버튼 클릭시
					selectedModalRadioVal = $(this).val();
				
					let json_workArr = ${workArr};
					
	// 				alert(JSON.stringify(json_workArr));
					for(let work of json_workArr){
					 $("#modal_container select").append("<option id=work"+work.work_cd+">"+work.work_type+"</option>");
					}
					
			}else if($(this).val()=="dept_change"){
					selectedModalRadioVal = $(this).val();	
			
					let json_deptArr = ${deptArr};
					
					for(let dept of json_deptArr){
					 $("#modal_container select").append("<option id=dept"+dept.dept_cd+">"+dept.dept_name+"</option>");
					}
			}
		});
		
		
		
		//2-2 모달창 내부 일괄수정 버튼 클릭시 - ajax로 서버에 전송
		$("#updateAll").on("click",function(){
			
			//ajax로 보낼 데이터 변수로 선언
			//1.선택된 select박스 값
			let seleced = $("#modal_container select option:selected").text();//선택된 select박스 값
			console.log("select선택됨: "+ seleced);
			
			//2.선택된 사원정보 JSON
			let jsonArr=[]; //json Array 객체 선언
			
			let empArr =[];
			
			//ajax를 통해 서버에 전송하기 위해 Map객체를 JSON으로 변환
			empMap.forEach(function(value, key) {
				

					jsonArr.push({"emp_num":key,	"emp_name":value  });

			});//empMap.forEach
			
				
			//선택된 radio박스 값 판별
			if(selectedModalRadioVal == "work_change"){
				selectedModalRadioVal ="work";
				jsonArr.push({"work_type": $("#modal_container select option:selected").text()});
				jsonArr.push({"dept_name": ""});
				jsonArr.push({"selectedModalRadioVal":selectedModalRadioVal});

				//employees,work_type,dept_name,selectedModalRadioVal
				dept_workChange_ajax(jsonArr);
		
				
			}else if(selectedModalRadioVal == "dept_change"){
				selectedModalRadioVal ="dept";
				jsonArr.push({"selectedModalRadioVal":selectedModalRadioVal});
				jsonArr.push({"work_type": ""});
				jsonArr.push({"dept_name": $("#modal_container select option:selected").text()});

				
				dept_workChange_ajax(jsonArr);
				
			}
			
		});
//============================================페이징 처리(무한스크롤 기능 구현)============================================
	
		// AJAX 를 활용한 게시물 목록 표시에 사용될 페이지 번호값 미리 저장
		let pageNum = 1;
		
		$(function() {
			
			// 검색타입(searchType)과 검색어(keyword) 값 가져와서 변수에 저장
			let searchType = $("#searchType").val();
			let keyword = $("#keyword").val();
	 		console.log(searchType + ", " + keyword);
			
			// 게시물 목록 조회를 처음 수행하기 위해 load_list() 함수 호출
			load_empList(searchType, keyword);
			
			// 무한스크롤 기능 구현
			// window 객체에서 scroll 동작 시 기능 수행(이벤트 처리)을 위해 scroll() 함수 호출
			$(window).scroll(function() {

				// 1. window 객체와 document 객체를 활용하여 스크롤 관련 값 가져오기
				// => 스크롤바 현재 위치, 문서 표시되는 창의 높이, 문서 전체 높이
				let scrollTop = $(window).scrollTop();
				let windowHeight = $(window).height();
				let documentHeight = $(document).height();
				
//	 			console.log("scrollTop : " + scrollTop + ", windowHeight : " + windowHeight + ", documentHeight : " + documentHeight + "<br>");

				// 2. 스크롤바 위치값 + 창 높이 + x 가 문서 전체 높이 이상이면
				//    다음 페이지 게시물 목록 로딩하여 추가
				// => 이 때, x 값은 마지막으로부터 여유 공간으로 둘 스크롤바 아래쪽 남은 공간(픽셀값)
				if(scrollTop + windowHeight + 1 >= documentHeight) {
					
					//페이징 처리를 위한 함수 호출
					// => 이 페이지 번호를 1 증가시켜 다음 페이지 목록 로딩
					pageNum++;
					load_empList(searchType, keyword);
				}
			});
		});
		
		// 게시물 목록 조회를 AJAX + JSON 으로 처리할 load_list() 함수 정의
		// => 검색타입과 검색어를 파라미터로 지정
		function load_empList(searchType, keyword) {
			$.ajax({
				type: "GET",
				url: "employees?pageNum=" + pageNum + "&searchType=" + searchType + "&keyword=" + keyword,
				dataType: "json"
			})
			.done(function(empList) { // 요청 성공 시
				console.log(empList);
//	 			$("#listForm > table").append(boardList);
				
				// JSONArray 객체를 통해 배열형태로 전달받은 JSON 데이터를
				// 반복문을 통해 하나씩 접근하여 객체 꺼내기
				for(let board of boardList) {
					
					// 테이블에 표시할 JSON 데이터 출력문 생성
					// => 출력할 데이터는 board.xxx 형식으로 접근
// 		<c:forEach items="${empList }" var="emp" varStatus="status" >
// 			<tr>
// 			<c:if test="${priv eq 1 }"><!-- 관리 권한 부여 시 보여짐 가능 -->
// 				<td><input type="checkbox" name="empChecked" id="empChecked" class="form-check-input" value="${status.index}/${emp.emp_name }/${emp.emp_num }/${emp.dept_name}"></td>
// 			</c:if>
<%-- 				<td><img class="id_pht" alt="${emp.emp_name } 의 사진" src="<%=request.getScheme()+"://"+request.getServerName() + ":" + request.getServerPort() +"/"+request.getContextPath()%>/resources/upload/ㅇ.img""></td> --%>
// 				<td>${emp.emp_num }</td>
// 				<td>${emp.emp_name }</td>
// 				<td onclick="dept_modal('${emp.dept_cd}','${emp.dept_name }');">
// 				<a href="#modal_container_dept" rel="modal:open" class="badge badge-dark">${emp.dept_name }</a></td>
// 				<td>${emp.grade_name }</td>
// 				<td>${emp.emp_tel }</td>
// 				<td><a href="#">${emp.emp_email }</a></td>
// 				<c:if test="${priv eq 1 }">
// 					<th><!-- 관리 권한 부여 시 조회 가능 -->
// 					<input type="button" value="상세 조회" class = "btn btn-primary btn-sm m-1" name="detailBtn" id="detailBtn"
//                  	 onclick="window.open('empListDetail?id=${emp.emp_email}','MemberDetailForm','width=800, height=920,location=no,status=no,scrollbars=yes');"> 
// 						<input type="button" value="수정" class = "btn btn-primary btn-sm m-1" name="updateBtn" id="updateBtn"
//                    onclick="window.open('empListDetailUpdate?id=${emp.emp_email}','MemberDetailModify','width=800, height=920,location=no,status=no,scrollbars=yes');">
// 		 			</th>
// 				</c:if>
// 			</tr>
// 		</c:forEach>
					
					// 지정된 위치(table 태그 내부)에 JSON 객체 출력문 추가
					$("#empList-table > table tbody").append(result);
				}
			})
			.fail(function() {
				$("#listForm > table").append("<h3>요청 실패!</h3>");
			});
		}
			

    
	});//$(function() {---------------------------------------


	
	//부서조회 모달창 ajax 함수
	function dept_modal(dept_cd,dept_name) {
		console.log(dept_cd);
		console.log(dept_name);

		$.ajax({
			 
			        type: "post",
			        url: "dept_detail.ajax",
			        data: {
			        	"dept_cd":dept_cd,
			        	"dept_name": dept_name
			        },
			        dataType: "html",
			        success: function(data,status,xhr) {
			               
			            $("#modal_container_dept").html(data);
			
			        },
			        error: function(xhr,status,error) {
			            console.log(error);
			        }

		});
		
		
	}//end of dept_modal()---------------------------------------
	

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
                               <h1 class="m-1"><b>사원 관리</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                        <div class="page-header float-right rounded-start ">
                            <div class="page-title ">
                                <ol class="breadcrumb text-right ">
                                    <li><a href="employees">인사</a></li>
                                    <li><a href="#">사원 관리</a></li>
                                   
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

				

<!-- Link to open the modal -->
<!-- <p><a href="#modal_container" rel="modal:open">Open Modal</a></p> -->

<div class="content">
   <div class="animated fadeIn">
	<section id="searchSection" class="m-0 d-flex justify-content-end">
  		<form action="employees_search ">
				<!-- 검색 타입 추가 -->
				<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1">
					<option value="emp_name" <c:if test="${param.searchType eq 'emp_name'}">selected</c:if>>사원이름</option>
					<option value="emp_num" <c:if test="${param.searchType eq 'emp_num'}">selected</c:if>>사원번호</option>
					<option value="emp_email" <c:if test="${param.searchType eq 'emp_email'}">selected</c:if>>이메일</option>
					<option value="dept_name" <c:if test="${param.searchType eq 'dept_name'}">selected</c:if>>부서</option>
				</select>			
				<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword" value="${param.keyword }"> 
				<input type="submit" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" >
		</form>
		
		
	 </section>
	<c:if test="${priv eq 1 }">
 	 	<div id = "selectCount"><small class="text-secondary"> 0 개 선택됨</small></div>

  	</c:if>
	<table class="table  vertical-align"  id="empList-table">
		<thead>
			<tr>
			<c:if test="${priv eq 1 }">
				<th><input type="checkbox" id="AllChecked"></th><!-- 관리 권한 부여 시 조회 가능 -->
			</c:if>
				<th>사진</th>
				<th>사원번호</th>
				<th>사원명</th>
				<th>부서명</th>
				<th>직급</th>
				<th>연락처</th>
				<th>E-Mail</th>
			<c:if test="${priv eq 1 }">
				<th>관리</th><!-- 관리 권한 부여 시 조회 가능 -->
			</c:if>
			</tr>
		</thead>
				<tbody>
					<c:forEach items="${empList }" var="emp" varStatus="status">
						<tr>
							<c:if test="${priv eq 1 }">
								<!-- 관리 권한 부여 시 보여짐 가능 -->
								<td><input type="checkbox" name="empChecked"
									id="empChecked" class="form-check-input"
									value="${status.index}/${emp.emp_name }/${emp.emp_num }/${emp.dept_name}"></td>
							</c:if>
							<td><img class="id_pht" alt="${emp.emp_name  }의 사진"
								src="${pageContext.request.contextPath}/resources/upload/${emp.photo  }"></td>
							<td>${emp.emp_num }</td>
							<td>${emp.emp_name }</td>
							<td onclick="dept_modal('${emp.dept_cd}','${emp.dept_name }');">
								<a href="#modal_container_dept" rel="modal:open"
								class="badge badge-dark">${emp.dept_name }</a>
							</td>
							<td>${emp.grade_name }</td>
							<td>${emp.emp_tel }</td>
							<td><a href="#">${emp.emp_email }</a></td>
							<c:if test="${priv eq 1 }">
								<th>
									<!-- 관리 권한 부여 시 조회 가능 --> <input type="button" value="상세 조회"
									class="btn btn-primary btn-sm m-1" name="detailBtn"
									id="detailBtn"
									onclick="window.open('empListDetail?id=${emp.emp_email}','MemberDetailForm','width=800, height=920,location=no,status=no,scrollbars=yes');">
									<input type="button" value="수정"
									class="btn btn-primary btn-sm m-1" name="updateBtn"
									id="updateBtn"
									onclick="window.open('empListDetailUpdate?id=${emp.emp_email}','MemberDetailModify','width=800, height=920,location=no,status=no,scrollbars=yes');">
								</th>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>

			</table>

	<div class="float-right">
		<input type="button" value="신규등록" class = "btn btn-sm btn-success m-2" onclick="location.href='employeeRegisterForm'" >
		<input type="button" value="일괄변경" class = "btn btn-sm btn-success m-2" id="changeCollective">
	</div>
	
	
		<div id="pageList" >
		<div>
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
	
		<c:choose>
			<c:when test="${pageNum > 1}">
				<span onclick="location.href='employees?pageNum=${pageNum - 1}'">&#8249;</span>
			</c:when>
			<c:otherwise>
				<span >&#8249;</span>
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq 0}">
					1&emsp;
				</c:when>
				<c:when test="${pageNum eq i}">
					${i }&emsp;
				</c:when>
				<c:otherwise>
					<a href="employees?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}" >
				<span onclick="location.href='employees?pageNum=${pageNum + 1}'">&#8250;</span>
			</c:when>
			<c:otherwise>
				<span>&#8250;</span>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	
	
	
<!-- =================================================모달================================================================== -->
<!-- 부서 정보 관련 모달 영역 DIV  -->

	<div id="modal_container_dept" class="modal custom-size">

 		 <a href="#" rel="modal:close"></a>
	</div><!-- end of DIV #modal_container -->


<!-- 일괄 수정 모달 영역 DIV -->
<!-- Modal HTML embedded directly into document -->
<div id="modal_container" class="modal">
	<div class=" m-3 border border-light border-top-0 rounded-2 border border-1"> 
		<div class="p-2 text-white well rounded-2"style="background-color:#000000	" >◼ 선택된 사원</div>
		<div class="mx-3 py-3" id="selected_empList">
		
			
		</div>
		
		<div class="m-2 mt-2 row">
			<div class="m-2 mt-4">
					<input type="radio" name="changeInfo" value="work_change"> 재직 상태 변경<br>
					<input type="radio" name="changeInfo" value="dept_change"> 부서 변경
			</div>
			<select>
				<option disabled selected value="">선택하세요</option>
			</select>
		</div>

		
		</div>
	<div id="modal-btn-div" class="float-right mt-4">
		 <input type="button" value="일괄 수정" class = "btn btn-primary btn-sm  " id="updateAll">
		 <a href="#" rel="modal:close"><input type="button" value="취소" class = "btn btn-primary btn-sm  " name="" id=""></a>
	</div>
 </div><!-- end of DIV #modal_container -->

</div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../inc/footer.jsp"></jsp:include>
    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>
