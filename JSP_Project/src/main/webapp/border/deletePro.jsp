<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	BoardDAO dao = BoardDAO.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	int flag = dao.boardDelete(num);
	if(flag == 1){
%>
		<script>
			alert("삭제성공"); // deletePro.jsp페이지에서 alert창 뜨고
			location.href = "list.jsp";  // 확인을 누르면 list.jsp페이지로 이동
		</script>
		
<%	
	} else {
%>
	<script>
	alert("삭제실패");
	location.href = "list.jsp";
	</script>
<%
	}
	
%>