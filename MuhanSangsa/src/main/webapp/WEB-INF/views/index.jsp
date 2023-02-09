<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<html >
<head>
	<title>품목 조회</title>

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
<!-- 모달창 -->
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript">
	//검색 기능 추가
	function fn_search() {
		location.href = "./ProdSelectList?keyword=" + $("#keyword").val() 
				+ "&searchType=" + $("#searchType").val();
	}

</script>

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
	 font-family: 'NEXON Lv1 Gothic OTF' ;
	 width: 100%;
	 height: 100%;
	}
	
	li {
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

a:hover {
  text-decoration: underline;
}

</style>

<body>

<jsp:include page="./inc/left.jsp"></jsp:include>

 <div class=" pr-4 mr-4 mb-1 mt-4 float-right"><small> *접속 IP: ${ip}</small></div> 
        <div class=" breadcrumbs m-0">
            <div class="breadcrumbs-inner rounded-start p-2 " >
                <div class="row m-0 ">
                    <div class="col-sm-4 ">
                        <div class="page-header float-left rounded-start ">
                            <div class="page-title ">
                               <h1 class="m-1"><b>DashBoard</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
<!--                         <div class="page-header float-right rounded-start "> -->
<!--                             <div class="page-title "> -->
<!--                                 <ol class="breadcrumb text-right "> -->
<!--                                     <li><a href="./ProdSelectList">품목조회</a></li> -->
<!--                                     <li><a href="./ProdInsertForm">품목등록</a></li> -->
<!--                                 </ol> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>



<!-- Link to open the modal -->
<!-- <p><a href="#modal_container" rel="modal:open">Open Modal</a></p> -->

<div class="content">
	<!-- Animated -->
	<div class="animated fadeIn">
		<!-- Widgets  -->
		<div class="row">
			<div class="col-lg-3 col-md-6" onclick="location.href='./employees'" style=" cursor: pointer;">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-1">
								<i class="pe-7s-users"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>사원조회</span></div>
									<div class="stat-heading">Employees</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6" onclick="location.href='./Mypage'" style=" cursor: pointer;">
				<div class="card">
					<div class="card-body">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-2">
								<i class="pe-7s-id"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>마이페이지</span></div>
									<div class="stat-heading">Mypage</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>			
			
			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='./ClientList'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-3">
								<i class="pe-7s-portfolio"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>거래처조회</span></div>
									<div class="stat-heading">Client</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='#'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-4">
								<i class="pe-7s-shopbag"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>품목조회</span></div>
									<div class="stat-heading">Product</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='#'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-1">
								<i class="pe-7s-culture"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>창고 조회</span></div>
									<div class="stat-heading">Warehouse</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='#'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-2">
								<i class="pe-7s-box1"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>WMS창고</span></div>
									<div class="stat-heading">WMS_Warehouse</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='#'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-3">
								<i class="pe-7s-clock"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>입고예정</span></div>
									<div class="stat-heading">Receiving</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='#'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-4">
								<i class="pe-7s-check"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>입고처리</span></div>
									<div class="stat-heading">Receiving</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='#'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-1">
								<i class="pe-7s-alarm"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>출고예정</span></div>
									<div class="stat-heading">Shipping</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>		
				
			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='#'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-2">
								<i class="pe-7s-wristwatch"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>출고처리</span></div>
									<div class="stat-heading">Shipping</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='#'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-3">
								<i class="pe-7s-search"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>재고조회</span></div>
									<div class="stat-heading">stock</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body" onclick="location.href='#'" style=" cursor: pointer;">
						<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-4">
								<i class="pe-7s-plane"></i>
							</div>
							<div class="stat-content">
								<div class="text-left dib">
									<div class="stat-text"><span>재고이동</span></div>
									<div class="stat-heading">stock</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		
		
                            
		<!-- /Widgets -->

		<!-- /To Do and Live Chat -->
		<!-- Calender Chart Weather  -->
		
		<!-- /Calender Chart Weather -->
		<!-- Modal - Calendar - Add New Event -->
		
		<!-- /#event-modal -->
		<!-- Modal - Calendar - Add Category -->
		<div class="modal fade none-border" id="add-category">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title"><strong>Add a category </strong></h4>
					</div>
					<div class="modal-body">
						<form>
							<div class="row">
								<div class="col-md-6">
									<label class="control-label">Category Name</label>
									<input class="form-control form-white" placeholder="Enter name" type="text" name="category-name">
								</div>
								<div class="col-md-6">
									<label class="control-label">Choose Category Color</label>
									<select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
										<option value="success">Success</option>
										<option value="danger">Danger</option>
										<option value="info">Info</option>
										<option value="pink">Pink</option>
										<option value="primary">Primary</option>
										<option value="warning">Warning</option>
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
					</div>
				</div>
			</div>
		</div>
	<!-- /#add-category -->
	</div>
	<!-- .animated -->
</div>

<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="./inc/footer.jsp"></jsp:include>
    
<!-- Scripts -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script> -->
<!-- <script src="resources/assets/js/main.js"></script> -->
</body>
</html>
