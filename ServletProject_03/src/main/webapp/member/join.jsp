<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<script src="../js/member.js"></script>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Join</h1>      
  </div>
</div>

<div class="container">
  <form action="join" method="post" id="frm">
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    
    <div class="row">
    	<div class="col">
       		<label for="userid">UserID:</label>
      		<input type="text" class="form-control" id="userid" placeholder="Enter UserID" name="userid"  readonly="readonly">
      		<!-- readonly="readonly"를 한 이유는 회원가입 창에서 아이디를 입력하지 못하게 하기 위해서 -->
    	</div>
   		<div class="col align-self-end">
      		<button type="button" class="btn btn-primary" id="idCheckBtn">중복확인</button>
    	</div>
  	</div>
    
     <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter Password" name="pwd">
    </div>
    
     <div class="form-group">
      <label for="pwd_check">Password_Check:</label>
      <input type="password" class="form-control" id="pwd_check" placeholder="Enter Password_Check" name="pwd_check">
    </div>
    
   

    <div class="form-group">
      <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email">
    </div>
    
      <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="phone" placeholder="Enter Phone" name="phone">
    </div>
    
    <!-- 라디오버튼 -->
     <div class="form-check-inline">
  		<label class="form-check-label">
    	<input type="radio" class="form-check-input" name="admin" value="0" checked>일반회원
  		</label>
	</div>
	<div class="form-check-inline">
	  	<label class="form-check-label">
	    <input type="radio" class="form-check-input" name="admin" value="1">관리자
	  	</label>
	</div>
	<br><br>
   
    <button type="button" class="btn btn-primary" id="sendBtn">Submit</button>
    <br><br>
  </form>
</div>

<%@include file="../include/footer.jsp" %>