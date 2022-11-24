<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<script>
function del(){
	if(confirm('정말 삭제할까요?')){
		location.href="memberDelete?userid=${member.userid}";
	}
}
</script>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Member Detail</h1>      
  </div>
</div>


<div class = "container">
	<table class="table">
	<tr>
		<th>이름</th>
		<td>${member.name }</td>
	<tr>
	
	<tr>
		<th>아이디</th>
		<td>${member.userid}</td>
	<tr>

	<tr>
		<th>이메일</th>
		<td>${member.email}</td>
	<tr>
	<tr>
		<th>전화번호</th>
		<td>${member.phone}</td>
	<tr>
	<tr>
		<th>회원등급</th>
		<c:if test="${member.admin==1}">
			<td>관리자</td>
		</c:if>
		<c:if test="${member.admin==0}">
			<td>일반회원</td>
		</c:if>
	</table>
	
	
	<input type="button" value="수정" class="btn btn-primary" onclick="location.href='memberUpdate?userid=${member.userid}'">
	<input type="button" value="삭제" class="btn btn-primary" onclick="del()"><br>
</div>
	
<c:if test="${flag==1 }">
	<script>
		alert("삭제성공")
		location.href="join";
		<%
		session.invalidate();
		%>
	</script>
</c:if>
<c:if test="${flag==0 }">
	<script>
		alert("삭제실패")
		location.href="memberDetail?userid=${member.userid}";
	</script>
</c:if>	


<%@include file="../include/footer.jsp" %>