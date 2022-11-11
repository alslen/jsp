<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="com.board.dto.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>

<%
	BoardDAO dao = BoardDAO.getInstance();

	String ip = request.getRemoteAddr();  // 접속한 url ip 주소를 알려줌
	board.setIp(ip);
	dao.boardInsert(board);
	
	response.sendRedirect("list.jsp");
%>