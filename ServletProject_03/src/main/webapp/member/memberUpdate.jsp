<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<script src="../js/member.js"></script>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>회원 변경</h1>      
  </div>
</div>

<div class="container">
  <form action="memberUpdate" method="post" id="frm">
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="${member.name}">
    </div>
    
    <div class="form-group">
       	<label for="userid">UserID:</label>
      	<input type="text" class="form-control" id="userid" placeholder="Enter UserID" name="userid" value="${member.userid}" readonly="readonly">
      	<!-- readonly="readonly"를 한 이유는 회원가입 창에서 아이디를 입력하지 못하게 하기 위해서 -->
    </div>
   		
     <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter Password" name="pwd" value="${member.pwd }" readonly="readonly">
    </div>
    
     <div class="form-group">
      <label for="pwd_check">Password_Check:</label>
      <input type="password" class="form-control" id="pwd_check" placeholder="Enter Password_Check" name="pwd_check">
    </div>
    
   
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email" value="${member.email}">
    </div>
    
     <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="phone" placeholder="Enter Phone" name="phone" value="${member.phone}">
    </div>
    
      <div class="form-group">
      <label for="phone">Admin:</label>
      <input type="hidden" class="form-control" id="admin" placeholder="Enter Admin" name="admin" value="${member.admin}" readonly="readonly">
    </div>
    
 
    
    <button type=submit class="btn btn-primary">수정하기</button>
    <br><br>
  </form>
</div>

<%@include file="../include/footer.jsp" %>