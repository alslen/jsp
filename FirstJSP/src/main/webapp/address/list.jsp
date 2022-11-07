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
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<%
	AddressDAO dao = AddressDAO.getInstance();
	ArrayList<Address> arr = dao.addressList();
	int count = dao.getCount();
%>
</head>

<body>
<div class="container">
<div align="right">
	<a href="insert.jsp">추가하기</a><br><br>
</div>

<h3>전체보기(<%=count %>)</h3>

<% // 표현식은 스크립트릿 안에 사용 못함
	//for(int i=0; i<arr.size(); i++){  // 위치를 알 수 있다.
%>		
<!-- <table border="1"  width="800"> -->
<!-- 		<tr> -->
<%-- 		<td width="50"><%=arr.get(i).getNum()%></td> --%>
<%-- 		<td width="100"><%=arr.get(i).getName()%></td> --%>
<%-- 		<td width="100"><%=arr.get(i).getZipcode()%></td> --%>
<%-- 		<td width="400"><%=arr.get(i).getAddr()%></td> --%>
<%-- 		<td width="150"><%=arr.get(i).getTel()%></td> --%>
<!-- 	</tr> -->
<!-- </table> -->
<% //}  %>

<hr>

<table class="table table-hover">
<thead>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>우편번호</th>
		<th>주소</th>
		<th>전화번호</th>
	</tr>
</thead>

<% // 표현식은 스크립트릿 안에 사용 못함
	for(Address ad : arr){  // 처음부터 끝까지 돌린다.
%>		

<tbody>
		<tr>
		<td ><%=ad.getNum()%></td>
		<!-- a태그는 get방식으로 값을 전달 -> 직접 지정해줘야함 -->
		<!-- 값을 달고 가야함 -->
		<td><a href="detail.jsp?num=<%=ad.getNum()%>"><%=ad.getName()%></a></td>
		<td ><%=ad.getZipcode()%></td>
		<td ><%=ad.getAddr()%></td>
		<td ><%=ad.getTel()%></td>
		</tr>

<% }  %>
</tbody>
</table>
</div>

</body>
</html>