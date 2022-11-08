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
	$("#send").click(function(){  // 검색버튼 클릭
		sendIt();
	})  // send
	
	$("#dong").keydown(function(e){  // 동이름 입력하고 엔테 인식
		if(e.keyCode == 13){  // 코드값 : 13 == enter
			sendIt();
		}
	})  // keydown
	
	var sendIt = function() {
		if($("#dong").val()==""){
			alert("동이름을 입력하세요")
			return false;
		}
		$.getJSON("zipProcess.jsp",  //서버 페이지
				{ "dong" : $("#dong").val()},  // 서버에 전달할 값
				function(resp){  // 콜백함수
					//alert(resp);
					var str="<table>"
					$.each(resp, function(key,val){
						str += "<tr>"
						str += "<td>"+val.zipcode+"</td>"
						str += "<td>"+val.sido+"</td>"
						str += "<td>"+val.gugun+"</td>"
						str += "<td>"+val.dong+"</td>"
						str += "<td>"+val.bunji+"</td>"
						str+="</tr>"
					})
					str+="</table>"
					$("#result").html(str);
				}
			)  //getJSON
	} //sendIt
	
	// tr마다 클릭 이벤트 적용
	$("#result").on("click","tr", function(){
		var address = 	$("td:eq(1)",this).text()+" "+  // 현재 클릭한 tr의 값을 가져오기 위해 this를 사용, td:eq(1) : sido
						$("td:eq(2)",this).text()+" "+ // td:eq(2) : gugun
						$("td:eq(3)",this).text()+" "+  //td:eq(3) : dong
						$("td:eq(4)",this).text();  //td:eq(4) : bunji
						
		$(opener.document).find("#zipcode").val($("td:eq(0)",this).text());
		$(opener.document).find("#addr").val(address);  // val() : 괄호 안에 값을 넣어주면 set의 의미
		self.close();
	})
	
	
	
	
})//document

</script>
</head>
<body>
<table>
		<tr>
			<td>동이름 입력 : <input type="text" name="dong" id="dong"/>
			<input type="button" value="검색" id="send"/>
			</td>
		</tr>
</table>
<div id="result"></div>
</body>
</html>