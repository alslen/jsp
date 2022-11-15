<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>구구단</h3>
<!-- for문 -->
<!-- 1부터 9까지 돌아라 -->
<!-- step이라는 키워드러 2씩 증가할 수 있게 만들 수 있음, 기본값은 1씩증가 -->
<c:forEach begin="1" end="9" var="dan"> <!-- var은 변수를 선언하는 키워드 -->
	${dan}단<br>
	<c:forEach begin="1" end="9" var="k">
		${dan}*${k} = ${dan*k} <br>
	</c:forEach>
</c:forEach>


<hr>
<%
	for(int i=1; i<10; i++){
%>
		<%=i %>단<br>
<% 
		for(int j=1; j<10; j++){
%>
		<%=i %>*<%=j %>=<%=i*j %><br>
<%
		}
%>
		<br>
<% 
	}
%>
</body>
</html>