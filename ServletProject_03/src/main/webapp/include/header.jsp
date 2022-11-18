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
<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
</head>
<body>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="/board/boardlist">HOME</a>
  
  <!-- Links -->
  <ul class="navbar-nav mr-auto">
    <li class="nav-item">
      <a class="nav-link" href="/board/boardlist">게시판</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/product/plist">상품리스트</a>
    </li>
  </ul>
  
  <ul class="navbar-nav">
  <!-- 로그인을 안한 상태 -->
    <c:if test="${empty sessionScope.suser}"> <!-- sessionScope영역이 비어있다면 -->
    <li class="nav-item">
      <a class="nav-link" href="/member/login">로그인</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="/member/join">회원가입</a>
    </li>
    </c:if>
  
  <!-- 관리자라면 -->
  <c:if test="${sessionScope.suser.admin == 1}">
  <!-- 관리자모드 -->
  <li class="nav-item">
      <a class="nav-link" href="">회원목록</a>
   </li>
   <li class="nav-item">
      <a class="nav-link" href="/product/pInsert">상품등록</a>
   </li>
   <span class="navbar-text">${sessionScope.suser.name}(관리자)님 반갑습니다.</span>
  </c:if>
 
 <!-- 일반회원이라면 -->
  <c:if test="${sessionScope.suser.admin == 0}">
   <span class="navbar-text">${sessionScope.suser.name}님 반갑습니다.</span>
  </c:if>
  
  <!-- 로그인을 한 상태이면 -->
   <c:if test="${not empty sessionScope.suser}">
   <li class="nav-item">
      <a class="nav-link" href="/member/logout">로그아웃</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="/member/join">회원변경</a>
    </li>
  </c:if>
  </ul>
  
</nav>


