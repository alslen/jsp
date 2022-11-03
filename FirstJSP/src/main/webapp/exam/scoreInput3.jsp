<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check() {
		if(document.getElementById("name").value==""){  // getElmentById("id")를 사용하면 html 태그 내에 해당 id를 가지고 있는 태그를 불러와 
														//요소 객체로 반환할 수 있게 된다.	
			alert("이름을 입력하세요.")
			return false 
		}
		if(document.getElementById("kor").value=="" || isNaN(document.getElementById("kor").value)){  // id=kor인 객체의 값이 null이면
			alert("숫자로 국어점수를 입력하세요.")
			document.getElementById("kor").value=""  // alert창 뜨고 나서 입력창의 글자가 지워짐.
			return false//중단
		}
		if(document.getElementById("eng").value=="" || isNaN(document.getElementById("eng").value)){ // isNaN()함수는 문자인지 확인 -> 문자면 true, 문자가 아니면 false
			alert("숫자로 영어점수를 입력하세요.")
			document.getElementById("eng").value=""
			return false
		}
		if(document.getElementById("math").value=="" || isNaN(document.getElementById("math").value)){ 
			alert("숫자로 수학점수를 입력하세요.")
			document.getElementById("math").value=""
			return false  //리턴이 false일때 action으로 넘어가지x
		}
		return true // 리턴이 true일때 action으로 넘어감
	}
</script>
</head>
<body>
	<form action="scoreResult.jsp" method="get" id="frm"
		onsubmit="return check()">
		<!-- onsubmit="return check()": 리턴의 결과 값이 따라 action이 실행됨 -->
		이름 : <input type="text" name="name" id="name"> <br /> 국어 : <input
			type="text" name="kor" id="kor"> <br /> 영어 : <input
			type="text" name="eng" id="eng"><br /> 수학 :<input type="text"
			name="math" id="math"><br /> <input type="submit"
			value="submit 전송">
		<!-- 버튼을 클릭하면 check()함수 실행 -->
	</form>

</body>
</html>