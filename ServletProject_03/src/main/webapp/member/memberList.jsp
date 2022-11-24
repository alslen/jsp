<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>member List(${count})</h1>      
  </div>
</div>
<div class="container mt-5">
	<table class="table table-hover">	
		<thead>
			<tr>
				<th>name</th>
				<th>userid</th>
				<th>email</th>
				<th>phone</th>
				<th>admin</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${arr }" var="member">
			<tr>
				<td>${member.name}</td>
				<td>${member.userid}</td>
				<td>${member.email}</td>
				<td>${member.phone}</td>
				<c:if test="${member.admin==1}">
					<td>관리자</td>
				</c:if>
				<c:if test="${member.admin==0 }">
					<td>일반회원</td>
				</c:if>
				
				
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<%@include file="../include/footer.jsp" %>