<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<script>

// $는 jquery를 의미함
	$(document).ready(function(){   // 밑에 있는 내용 생성된 이후에 ready함수 실행
		$("#btn").click(function(){
			if($("#name").val()=="") {   // # : id를 뜻함, id=name안에 값이 없다면
				alert("이름 입력")
				return
			}
			
			if($("#kor").val()=="" || isNaN($("#kor").val() )){  // id=kor에 들어있는 값을 가져옴, kor안에 값이 없거나 kor값이 문자라면
				alert("국어점수 입력")
				$("#kor").val("")  //공백으로 대치된다.
				return
			}
			if($("#eng").val()=="" || !$.isNumeric($("#eng").val() )){  // eng안에 값이 없거나 숫자가 아니면 / $.isNumeric : 숫자인지 확인 -> 숫자:true, 문자:false
				alert("영어점수 입력")
				$("#eng").val("")
				return
			}
			if($("#math").val()=="" || !$.isNumeric($("#math").val() )) {
				alert("수학점수 입력")
				$("#math").val("")
				return
			}
			
			$("#frm").submit();
		})
	}) 
		
</script>

</head>
<body>
	<form action="scoreResult.jsp" method="get" id="frm">
		<!-- onsubmit="return check()": 리턴의 결과 값이 따라 action이 실행됨 -->
		이름 : <input type="text" name="name" id="name"> <br /> 국어 : <input
			type="text" name="kor" id="kor"> <br /> 영어 : <input
			type="text" name="eng" id="eng"><br /> 수학 :<input type="text"
			name="math" id="math"><br /> <input type="button"
			value="jquery전송" id="btn" />
		<!-- 버튼을 클릭하면 check()함수 실행 -->
	</form>

</body>
</html>