<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

 $("#seachInputBtn").on("click",function(){
	 $("#product-tbody").empty();
		let keyword = $("#seachInput").val();
		$.ajax({
			url:"findProduct_StockExist_search.ajax",
		    type: "get",
		    data:{
		    	"keyword":keyword
		    },
		    contentType: 'application/json;charset=UTF-8',
		    success: function(data,status,xhr) {
		    	
		    	
		    	if(JSON.stringify(JSON.parse(data)) == "[]"){
					let msg = "<tr><td colspan='4'>검색된 결과가 없습니다.</td></tr>"
				
						$("#product-tbody").prepend(msg);
				}

		    	for(let pro of JSON.parse(data)){
					let code = "<tr>"
									+"<td id='"+pro.product_cd+"'>"+pro.product_cd+"</td>"
									+"<td>"+pro.product_name+"</td>"
								"</tr>"
		    	$("#product-tbody").append(code)
		    	}
		    },
	        error: function(xhr,status,error) {
	            console.log(error);
	        }
			
		});
 });

</script>
</head>
<body>

<div class="input-group m-3">
	  <input type="search" class="form-control rounded-start" placeholder="Search" aria-label="Search" aria-describedby="search-addon" id="seachInput"/>
	  <button type="button" id="seachInputBtn" class="btn btn-dark">search</button>
</div>

<table class="table table-hover">
	<thead>
		<tr>
			<td>상품코드</td>
			<td>상품명</td>
		</tr>
	</thead>
	<tbody id="product-tbody">
		<c:forEach items="${product }" var="p">
		<tr>
			<td id="${p.product_cd }">${p.product_cd }</td>
			<td>${p.product_name }</td>
		</tr>
		
		</c:forEach>
	</tbody>

</table>
</body>
</html>