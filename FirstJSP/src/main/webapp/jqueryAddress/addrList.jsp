<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.address.AddressDAO" %>
<%@ page import="com.address.Address" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQuery전체보기</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
<script src="https://code.jquery.com/jquery-3.6.1.js"></script> <!-- 이거 꼭 넣어라. -->
  
<script>
	$(document).ready(function(){
		$("#btnSearch").click(function(){
			$.ajax({
				type : 'get',
				url : "searchProcess.jsp",  // 이 서버 페이지는 입력받은 데이터들을 JSON객체로 변경하는 페이지
				data : {
					field : $("#field").val(),
					word : $("#word").val()
				},
				success : function(resp){
					//alert(resp)
					var d = JSON.parse(resp);  // 파싱작업
					//alert(d.countObj.count)  // countObj안에 있는 count의 값을 출력
					var str="";
					$.each(d.jarrObj,function(key,val){
						str+="<tr>"
						str+="<td>"+val.num+"</td>"
						str+="<td><a href='addrDetail.jsp?num="+val.num+"'>"+val.name+"</a></td>"
						str+="<td>"+val.zipcode+"</td>"
						str+="<td>"+val.addr+"</td>"
						str+="<td>"+val.tel+"</td>"
						str+="</tr>"
					})  //each
					$("table tbody").html(str);  // table밑에 있는 tbody에 위치 시켜줌
					$("#cntSpan").text(d.countObj.count)
					
				},
				error : function(e){
					alert(e+"error")
				}
				
			})  // ajax
		}) // btnSearch click
	})  // document
</script>

<%
	JAddressDAO dao = JAddressDAOImpl.getInstance();
	ArrayList<AddressVO> varr = dao.list();
	int count = dao.getCount();
%>
</head>

<body>
<div class="container">
<div align="right">
	<a href="insert.jsp">추가하기</a><br><br>
</div>

<h3>JqueryAddress 전체보기(<span id="cntSpan"><%=count %></span>)</h3>

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

<tbody>
<% // 표현식은 스크립트릿 안에 사용 못함
	for(AddressVO vad : varr){  // 처음부터 끝까지 돌린다.
%>		
		<tr>
		<td ><%=vad.getNum()%></td>
		<!-- a태그는 get방식으로 값을 전달 -> 직접 지정해줘야함 -->
		<!-- 값을 달고 가야함 -->
		<td><a href="addrDetail.jsp?num=<%=vad.getNum()%>"><%=vad.getName()%></a></td>
		<td ><%=vad.getZipcode()%></td>
		<td ><%=vad.getAddr()%></td>
		<td ><%=vad.getTel()%></td>
		</tr>

<% }  %>
</tbody>
</table>

	<select name="field" id="field">
		<option value = "name">이름</option>
		<option value = "addr">주소</option>
	</select>
	<input type="text" name="word" id="word">
	<input type="button" value="검색" id="btnSearch">
</div>

</body>
</html>