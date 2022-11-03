<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
// 스크립트릿 (JSP를 사용하겠다는 표시)
String name = request.getParameter("name");  // 클라이언트가 전달하고하자는 name의 값을 받아옴
String addr = request.getParameter("addr");  // 클라이언트가 전달하고하자는 addr의 값을 받아옴
%>
	이름 서버 :
	<% out.println(name); %><br />
	<!-- 전달받은 name의 값을 출력하는 문구 -->
	주소 서버 :
	<% out.println(addr); %>
	<hr />
	이름 :
	<%=name %><br>
	<!-- 표현식을 이용해서 출력가능(더 많이 사용) -->
	주소 :
	<%=addr %><br>
</body>
</html>