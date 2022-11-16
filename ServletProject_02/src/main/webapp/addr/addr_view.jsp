<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

<h3>상세보기</h3>
<form action="update.addr" method="post">
<table border="1">
	<tr>
		<th>번호</th>
		<!-- readonly="readonly"를 사용해서 수정x -->
		<!-- or  disabled="disabled" : 서버에게 값을 전달하지 못함 -> disabled를 이용할려면 hidden도 사용해야함 -->
		<td><input type="text" name="num" value="${address.num }" readonly="readonly"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" value="${address.name }"></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><input type="text" name="zipcode" value="${address.zipcode }" size="7"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="addr" value="${address.addr }" size="50"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="${address.tel}"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정">
			<input type="button" value="삭제" onclick="location.href='delete.addr?num=${address.num}'">
			<input type="button" value="전체보기" onclick="location.href='list.addr'">
		</td>
	</tr>
</table>
</form>

</body>
</html>