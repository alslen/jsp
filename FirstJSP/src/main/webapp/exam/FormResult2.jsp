<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="fb" class="com.exam.FormBean"></jsp:useBean>
<jsp:setProperty property="*" name="fb"/>
<%

// 배열의 내용을 출력해주기 위해 사용
	String[] h = fb.getHobby();
	String tmp = "";
	for(int i=0; i<h.length; i++){
		tmp +=h[i] + " ";
	}
%>
<body>
		이름 : <jsp:getProperty property="name" name="fb"/><br> 
		나이 : <%=fb.getAge() %><br> 
		성별 : <%=fb.getGender() %><br> 
		관심분야 :<%=tmp %><br>  <!--  <%=fb.getHobby() %>는 주소를 출력해주기 때문에 출력할때 사용x-->
		직업 : <%=fb.getJob() %><br>
	
</body>
</html>