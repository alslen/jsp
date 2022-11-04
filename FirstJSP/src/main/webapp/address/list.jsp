<%@ page import="java.util.ArrayList" %>
<%@ page import="com.address.AddressDAO" %>
<%@ page import="com.address.Address" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체보기</title>
<%
	AddressDAO dao = AddressDAO.getInstance();
	ArrayList<Address> arr = dao.addressList();
%>
</head>
<body>
<a href="insert.jsp">추가하기</a><br><br>
<% // 표현식은 스크립트릿 안에 사용 못함
	for(int i=0; i<arr.size(); i++){  // 위치를 알 수 있다.
%>		
		<%=arr.get(i).getNum()%>
		<%=arr.get(i).getName()%>
		<%=arr.get(i).getZipcode()%>
		<%=arr.get(i).getAddr()%>
		<%=arr.get(i).getTel()%>
		<br/>
<% }  %>

<hr>

<% // 표현식은 스크립트릿 안에 사용 못함
	for(Address ad : arr){  // 처음부터 끝까지 돌린다.
%>		
		<%=ad.getNum()%>
		<%=ad.getName()%>
		<%=ad.getZipcode()%>
		<%=ad.getAddr()%>
		<%=ad.getTel()%>
		<br/>
<% }  %>

</body>
</html>