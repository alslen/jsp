<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");  // method가 post이면 한글이 깨지기 때문에 한글을 깨지지 않게 하기 위해 
%>
<jsp:useBean id="sb" class="com.exam.ScoreBean"></jsp:useBean> <!-- 입력한 값을 넣어줌 -->
<!--com.exam.ScoreBean을 sb로 하겠다는 의미  -->
<jsp:setProperty property="*" name="sb"/> <!-- name은 위에 지정한 id를 가르킴 -->
<!-- 멤버 변수에 값을 다 넣을 것이기 때문에 property="*"을 사용함 -->
<!-- 입력한 값을 sb(com.exam.ScoreBean)에 넣을 것이다. -->

<body>

	이름 :<jsp:getProperty property="name" name="sb"/><br> 
	국어 :<%=sb.getKor() %><br> 
	영어 :<%=sb.getEng() %><br> 
	수학 :<%=sb.getMath() %><br> 
	<!-- <jsp:getProperty property="name" name="sb"/>와 <%=sb.getKor() %>는 같은 의미이다.-->
	총점 : <%=sb.getTotal() %><br>
	평균 : <%=sb.getAvg() %><br>
	학점 : <%=sb.getGrade() %><br>
</body>
</html>