<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- core를 c로 사용하겠다. -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 사용할 수 있음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL 사용</h3>
	첫번째 수 : ${param.num1}<!-- el표기법(변수선언x) --> <br/> 
	두번째 수 : ${param.num2}<br/> <!-- add.jsp에서 num2값을 받아옴 -->
	<hr>
	
	결과 : ${param.num1+param.num2}<br>
	
	<c:set var="hap" value="${param.num1+param.num2}"/><!-- hap이라는 변수에 value값을 넣음 -->
	hap : ${hap}<br>
	hap : <c:out value="${hap}"/> <br> <!-- jstl의 표기법(출력) -->
	
	<c:if test="${hap%2==0}"> <!-- test뒤에 조건을 넣어줌 -->
		${hap} : 짝수
	</c:if> 
	<c:if test="${hap%2!=0}"> <!-- jstl은 esle가 없음 -->
		${hap} : 홀수
	</c:if> 
	<hr/>
	
	<!-- switch문과 비슷 -->
	<c:choose>
		<c:when test="${hap%2==0}">짝수</c:when> 
		<c:when test="${hap%3==0}">3의 배수</c:when>
		<c:otherwise>짝수도 3의 배수도 아니다.</c:otherwise>
	</c:choose>
</body>
</html>