<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="list.jsp">전체보기</a><br><br>
<form action="insertPro.jsp" method="post">
	<table border="1">
		<tr>
			<td colspan="2">주소록 등록하기</td>
		</tr>
		<tr >
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr> <!--tr:행 -->
			<td>우편번호</td> <!-- td:열 -->
			<td><input type="text" name="zipcode" size=5>
			 	<input type="button" value="검색">
			</td>			
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr" size=50></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="tel"></td>
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