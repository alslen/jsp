<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ad" class="com.address.Address"></jsp:useBean>
<jsp:setProperty property="*" name="ad"/> <!-- ad(Address.java)로 값을 전달 -->

<% 
	AddressDAO dao = AddressDAO.getInstance(); //static은 클래스 이름으로 접근
	dao.addrInsert(ad);// 추가
	response.sendRedirect("list.jsp");  // list.jsp로 응답해라.
%>