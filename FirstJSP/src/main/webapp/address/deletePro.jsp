<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	AddressDAO dao = AddressDAO.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	dao.addrDelete(num);
	response.sendRedirect("list.jsp");  // deletePro.jsp페이지를 보이지 않게 하기 위해서
%>