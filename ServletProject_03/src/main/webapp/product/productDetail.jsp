<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>상품 상세보기</h1>      
  </div>
</div>

<div class="d-flex container">
	<div class="card" style="width:400px">
		<img class="card-img-top" src="/upload/${product.filename}" alt="Card image"/>
	</div>
<div class = "container">
	<table class="table table-borderless" style="width:400px">
		<tr>
			<th>상품명</th>
			<td>${product.pname}</td>
		<tr>
		<tr>
			<th>상품가격</th>
			<td>${product.unitPrice}</td>
		<tr>
		<tr>
			<th>상품설명</th>
			<td>${product.description}</td>
		<tr>
		<tr>
			<th>제조사</th>
			<td>${product.manufacturer}</td>
		<tr>
		<tr>
			<th>분류</th>
			<td>${product.category}</td>
		<tr>
		<tr>
			<th>상태</th>
			<td>${product.condition}</td>
		</tr>
	</table>
	<button type="button" class="btn btn-primary">장바구니</button>
</div>
</div>

<%@include file="../include/footer.jsp" %>