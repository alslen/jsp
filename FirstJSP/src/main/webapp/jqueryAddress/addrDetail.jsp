<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<%
	request.setCharacterEncoding("utf-8");  // 인코딩
	int num = Integer.parseInt(request.getParameter("num"));  // num을 넘겨주기 위해
	JAddressDAO dao = JAddressDAOImpl.getInstance();  // dao객체 생성
	AddressVO avo = dao.findByNum(num);  // 상세보기 호출
%>
<script>
	function del() {
		if(confirm("정말 삭제할까요?")) {  // 확인 버튼 : true반환, 취소 버튼 : false반환
			location.href="deleteProcess.jsp?num=<%=num%>";
		}
	}
	
	function zipRead(){
		window.open("zipCheck.jsp", "", "width=700 height=400")
	}
	
</script>
</head>
<body>

<h3>상세보기</h3>

<form action="updateProcess.jsp" method="post">
<!-- 사용자한테는 안보이지만 서버에게 넘어감 -->
<!-- hidden은 form밑에 두는 것이 좋다. -->
<%-- <input type="hidden" name="num" value="<%=ad.getNum()%>"> --%>
<table>
	<tr>
		<th>번호</th>
		<!-- readonly="readonly"를 사용해서 수정x -->
		<!-- or  disabled="disabled" : 서버에게 값을 전달하지 못함 -> disabled를 이용할려면 hidden도 사용해야함 -->
		<td><input type="text" name="num" value="<%=avo.getNum()%>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" value="<%=avo.getName()%>"></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><input type="text" name="zipcode" id="zipcode" value="<%=avo.getZipcode()%>" size="7">
			<input type="button" value="검색" onclick="zipRead()">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="addr" id="addr" value="<%=avo.getAddr()%>" size="50"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="<%=avo.getTel()%>"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정">
			<input type="button" value="삭제" onclick="del()">
			<input type="reset" value="취소">
			<input type="button" value="전체보기typebutton" onclick="location.href='addrList.jsp'">
			<button type="button">전체보기</button> <!-- type의 기본이 submit기능을 함 / form태그의 action으로 던저짐-->
		</td>
	</tr>
</table>
</form>

</body>
</html>