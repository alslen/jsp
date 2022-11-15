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
${param.id}가 좋아하는 색상은 ${param.color}입니다.

<hr>

<!-- switch문 -->
<c:choose>
	<c:when test="${param.color=='yellow'}">
		<c:set var="c" value="노랑색"/>
	</c:when>
	<c:when test="${param.color=='blue'}">
		<c:set var="c" value="파랑색"/>
	</c:when>
	<c:when test="${param.color=='orange'}">
		<c:set var="c" value="오렌지색"/>
	</c:when>
	<c:when test="${param.color=='pink'}">
		<c:set var="c" value="분홍색"/>
	</c:when>
	<c:when test="${param.color=='black'}">
		<c:set var="c" value="검은색"/>
	</c:when>
</c:choose>
${param.id}가 좋아하는 색상은 ${c}입니다. <br>
<hr>

<c:set var="name" value="${param.id}"></c:set>
<!-- 큰 따옴표 안에는 작은따옴표를 넣어야한다. -->
<c:if test="${param.id==null || param.id==''}"> <!-- id값이 null이거나 id값을 공백이면 -->
	<c:set var="name" value="GUEST"/> <!-- name에 GUEST라는 값을 넣어줌 -->
</c:if>

${name}가 좋아하는 색상은 ${c}입니다.<br>

</body>
</html>