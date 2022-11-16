<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="insert.addr">insert</a>
<h3>Address 목록(${count })</h3>
<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>우편번호</th>
			<th>전화번호</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${arr }" var="address">
		<tr>
			<td>${address.num }</td>
			<td>${address.name }</td>
			<td><a href="view.addr?num=${address.num }">${address.addr }</a></td>
			<td>${address.zipcode }</td>
			<td>${address.tel }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>