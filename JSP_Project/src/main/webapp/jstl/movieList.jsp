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
<%
	String[] movieList={"영화1","영화2","영화3","영화4","영화5"};
	pageContext.setAttribute("movieList", movieList);  // movieList로 다섯개의 값들을 접근할 수 있음
%>
<table>
	<tr>
		<th>index</th>
		<th>count</th>
		<th>title</th>
	</tr>
	<c:forEach items="${movieList}" var="movie" varStatus="st"> <!-- movieList에 있는 값만큼(movieList.length) for문을 돌림-->
		<tr>
		<!-- varStatus : 위치값을 지정할 때 사용 -->
			<td>${st.index}</td> <!-- index는 0부터 -->
			<td>${st.count}</td> <!-- count는 1부터 -->
			<td>${movie}</td>
			<td>
				<c:if test="${st.first}">첫번째</c:if>
				<c:if test="${st.last}">마지막</c:if>
			</td>
		</tr>
	</c:forEach>
	
</table>
</body>
</html>