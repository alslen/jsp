<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@page import="com.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

%>
<jsp:useBean id="member" class="com.member.dto.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

<%
	MemberDAO dao = MemberDAOImpl.getInstance();
	dao.memberUpdate(member);
	session.invalidate();  // 세션을 끊고
	response.sendRedirect("loginForm.jsp");  //로그인 페이지로 이동
%>