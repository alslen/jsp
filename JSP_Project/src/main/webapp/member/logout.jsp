<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.removeAttribute(name);  // 필요한 세션을 끊어줌
	session.invalidate();  // 전체 세션을 끊어줌
	response.sendRedirect("loginForm.jsp");  // 다시 
%>