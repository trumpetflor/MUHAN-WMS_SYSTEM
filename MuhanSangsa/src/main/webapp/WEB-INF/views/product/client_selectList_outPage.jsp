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
		
	#vertical-align{
		 vertical-align: middle;
	}
	table{
	 text-align: center;
	}
	
	empList-table > th{
	height: 100px;
	}
		
	.id_pht{
	 width: 80px;
	 transition: 0.5s;
	}
	





/* 모달 */
#modal_container{
  position: absolute;
  width: 70%;
  height: 50%;
  position: fixed;
  top:50%;
  left: 50%;
  transform:translate(-50%,-50%);
  overflow-y: scroll;
  overflow: visible;
}
	
#modal_container_dept{
  position: absolute;
  width: 70%;
  height: 70%;
  position: fixed;
  top:50%;
  left: 50%;
  transform:translate(-50%,-50%);
  overflow-y: scroll;
  overflow: visible;
}
	
/* 스크롤바 크기 설정*/
  #modal_container::-webkit-scrollbar {
    width: 3px;
  }
  #modal_container_dept::-webkit-scrollbar {
    width: 3px;
  }
  
#modal_container > th {
	height: 50px;
}
 a{
 text-decoration: none;
 color: 	#000080;
}
 a:visited :active{
 text-decoration: none;
 color: 	#000080;
}


</style>
<script type="text/javascript">

	$(function() {
		
		load_list(); // 게시물 목록 조회 함수 호출
		
	});

	// 거래처 목록 조회 함수
	function load_list() {
		$.ajax({
			type: "GET",
			url:"ClientListJsonOut?keyword=" + $("#keyword").val() + "&searchType=" + $("#searchType").val() , 
			dataType: "json"
		})
		.done(function(clientList) { // 요청 성공 시
			let result ="";
			for(let client of clientList) {
				result += "<tr>"
							+ "<td id="+client.business_no+">" + client.business_no + "</td>"
							+ "<td id="+client.cust_name+">" + client.cust_name + "</td>"
							+ "<td >" + client.boss_name + "</td>"
							+ "</tr>";
				
			}
			$("#client_table > tbody").html(result);
		})
		.fail(function() {
			$("#client_table").append("요청 실패!!");
		});
	}


</script>
<body>

<div class="content">
   <div class="animated fadeIn">
	<section id="searchSection" class="m-0 d-flex justify-content-end">

 					<select name="searchType" id="searchType" class="rounded-1 btn-sm p-1 mx-4">
						<option value="business_no">거래처 코드</option>
						<option value="cust_name">거래처명</option>
						<option value="boss_name">대표자명</option>
					</select>
			<input type="text"  class="col-sm-5 bg-light border border-secondary rounded-1 px-1" name="keyword" id="keyword"  onkeyup="if(window.event.keyCode==13){load_list()}" > 
			<input type="button" value="검색"  class=" mx-1 btn btn-sm btn-dark rounded-1" onclick="javascirpt:load_list();">

	   </section>

	<table class="table table-hover"  id="client_table">
		<thead>
			<tr>
				<th>거래처 코드</th>
				<th>거래처명</th>
				<th>대표자명</th>
			</tr>
		</thead>
		<tbody>
            <!-- AJAX를 통해 얻은 JSON 데이터 뿌려짐 -->
        </tbody>
	</table>


</div>
</div>


</body>
</html>
