<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="testResult.jsp" method="get">
		<!-- action = "서버파일" : 서버 쪽으로 값을 전달 -->
		<!-- Post 방식은 보안이 더 뛰어남 -->
		<!-- Get 방식은 속도가 빠름(보안이 떨어짐) -->
		이름 : <input type="text" name="name"> <br />
		<!-- name을 지정해줘서 값을 전달 -->
		주소 : <input type="text" name="addr"> <br /> <input
			type="submit" value='전송' />
		<!-- submit은 서버에서 전달해줌 -->
	</form>

</body>
</html>