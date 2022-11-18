<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>상품리스트</h1>      
  </div>
</div>

<div class="container">
	<div class="row">
		<c:forEach items="${products}" var="p">
			<div class="col-4" style="width:400px">
				<div class="card" style="width:300px">
				 <img class="card-img-top" src="../upload/${p.filename}" alt="Card image" style="width:100%">
	   			<div class="card-body">
	      		<h4 class="card-title">${p.pname}</h4>
	      		<p class="card-text">${p.description}</p>
	      		<a href="pdetail?productId=${p.productId}" class="btn btn-primary">자세히보기</a>
				 </div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>


<%@include file="../include/footer.jsp" %>