<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Board Detail</h1>      
  </div>
</div>


<div class = "container">
	<table class="table">
	<tr>
		<th>번호</th>
		<td>${board.num }</td>
		<th>조회수</th>
		<td>${board.readcount }</td>
	<tr>
	
	<tr>
		<th>작성자</th>
		<td>${board.userid }</td>
		<th>작성일</th>
		<td>${board.regdate }</td>
	<tr>

	<tr>
		<th>글제목</th>
		<td colspan="3">${board.subject }</td>
	<tr>
	<tr>
		<th>글내용</th>
		<td colspan="3">${board.content}</td>
	<tr>
	</table>
	<input type="button" value="수정" class="btn btn-primary" onclick="location.href='boardUpdate?num=${board.num}'">
	<input type="button" value="삭제" class="btn btn-primary">
</div>


<%@include file="../include/footer.jsp" %>