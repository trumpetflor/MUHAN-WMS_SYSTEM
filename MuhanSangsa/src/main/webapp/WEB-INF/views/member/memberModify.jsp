<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>사원 상세 정보 수정</title>
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

</head>
<body>
    <!-- Left Panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="" class="">

        <!-- Header-->
 
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                              <!--   <h1>사원 상세 정보 수정</h1> -->
                            </div>
                        </div>
                    </div>
<!--                     <div class="col-sm-8"> -->
<!--                         <div class="page-header float-right"> -->
<!--                             <div class="page-title"> -->
<!--                                 <ol class="breadcrumb text-right"> -->
<!--                                     <li><a href="#">Dashboard</a></li> -->
<!--                                     <li><a href="#">Forms</a></li> -->
<!--                                     <li class="active">Basic</li> -->
<!--                                 </ol> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">


                <div class="row">
<!--                     <div class="col-lg-6"> -->
<!--                         <div class="card"> -->
<!--                             <div class="card-header"> -->
<!--                                 <strong class="card-title">Credit Card</strong> -->
<!--                             </div> -->
<!--                             <div class="card-body"> -->
<!--                                 Credit Card -->
<!--                                 <div id="pay-invoice"> -->
<!--                                     <div class="card-body"> -->
<!--                                         <div class="card-title"> -->
<!--                                             <h3 class="text-center">Pay Invoice</h3> -->
<!--                                         </div> -->
<!--                                         <hr> -->
<!--                                         <form action="#" method="post" novalidate="novalidate"> -->
<!--                                             <div class="form-group text-center"> -->
<!--                                                 <ul class="list-inline"> -->
<!--                                                     <li class="list-inline-item"><i class="text-muted fa fa-cc-visa fa-2x"></i></li> -->
<!--                                                     <li class="list-inline-item"><i class="fa fa-cc-mastercard fa-2x"></i></li> -->
<!--                                                     <li class="list-inline-item"><i class="fa fa-cc-amex fa-2x"></i></li> -->
<!--                                                     <li class="list-inline-item"><i class="fa fa-cc-discover fa-2x"></i></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                             <div class="form-group"> -->
<!--                                                 <label for="cc-payment" class="control-label mb-1">Payment amount</label> -->
<!--                                                 <input id="cc-payment" name="cc-payment" type="text" class="form-control" aria-required="true" aria-invalid="false" value="100.00"> -->
<!--                                             </div> -->
<!--                                             <div class="form-group has-success"> -->
<!--                                                 <label for="cc-name" class="control-label mb-1">Name on card</label> -->
<!--                                                 <input id="cc-name" name="cc-name" type="text" class="form-control cc-name valid" data-val="true" data-val-required="Please enter the name on card" autocomplete="cc-name" aria-required="true" aria-invalid="false" aria-describedby="cc-name"> -->
<!--                                                 <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span> -->
<!--                                             </div> -->
<!--                                             <div class="form-group"> -->
<!--                                                 <label for="cc-number" class="control-label mb-1">Card number</label> -->
<!--                                                 <input id="cc-number" name="cc-number" type="tel" class="form-control cc-number identified visa" value="" data-val="true" data-val-required="Please enter the card number" data-val-cc-number="Please enter a valid card number"> -->
<!--                                                 <span class="help-block" data-valmsg-for="cc-number" data-valmsg-replace="true"></span> -->
<!--                                             </div> -->
<!--                                             <div class="row"> -->
<!--                                                 <div class="col-6"> -->
<!--                                                     <div class="form-group"> -->
<!--                                                         <label for="cc-exp" class="control-label mb-1">Expiration</label> -->
<!--                                                         <input id="cc-exp" name="cc-exp" type="tel" class="form-control cc-exp" value="" data-val="true" data-val-required="Please enter the card expiration" data-val-cc-exp="Please enter a valid month and year" placeholder="MM / YY"> -->
<!--                                                         <span class="help-block" data-valmsg-for="cc-exp" data-valmsg-replace="true"></span> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="col-6"> -->
<!--                                                     <label for="x_card_code" class="control-label mb-1">Security code</label> -->
<!--                                                     <div class="input-group"> -->
<!--                                                         <input id="x_card_code" name="x_card_code" type="tel" class="form-control cc-cvc" value="" data-val="true" data-val-required="Please enter the security code" data-val-cc-cvc="Please enter a valid security code" autocomplete="off"> -->
<!--                                                         <div class="input-group-addon"> -->
<!--                                                             <span class="fa fa-question-circle fa-lg" data-toggle="popover" data-container="body" data-html="true" data-title="Security Code" -->
<%--                                                             data-content="<div class='text-center one-card'>The 3 digit code on back of the card..<div class='visa-mc-cvc-preview'></div></div>" --%>
<!--                                                             data-trigger="hover"></span> -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                             <div> -->
<!--                                                 <button id="payment-button" type="submit" class="btn btn-lg btn-info btn-block"> -->
<!--                                                     <i class="fa fa-lock fa-lg"></i>&nbsp; -->
<!--                                                     <span id="payment-button-amount">Pay $100.00</span> -->
<!--                                                     <span id="payment-button-sending" style="display:none;">Sending…</span> -->
<!--                                                 </button> -->
<!--                                             </div> -->
<!--                                         </form> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                             </div> -->
<!--                         </div> .card -->

<!--                     </div>/.col -->

<!--                     <div class="col-lg-6"> -->
<!--                         <div class="card"> -->
<!--                             <div class="card-header"><strong>Company</strong><small> Form</small></div> -->
<!--                             <div class="card-body card-block"> -->
<!--                                 <div class="form-group"><label for="company" class=" form-control-label">Company</label><input type="text" id="company" placeholder="Enter your company name" class="form-control"></div> -->
<!--                                 <div class="form-group"><label for="vat" class=" form-control-label">VAT</label><input type="text" id="vat" placeholder="DE1234567890" class="form-control"></div> -->
<!--                                 <div class="form-group"><label for="street" class=" form-control-label">Street</label><input type="text" id="street" placeholder="Enter street name" class="form-control"></div> -->
<!--                                 <div class="row form-group"> -->
<!--                                     <div class="col-8"> -->
<!--                                         <div class="form-group"><label for="city" class=" form-control-label">City</label><input type="text" id="city" placeholder="Enter your city" class="form-control"></div> -->
<!--                                     </div> -->
<!--                                     <div class="col-8"> -->
<!--                                         <div class="form-group"><label for="postal-code" class=" form-control-label">Postal Code</label><input type="text" id="postal-code" placeholder="Postal Code" class="form-control"></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="form-group"><label for="country" class=" form-control-label">Country</label><input type="text" id="country" placeholder="Country name" class="form-control"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->

                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>사원 상세 정보</strong> 
                            </div>
                            <div class="card-body card-block">
                                <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">사원번호(코드)</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">1234567</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">사원명</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">차은우</p>
                                        </div>
                                    </div>
                                     <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">부서명</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">영업팀</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">직급</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">대리</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">연락처(개인)</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="phone_number" name="phone_number" placeholder="전화번호를 입력하세요" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">연락처(사무실)</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="office_number" name="office_number" placeholder="전화번호를 입력하세요" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email-input" class=" form-control-label">Email</label></div>
                                        <div class="col-12 col-md-9"><input type="email" id="email-input" name="email-input" placeholder="Enter Email" class="form-control"></div>
                                    </div>
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="text-input"	class="form-control-label font-weight-bold">주소</label>
										</div>
										<div class="col-12 col-md-9"><span class="form-control-static bg-gradient-light" id="postcode">부산시 진구</span>
										</div>
									</div>
									<div class="row form-group">
										<div class="col col-md-3"></div>
										<div class="col-12 col-md-8">
											<span class="form-control-static bg-gradient-light" id="addr1">도로명 주소</span>
											<small class="form-text text-muted">도로명주소</small>
										</div>
									</div>
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="text-input" class=" form-control-label"></label>
										</div>
										<div class="col-12 col-md-8">
											<span class="form-control-static bg-gradient-light" id="addr2">상세주소</span>
											<small class="form-text text-muted">상세주소</small>
										</div>
									</div>
                                   
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <label class=" form-control-label">입사일</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">2022-10-14</p>
                                        </div>
                                    </div>                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">재직여부</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="inline-radio1" name="inline-radios" value="Y" class="form-check-input">재직중
                                                </label>
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="inline-radios" value="N" class="form-check-input">퇴사
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">사진이미지</label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-input" name="file-input" class="form-control-file"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
		                    <div align="center">
								<input class="btn btn-outline-dark" type="button" value="수정" onclick="javascript:confirm_modify()">&nbsp;&nbsp;
								<input class="btn btn-outline-dark" type="button" value="취소" onclick="top.window.close()">&nbsp;&nbsp;
							</div>
                    </div>
            </div>

        </div><!-- .animated -->
    </div><!-- .content -->



</div><!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>


</body>
</html>