<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	MemberDAO dao = MemberDAOImpl.getInstance();
	//로그인체크
	int flag = dao.loginCheck(userid, pwd);
	if(flag == 0 || flag == 1){
		// 세션에 저장 (정보를 유지하기 위해서)
		session.setAttribute("sUserid", userid);  // 세션에 userid를 저장함
	}
	out.println(flag);
%>
