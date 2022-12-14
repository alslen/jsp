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
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){  // 맨 첫시작에 페이지 번호가 없기 때문에
		pageNum = "1";
	}
	String field = "";
	String word = "";
	if(request.getParameter("word")!=null){
		field = request.getParameter("field");
		word = request.getParameter("word");
	}
	
	int currentPage = Integer.parseInt(pageNum); // 현재 페이지
	int pageSize = 5;  // 한 화면에 보여지는 게시물 수 
	
	// 한 화면에 보여지는 게시물 번호
	int startRow = (currentPage-1) * pageSize+1;  // 1 6 11
	int endRow = currentPage * pageSize;  // 5 10 15
	
	
	BoardDAO dao = BoardDAO.getInstance();
	ArrayList<BoardDTO> arr = dao.boardList(field,word, startRow, endRow);
	int count = dao.getCount(field,word);
%>

</head>

<body>
<div class="container mt-5">
	<div align="right">
		<a href="writeForm.jsp">글쓰기</a>
	</div>
	
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
<br/><br/>
<form action = "list.jsp" name="search" method="get">
	<select name="field">
		<option value="subject">제 목
		<option value = "writer">작성자
	</select>
	<input type="text" size=16 name="word">
	<input type="submit" value="찾기">
</form>
<div align="center">
<%	
	// 게시글이 있으면
	if(count>0){  // ex> 게시글 38개, 한 화면 5개 ==> 38/5+(38%5==0?0:1) = 7개 + 1개 ==> 8개
		int pageCount = count/pageSize+(count%pageSize == 0 ? 0 : 1);  //페이징 개수
		int pageBlock = 3;   // 한 페이지에 나오는 페이징 수
		int startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1; // (6-1)/3 ==> 1*3+1 ==>4
		int endPage = startPage + pageBlock -1;  // 4+3-1 ==> 6
		if(endPage > pageCount) {  //9(계산상)  > 8(실제)
			endPage = pageCount;  // endpage = 8;	
		}
		// 이전
		if(startPage > pageBlock){
			
%>
		<a href="list.jsp?pageNum=<%=startPage-pageBlock%>&field=<%=field%>&word=<%=word%>">[이전]</a>
		
<%
		}
		
		// 페이지 번호
		for(int i= startPage; i<=endPage; i++){
			if(i==currentPage){  // 링크없음
%>
			[<%=i %>]
<%
			}else { // 링크
%>
				<a href="list.jsp?pageNum=<%=i%>&field=<%=field%>&word=<%=word%>"><%= i %></a>
<% 
			}
%>
<%
		}
		
		// 다음
		if(endPage < pageCount){
%>
		<a href="list.jsp?pageNum=<%=startPage+pageBlock%>&field=<%=field%>&word=<%=word%>">[다음]</a>
<% 
		}
	}

%>

</div>
</div>

</body>
</html>