<%@page import="com.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 

<script src="../JS/member.js"></script>

<%
	request.setCharacterEncoding("utf-8");
	String sid = (String)session.getAttribute("sUserid");  // sUserid에 들어있는 값을 가지고 옴
	MemberDAO dao = MemberDAOImpl.getInstance();
	ArrayList<MemberDTO> arr = dao.memberList();
	int count = dao.getCount();

%>
</head>
<body>
<div class="container mt-3">
	<div align="right">
		<a href="memberView.jsp"><%=sid %>님</a> 반갑습니다. / <a href="logout.jsp">로그아웃</a>
		/ <a href="/JSP_Project/border/list.jsp">게시판</a> <!-- 절대경로 -->
	</div>
<!-- 변경된 내용을 적용하기 위해서 영역을 지정해줘야함 -->
<h3>회원리스트(<span id="cntSpan"><%=count %></span>)</h3>

<hr>

<table class="table table-hover">
<thead>
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>구분</th>
		<th>삭제</th>
	</tr>
</thead>

<tbody>
<%
	for(MemberDTO mdto : arr){
		// 0과 1로 나타내는 admin을 일반회원과 관리자로 출력되도록 만듦
		String mode = mdto.getAdmin()==0 ? "일반회원" : "관리자"; 
		
%>
	<tr>
		<td><%=mdto.getName() %></td>
		<td><%=mdto.getUserid() %></td>
		<td><%=mdto.getPhone() %></td>
		<td><%=mdto.getEmail() %></td>
		<td><%=mode %></td>
		<td><a href="javascript:del('<%=mdto.getUserid()%>','<%=mode %>')">삭제</a></td>
	</tr>
<% 	
	}
%>

</tbody>
</table>
</div>


</body>
</html>