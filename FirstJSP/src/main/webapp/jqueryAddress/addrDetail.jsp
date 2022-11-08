<%@page import="com.address.Address"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<%
	request.setCharacterEncoding("utf-8");  // 인코딩
	AddressDAO dao = AddressDAO.getInstance();  // dao객체 생성
	int num = Integer.parseInt(request.getParameter("num"));  // num을 넘겨주기 위해
	Address ad = dao.getDetail(num);  // 상세보기 호출
%>
<script>
	function del() {
		if(confirm("정말 삭제할까요?")) {  // 확인 버튼 : true반환, 취소 버튼 : false반환
			location.href="deletePro.jsp?num=<%=num%>";
		}
	}
</script>
</head>
<body>

<h3>상세보기</h3>

<form action="updatePro.jsp" method="post">
<!-- 사용자한테는 안보이지만 서버에게 넘어감 -->
<!-- hidden은 form밑에 두는 것이 좋다. -->
<%-- <input type="hidden" name="num" value="<%=ad.getNum()%>"> --%>
<table>
	<tr>
		<th>번호</th>
		<!-- readonly="readonly"를 사용해서 수정x -->
		<!-- or  disabled="disabled" : 서버에게 값을 전달하지 못함 -> disabled를 이용할려면 hidden도 사용해야함 -->
		<td><input type="text" name="num" value="<%=ad.getNum()%>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" value="<%=ad.getName()%>"></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><input type="text" name="zipcode" value="<%=ad.getZipcode()%>" size="7"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="addr" value="<%=ad.getAddr()%>" size="50"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="<%=ad.getTel()%>"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정">
			<input type="button" value="삭제" onclick="del()">
		</td>
	</tr>
</table>
</form>

</body>
</html>