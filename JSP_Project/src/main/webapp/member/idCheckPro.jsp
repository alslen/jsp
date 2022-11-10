<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid= request.getParameter("userid");
	MemberDAO dao = MemberDAOImpl.getInstance();  // DB에 있는 userid와 입력한 userid가 같은지 확인하기 위해 DB사용
	String flag = dao.idCheck(userid);
	out.println(flag);
%>