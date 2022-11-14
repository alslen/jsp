<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	int num = 0, ref = 1, re_step=0, re_level=0;  // 새글
	if(request.getParameter("num")!=null) {  // 답변(댓글)이라면
		num = Integer.parseInt(request.getParameter("num"));  // 부모글
		ref = Integer.parseInt(request.getParameter("ref"));  // 부모와 같은 그룹
		re_step = Integer.parseInt(request.getParameter("re_step"));  // 댓글들의 글 순서
		re_level = Integer.parseInt(request.getParameter("re_level"));  // 들여쓰기
	}
%>
</head>
<body>
<div align="right">
	<a href="list.jsp">글목록</a>
</div>

<h3>글 추가하기</h3>
<form action="writePro.jsp" method="post"> <!-- writePro.jsp를 수행하기 위해서 num, ref, re_step, re_level을 같이 넘겨줘야함 -->

<!-- 위에 선언한 값을 value속성으로 줘야지 DB에 정확히 반영된다. -->
<input type="hidden" name="num" value="<%=num %>"/>
<input type="hidden" name="ref" value="<%=ref %>"/>
<input type="hidden" name="re_step" value="<%=re_step %>"/>
<input type="hidden" name="re_level" value="<%=re_level %>"/>

	<table border=1>
		<tr>
			<td>이름</td>
			<td><input type="text" name="writer"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
			<%
				if(request.getParameter("num")!=null){  // 댓글
			%>
					<input type="text" name="subject" value="[댓글]">
					
			<% 	} else {  // 새글  %>
			
					<input type="text" name="subject">
			<% 
				}
			%>
			
			
			</td>
		</tr>
		
		<tr>
			<td>Email</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="50" rows="10" name="content"></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="글쓰기">
			<input type="reset" value="다시작성">
			</td>
		</tr>		
	</table>
</form>

</body>
</html>