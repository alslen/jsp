<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
<script>
$(document).ready(function(){
	$("#b1").click(function(){  // 값을 받아옴
		//$.get("서버페이지", 콜백함수)
		$.get("test.txt",function(resp,status){  // 전달할 데이터가 없으면 생략 가능
			var str = "데이터 : " +resp+ " 상태 : "+status;
			$("#result").text(str); //.text()는 선택한 요소 안의 내용을 가져오거나, 다른 내용으로 바꿉니다.
			//  태그는 가져오지 않습니다
		})  //get
	}) //b1
	
	$("#b2").click(function(){ // 제이슨 형태로 해석 -> 파싱한다.
		$.get("test.txt", function(resp){  // 전달받은 결과 값을 추출해서 원하는 장소에 출력하는 기능
			var d = JSON.parse(resp);  // JSON.parse() : 인수로 전달받은 문자열을 자바스크립트 객체로 변환하여 반환합니다.
			//alert(d.length)  // 객체의 개수를 나타내줌
			var str="";
			for(i=0; i<d.length; i++){
				console.log("picture : "+d[i].picture);
				str += "이름 : "+d[i].irum+"<br/>"
				str+="회원번호 : "+d[i].memberNumber+"<br/><br/>"
			}  // for
			$("#result").html(str)
		}) //get
	}) //b2
	
	$("#b3").click(function(){
		var str="";
		$.getJSON("test.txt", function(resp){  // 따로 파싱하는 작업 필요x
			$.each(resp, function(key,val){  // each : 반복문
				str +="회원번호 : "+val.memberNumber+"<br/>"
				str +="이름 : "+val.irum+"<br/>"
				str +="사진 : "+val.picture+"<br/><br/>"
			})  //each
			$("#result").html(str)
		})  //getJSON
	}) //b3
})
</script>
</head>
<body>

<button id="b1">결과1</button>
<button id="b2">결과2</button>
<button id="b3">결과3</button>
<div id="result"></div>

</body>
</html>