<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	
	function check() {
		// 이름, 나이 공백인지 검사
	/*	if(document.getElementById("name").value==""){ // 값을 입력 안하면
			alert("이름을 입력하세요.")
			return
		} */
		
		if(document.querySelector("#name").value==""){  // # : id
			alert("이름을 입력하세요.")
			return
		}
		
		if(document.getElementById("age").value==""){
			alert("나이를 입력하세요.")
			return
		} 
	
		// 관심분야 선택 안하면 선택하라고 alert
		var chk_obj = document.getElementsByName("hobby") // 체크박스에 있는 값이 여러개 이기때문에 name으로 접근
		var checked = false
		//var checked = 0;
		for(i=0; i<chk_obj.length; i++){
			if(chk_obj[i].checked){  // 체크박스가 체크가 됐다면
				checked=true;
				//alert(chk_obj[i].value)  // 객체 안에 들어 있는 값을 출력해줌
			}
		}
		if(checked == false){
			alert("관심분야 선택해주세요.")
			return
		}
		//alert(chk_obj.length) : 가지고 있는 체크박스의 개수
		
		document.getElementById("frm").submit() 
	}
</script>

</head>
<body>

	<form action="FormResult.jsp" method="get" id="frm">
		<!-- action = "서버파일" : 서버 쪽으로 값을 전달 -->
		<!-- Post 방식은 보안이 더 뛰어남 -->
		<!-- Get 방식은 속도가 빠름(보안이 떨어짐) -->
		이름 : <input type="text" name="name" id="name"> <br />
		<!-- name을 지정해줘서 값을 전달 -->
		나이 : <input type="text" name="age" id="age"> <br />
		<!-- 하나일 때 id로 구현 -->
		성별 : 남자<input type="radio" name="gender" value='남' checked>
		<!-- 하나만 선택됨 -->
		여자<input type="radio" name="gender" value='여'><br> 관심분야 :
		운동<input type="checkbox" value='운동' name="hobby" id="h1">
		<!-- value속성을 이용해서 서버에 값을 전달 -->
		게임<input type="checkbox" value='게임' name="hobby" id="h2">
		<!-- 같은 name으로 만들어줘야함 -->
		등산<input type="checkbox" value='등산' name="hobby" id="h3"> 영화<input
			type="checkbox" value='영화' name="hobby" id="h4"><br>
		<!--checkbox는 여러개 선택됨 -->
		직업 : <select name="job">
			<option>학생</option>
			<option>공무원</option>
			<option>회사원</option>
			<option>기타</option>
		</select><br> <input type="button" value="button전송" onclick="check()" />
		<!-- submit은 서버에서 전달해줌 -->
	</form>

</body>
</html>