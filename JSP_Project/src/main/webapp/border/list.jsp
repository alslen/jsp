<%@page import="com.board.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<%
	request.setCharacterEncoding("utf-8");
	BoardDAO dao = BoardDAO.getInstance();
	ArrayList<BoardDTO> arr = dao.boardList();
	int count = dao.getCount();
%>

</head>

<body>
<div class="container mt-5">
	<h3>게시글 목록(<%=count %>)</h3>
	<table class="table table-hover">	
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>

	<tbody>
<%
	for(BoardDTO board : arr){
		
%>
	<tr>
		<td><%=board.getNum() %></td>
		<!--detail.jsp로 num값을 꼭 넘겨줘야함 -->
		<td><a href="detail.jsp?num=<%=board.getNum()%>"><%=board.getSubject() %></a></td>
		<td><%=board.getWriter() %></td>
		<td><%=board.getReg_date() %></td>
		<td><%=board.getReadcount() %></td>
	</tr>
<% 
	}
%>
	</tbody>
</table>
</div>

</body>
</html>