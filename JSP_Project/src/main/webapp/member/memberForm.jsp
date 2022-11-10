<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- <script src="../JS/member.js"></script> --> <!-- 상대경로를 사용 : ..이 내 파일 위에 있는 폴더를 가리킴-->
<script src = "/JSP_Project/JS/member.js"></script> <!-- 절대경로를 사용 -->
<!-- 내 프로젝트를 root로 잡을 수도 있음 -> 프로젝트 이름을 사용안할 수 있음 -->

</head>
<body>

<div class="container mt-3">
<div align="right">
	<a href="memberList.jsp">전체보기</a><br><br>
</div>
  <h2>회원가입</h2>
  <form action="memberInsertPro.jsp" method="post" id="frm">
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    
    <div class="row">
    	<div class="col">
       		<label for="userid">UserID:</label>
      		<input type="text" class="form-control" id="userid" placeholder="Enter UserID" name="userid" readonly="readonly">
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
  </form>
</div>

</body>
</html>