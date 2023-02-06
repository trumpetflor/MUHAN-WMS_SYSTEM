<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




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
	



</style>
<!-- <script src="resources/js/jquery-3.6.3.js"></script> -->
<script type="text/javascript">


//ajax 그만,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,ㅎ ㅏ
 $(function () {
	let product_cd = ${product_cd};
	let existStock_cd = ${stock_cd};
	 $("select[name=warehouse]").on("change",function(){
		let wh_cd = $("select[name=warehouse] option:selected").val();
// 		alert(wh_cd);
			
			//wh_cd 코드가 있는 창고 내 구역 값 가져오기
			$.ajax({
					
			        type: "get",
			        url: "searchWarehouseArea.ajax",
			        data: {
			        	"wh_cd": wh_cd
			        },
			         
			        contentType: 'application/json;charset=UTF-8',
			        success: function(data,status,xhr) {
			        	
			        
			        		$("#warehouse_area").empty();
				     		for(let wh of JSON.parse(data)){
// 				     			alert(wh.wh_area);
					     		let result = "<option value=\'" + wh.wh_area_cd +"\'>"+wh.wh_area+"</option>";
					     		$("#warehouse_area").append(result)
				     		
				     		 }
			     	 
			        },
			        error: function(xhr,status,error) {
			            console.log(error);
			        }
				
				});//$.ajax({
				
	 });
				
	 $("select[name=warehouse_area]").on("change",function(){
		 
	 		//선택된 창고 내 구역 PK가져오기
			let wh_area_cd = $("select[name=warehouse_area] option:selected").val();
// 	 		alert(wh_area_cd);
			
			//wh_area_cd 코드가 있는 창고구역 내 선반 값 가져오기
			$.ajax({
					
			        type: "get",
			        url: "searchWhAreaLocation.ajax",
			        data: {
			        	"wh_area_cd": wh_area_cd,
			        	"product_cd":product_cd
			        },
			         
			        contentType: 'application/json;charset=UTF-8',
			        success: function(data,status,xhr) {
			        	
// 			        		alert(JSON.stringify(JSON.parse(data)));
			        		
			        		$("#warehouse_in_area").empty();
				     		for(let loc of JSON.parse(data)){
				     			
					     		let result = "<option value=\'" + loc.wh_loc_in_area_cd +"\'>"+loc.wh_loc_in_area+"</option>";
					     		$("#warehouse_in_area").append(result)
				     		 }
			     	 
			        },
			        error: function(xhr,status,error) {
			            console.log(error);
			        }
				
				});//$.ajax({
				
	 });	
	//새 위치에 품목 추가 버튼 클릭시
	$("#addProductTONewLoc").on("click",function(){
		$wh_name = $("select[name=warehouse] option:selected")
		$wh_area = $("select[name=warehouse_area] option:selected")
		$wh_loc_in_area = $("select[name=warehouse_in_area] option:selected")
		
		if($wh_name.val() == "" || $wh_area.val() == "" || $wh_loc_in_area.val() == ""){
			alert("창고 선택을 완료해주세요 !");
		}else{
			confirm("[창고]: " + $wh_name.text() + "\n[창고 내 구역]: " + $wh_area.text() + "\n[상세위치]: " + $wh_loc_in_area.text() +" 에 새 재고번호를 추가하시겠습니까?");
			
				if(confirm){//확인 클릭시 li태그 재고번호 추가
					console.log("product_cd : "+product_cd);
					console.log("wh_loc_in_area_cd : "+$wh_loc_in_area.val());
						//새 재고번호 insert하는 작업
						$.ajax({
							
					        type: "post",
					        url: "addNewLocation_productPro",
					        data: {
					        	"product_cd": product_cd,
					        	"wh_loc_in_area_cd": $wh_loc_in_area.val()
					        },
					         
					        success: function(data,status,xhr) {
// 					         alert("data : "+ data);
					         if(data > 0){
					        	  alert("새 재고번호 등록이 완료되었습니다"); 
					         }else{
					        	 alert("새 재고번호 등록에 실패했습니다."); 
					         }
					        },
					        error: function(xhr,status,error) {
					            console.log(error);
					        }
						
						});//$.ajax({
							//모달창 닫기
						 $('#modal_container_stock').modal('hide'); 
					     $('#modal_container_stock').hide();
					     $('.jquery-modal').click();
					
				}
		}
	});
	
	
				
});//$(function () {-------------------------



</script>



<div>
	<div class=" m-3 border border-light border-top-0 rounded-2 border border-1"> 
		<div class="p-2 bg-light text-black well rounded-2" >&#128505;${product_cd} 새 위치 추가 </div>
		<div class="mx-3 py-3" id="selected_empList">
		<div class= "border border-1 rounded-2 p-3">
			
			[1] 창고 선택<br>
			<select id="warehouse" name="warehouse">
				<option value="" disabled="disabled" selected="selected">-- 선택하세요 --</option>
				<c:forEach items="${warehouseList }" var="wh" varStatus="status" >
					<option value="${wh.wh_cd }">${wh.wh_name }(${ wh.wh_addr})</option>
				</c:forEach>
			</select>
			<br><br>
			[2] 창고 내 구역 선택<br>
			<select id="warehouse_area" name="warehouse_area">
				<option value="" disabled="disabled" selected="selected">-- 선택하세요 --</option>
			</select>
			<br><br>
			[3] 창고구역 내 선반 선택<br><span style="color: red;">(* 이미 같은 품목이 존재하는 선반은 보이지 않습니다. )</span><br> 
			<select id="warehouse_in_area" name="warehouse_in_area">
				<option value="" disabled="disabled" selected="selected">-- 선택하세요 --</option>
			</select>
		</div>
		<br>
			
			<input type="hidden" value="">
			
	
	
		</div>
	</div>
</div>

