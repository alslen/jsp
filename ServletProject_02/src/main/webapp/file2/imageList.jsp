<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>

<div class="container">
  <h2>File Image</h2>
  <div class="row">
  <c:forEach items="${arr}" var="item">
  	<div class="col">
	  <div class="card" style="width:200px">
	    <img class="card-img-top" src="../upload/${item.image}" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">${item.title}</h4>
	      <p class="card-text">${item.name}</p>
	    </div>
	  </div>
	 </div> <!-- col -->
  </c:forEach>
  </div>
 </div>
 
</body>
</html>