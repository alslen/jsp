<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function zipfinder(){
		// 팝업창 띄움
		//open(띄울페이지, 팝업창이름, 크기)
		window.open("zipCheck.jsp", "", "width=700 height=400");
	}
	function check() {
		if(document.getElementById("name").value==""){  											
			alert("이름을 입력하세요.")
			return false 
		}
		if(document.getElementById("zipcode").value==""){  											
			alert("우편번호를 입력하세요.")
			return false 
		}
		if(document.getElementById("addr").value==""){  											
			alert("주소를 입력하세요.")
			return false 
		}
		if(document.getElementById("tel").value==""){  								
			alert("전화번호를 입력하세요.")
			return false 
		}
		return true
	}
</script>
</head>
<body>
<a href="addrList.jsp">전체보기</a><br><br>
<form action="insertProcess.jsp" method="post" onsubmit="return check()">
	<table border="1">
		<tr>
			<td colspan="2">JQUERYADDRESS주소록 등록하기</td>
		</tr>
		<tr >
			<td>이름</td>
			<td><input type="text" name="name" id="name"></td>
		</tr>
		<tr> <!--tr:행 -->
			<td>우편번호</td> <!-- td:열 -->
			<td><input type="text" name="zipcode" id="zipcode" size=5>
			 	<input type="button" value="검색" onclick="zipfinder()">
			</td>			
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr" id="addr" size=50></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="tel" id="tel"></td>
		</tr>
		<tr>
			<td colspan="2"><!-- colspan: 열 병합을 해줌 -->
			<input type="submit" value="등록">
			 <input type="submit" value="취소">
			 </td>
		</tr>
	</table>
</form>
</body>
</html>