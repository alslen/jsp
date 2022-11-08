<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String method = request.getParameter("method");
	
	String str = "[처리결과]<br/>";
	str+="id : "+id+"<br/>";
	str+="pwd : "+pwd+"<br/>";
	str+="method : " + method+"<br/>";
	
	out.println(str);
%>