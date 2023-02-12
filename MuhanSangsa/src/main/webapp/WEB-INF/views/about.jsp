<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<html >
<head>
	<title>About</title>

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
	
	div > p {
	 font-family: 'NEXON Lv1 Gothic OTF' !important;
	 width: 100%;
	 height: 100%;
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

.box img { /* hover 뒤 애니메이션 */
    transform: scale(1.0); /* 이미지 확대 */
    transition: transform .5s; /* 시간 설정 */
}
 
.box img:hover {    /* hover 시 애니메이션 */
    transform: scale(1.5);   /* 이미지 확대 */
    transition: transform .5s;  /* 시간 설정 */
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
                               <h1 class="m-1"><b>About</b></h1>   
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 rounded-pill ">
                    </div>
                </div>
            </div>
        </div>




<!-- Link to open the modal -->
<!-- <p><a href="#modal_container" rel="modal:open">Open Modal</a></p> -->

<div class="content">
	<!-- Animated -->
	<div class="animated fadeIn">
		<!-- Member  -->
	<section style="padding: 20px;padding-bottom: 60px;background-color: #f4f4f4;">
		<div class="container">
			<div class="row gutter-2 gutter-md-4" style="text-align: center;">
				<div class="col-md-6 col-lg-4">
					<!-- <span class="h1 font-weight-bold">50</span> -->
					<span class="box"><img src="${pageContext.request.contextPath}/resources/images/mijoo_profile.png" width="150px"
						height="150px" style="margin-bottom: 20px;"></span>
					<p>
						김미주/팀장<br>김미주@muhansangsa.com
					</p>
				</div>
				<div class="col-md-6 col-lg-4">
					<span class="box"><img src="${pageContext.request.contextPath}/resources/images/sangwoo_profile.png" width="150px"
						height="150px" style="margin-bottom: 20px;"></span>
					<p>
						오상우/팀원<br>오상우@muhansangsa.com
					</p>
				</div>
				<div class="col-md-6 col-lg-4">
					<span class="box"><img src="${pageContext.request.contextPath}/resources/images/hawon_profile.png" width="150px"
						height="150px" style="margin-bottom: 20px;"></span>
					<p>
						이하원/팀원<br>이하원@muhansangsa.com
					</p>
				</div>
				<div class="col-md-6 col-lg-4 mt-4">
					<span class="box"><img src="${pageContext.request.contextPath}/resources/images/jakyoung_profile.png" width="150px"
						height="150px" style="margin-bottom: 20px;"></span>
					<p>
						김자경/팀원<br>김자경@muhansangsa.com
					</p>
				</div>
				<div class="col-md-6 col-lg-4 mt-4">
					<span class="box"><img src="${pageContext.request.contextPath}/resources/images/sewon_profile.png" width="150px"
						height="150px" style="margin-bottom: 20px;"></span>
					<p>
						전세원/팀원<br>전세원@muhansangsa.com
					</p>
				</div>
				<div class="col-md-6 col-lg-4 mt-4">
					<span class="box"><img src="${pageContext.request.contextPath}/resources/images/yeram_profile.png"  width="150px"
						height="150px" style="margin-bottom: 20px;"></span>
					<p>
						문예람/팀원<br>문예람@muhansangsa.com
					</p>
				</div>
			</div>
		</div>
	</section>
     
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
