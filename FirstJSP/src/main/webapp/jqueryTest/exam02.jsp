<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
<script>
	<!-- jquery를 이용하여 비동기함수를 사용할 것임 -->
	$(document).ready(function(){
		$("#getBtn").click(function(){
			//get 방식으로 전송하겠다.
			// get함수는 인자값 3개가 들어감
			$.get("process.jsp",{ // 가야할 서버 페이지
				"id" : $("#id").val(),  // 서버에 가져갈 매개변수
				"pwd" : $("#pwd").val(),
				"method" : "get"
				},
				function(resp){ //콜백함수(서버가 처리한 결과를 그대로 받음)
					// resp : 결과를 받은 변수(내가 선언함)
				
					/*alert(resp)*/
					// div에 대한 id를 사용하면 div가 선언된 곳에 값이 출력됨
					// .html()은 선택한 요소 안의 내용을 가져오거나, 다른 내용으로 바꿉니다
					$("#result").html(resp);  
				}
			)  // get
		})  //getBtn click
		
		$("#postBtn").click(function(){
			$.post(  // post 방식으로 전송
				"process.jsp",
				{
					"id" : $("#id").val(),  // # : id
					"pwd" : $("#pwd").val(),
					"method" : "post"
				},
				function(resp){
					$("#result").html(resp)
				}
			) // post
		}) //postBtn click
		
		$("#ajaxBtn").click(function(){
			
			// ajax방식은 어떻게 전달할지(post방식, get방식)를 정할 수 있음
			$.ajax({
				type:"get",  // type : "전달방식"
				url:"process.jsp",  // url : "서버 페이지"
				data:{  // 서버에 전달하는 데이터들 
					id : $("#id").val(),
					pwd : $("#pwd").val(),
					method : "ajax"
				},
				success : function(resp){   //요청이 성공일때 실행되는 callback 함수
					$("#result").html(resp);
				},
				error : function(e){  // 서버에서 처리된 결과값이 넘어오지 않으면
					alert(e+"error");
				}
				
			}) //ajax
		})  //ajaxBtn click
		
		// on은 특정이벤트와 연결시켜줌(클릭이벤트와 연결)
		$("#ajaxBtn_on").on("click",function(){
			$.ajax({
				type:"get",
				url : "process.jsp",
				data:{
					id : $("#id").val(),
					pwd : $("#pwd").val(),
					method : "ajax_on"
				},
				success : function(data){
					$("#result").html(data);
				},
				error : function(e){  
					alert(e+"error");
				}
			}) // ajax
		}) //ajax_on
		
	})  //document
	
	
</script>

</head>
<body>

	id : <input type="text" id="id" name="id"><br>
	pwd : <input type="password" id="pwd" name="pwd"><br>
	<button type="button" id="getBtn">get전송</button>
	<button type="button" id="postBtn">post전송</button>
	<button type="button" id="ajaxBtn">ajax전송</button>
	<button type="button" id="ajaxBtn_on">ajax_on전송</button>
	<hr/>
	<div id="result"></div><!-- 이 영역에 결과를 출력하기 위해서 div태그 만들어서 id를 선언-->
</body>
</html>