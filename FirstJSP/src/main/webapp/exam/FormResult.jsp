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
String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");

// 값 여러개를 받을 때는 getParameterValues를 사용 -> 그냥 hobby를 출력하면 주소값 출력
String[] hobby = request.getParameterValues("hobby");  // 배열로 값을 받아옴
String tmp="";

if(hobby != null) {  // hobby에 값이 있다면
// 주소의 내용을 출력하기 위해서 for문을 돌림
for(int i=0; i<hobby.length; i++){
	tmp+= hobby[i]+" ";
	}
}
String job = request.getParameter("job");
%>

	이름 :
	<% out.println(name); %><br> 나이 :
	<% out.println(age); %><br> 성별 :
	<% out.println(gender); %><br> 관심분야 :
	<% out.println(tmp); %><br> 직업 :
	<% out.println(job); %><br>
	<hr>
	직업 :
	<%=request.getParameter("job") %>
</body>
</html>