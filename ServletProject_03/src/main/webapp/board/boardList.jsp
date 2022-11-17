<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Board List</h1>      
  </div>
</div>

<div class="container mt-5">
	<table class="table table-hover">	
		<thead>
			<tr>
				<th>번호</th>
				<th>Userid</th>
				<th>Subject</th>
				<th>Email</th>
				<th>Content</th>
				<th>날짜</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${arr}" var="board">
		<tr>
			<td>${board.num }</td>
			<td>${board.userid }</td>
			<td><a href="boardDetail?num=${board.num}">${board.subject }</a></td>
			<td>${board.email }</td>
			<td>${board.content }</td>
			<td>${board.regdate }</td>
			
		</tr>
	</c:forEach>
	</tbody>
</table>
	<div align="right">
		<input type="button" value="글쓰기" class="btn btn-primary" onclick="location.href='boardWrite.jsp'">
	</div>
</div>

<%@include file="../include/footer.jsp" %>