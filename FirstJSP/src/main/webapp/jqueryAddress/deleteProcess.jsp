<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	JAddressDAO dao = JAddressDAOImpl.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	dao.delete(num);
	response.sendRedirect("addrList.jsp");
%>