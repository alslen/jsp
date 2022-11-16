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
이름 : ${p.name} / <c:out value="${p.name }"></c:out><br>
나이 :	${p.age} <br>
성별 : ${p.gender} <br>
취미 : ${p.hobby} <br>
직업 : ${p.job} <br>
<hr/>

직업 : 
<c:forEach items="${p.hobby}" var="h"> <!-- var의 경우는 items에 담겨있는 List 객체를 변수를 통하여 화면에 보여줄수가 있습니다.-->
${h}
</c:forEach>

</body>
</html>