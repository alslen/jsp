<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="FormResult.jsp" method="get">
		<!-- action = "서버파일" : 서버 쪽으로 값을 전달 -->
		<!-- Post 방식은 보안이 더 뛰어남 -->
		<!-- Get 방식은 속도가 빠름(보안이 떨어짐) -->
		이름 : <input type="text" name="name"> <br />
		<!-- name을 지정해줘서 값을 전달 -->
		나이 : <input type="text" name="age"> <br /> 성별 : 남자<input
			type="radio" name="gender" value='남' checked>
		<!-- 하나만 선택됨 -->
		여자<input type="radio" name="gender" value='여'><br> 관심분야 :
		운동<input type="checkbox" value='운동' name="hobby">
		<!-- value속성을 이용해서 서버에 값을 전달 -->
		게임<input type="checkbox" value='게임' name="hobby">
		<!-- 같은 name으로 만들어줘야함 -->
		등산<input type="checkbox" value='등산' name="hobby"> 영화<input
			type="checkbox" value='영화' name="hobby"><br>
		<!--checkbox는 여러개 선택됨 -->
		직업 : <select name="job">
			<option>학생</option>
			<option>공무원</option>
			<option>회사원</option>
			<option>기타</option>
		</select><br> <input type="submit" value='클릭' />
		<!-- submit은 서버에서 전달해줌 -->
	</form>

</body>
</html>