<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Board Update</h1>      
  </div>
</div>

<div class = "container">
<form action="boardUpdate" method="post">
<input type="hidden" id="num" name="num" value="${board.num }"/> 
	 <div class="form-group">
      	<label for="userid">Userid:</label>
      	<input type="text" class="form-control" id="userid" placeholder="Enter userid" name="userid" value="${board.userid}" readonly="readonly">
    </div>
    
     <div class="form-group">
      	<label for="subject">Subject:</label>
      	<input type="text" class="form-control" id="subject" placeholder="Enter subject" name="subject" value="${board.subject}">
    </div>
    
     <div class="form-group">
      	<label for="email">Email:</label>
      	<input type="text" class="form-control" id="email" placeholder="Enter email" name="email" value="${board.email}" readonly="readonly">
    </div>
    
     <div class="form-group">
      	<label for="content">Content:</label>
      	<textarea class="form-control" rows="5" id="content" name="content">${board.content}</textarea>
    </div>
    
    <button type="submit" class="btn btn-primary">수정하기</button>
 </form>
</div>


<%@include file="../include/footer.jsp" %>
    