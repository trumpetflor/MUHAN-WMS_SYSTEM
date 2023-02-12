<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>품목 코드</th>
				<th>품목명</th>
				<th>입고예정수량</th>
				<th>미입고수량</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${in_array }" var="in">
           	<tr>
           		<td>${in.product_cd }</td>
           		<td>${in.product_name }</td>
           		<td>${in.in_schedule_qty }</td>
           		<td>${in.no_in_qty }</td>
           	</tr>
           	</c:forEach>
        </tbody>
	</table>
</body>
</html>