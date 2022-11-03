<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(document).ready(function() {  // document : 생략 가능
		$("#btn").click(function() {
			if($("#name").val()==""){
				alert("이름 입력")
				return
			}
			if($("#age").val()==""){
				alert("나이 입력")
				return
			}
			// 관심분야 선택 안하면 선택하라는 alert
			if($("input:checkbox[name='hobby']:checked").length==0) {  // 체크된 개수가 하나도 없으면, length:전체 개수
				// type으로 접근 가능, input타입의 checkbox중에서 name이 hobby인거 찾아라.
				alert("관신분야 선택")
				return
			} 
			$("#frm").submit();
		})
	})
</script>
</head>
<body>

	<form action="FormResult.jsp" method="get" id="frm">
		<!-- action = "서버파일" : 서버 쪽으로 값을 전달 -->
		<!-- Post 방식은 보안이 더 뛰어남 -->
		<!-- Get 방식은 속도가 빠름(보안이 떨어짐) -->
		이름 : <input type="text" name="name" id="name"> <br />
		<!-- name을 지정해줘서 값을 전달 -->
		나이 : <input type="text" name="age" id="age"> <br /> 성별 : 남자<input
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
		</select><br> <input type="button" value='jquery전송' id="btn" />
		<!-- submit은 서버에서 전달해줌 -->
	</form>

</body>
</html>