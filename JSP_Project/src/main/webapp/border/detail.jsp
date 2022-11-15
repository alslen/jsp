<%@page import="com.board.dto.BoardDTO"%>
<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
<%
	request.setCharacterEncoding("utf-8");
	BoardDAO dao = BoardDAO.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDTO board = dao.findByNum(num);
	int ref = board.getRef();
	int re_step = board.getRe_step();
	int re_level = board.getRe_level();
	
%>
<script>
	function del(){
		if(confirm('정말 삭제할까요?')){
			location.href="deletePro.jsp?num=<%=num%>";
		}
	}
</script>
</head>
<body>

<h2>글 내용 보기</h2>
<input type="text" id="num" value="<%=num %>" />
<table border="1">
	<tr>
		<td>글번호</td>
		<td><%=board.getNum() %></td>
		<td>조회수</td>
		<td><%=board.getReadcount() %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=board.getWriter() %></td>
		<td>작성일</td>
		<td><%=board.getReg_date() %></td>
	</tr>
	<tr>
		<td>글제목</td>
		<td colspan="3"><%=board.getSubject() %></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3"><%=board.getContent() %></td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="button" value="글수정폼" onclick="location.href='updateForm.jsp?num=<%=num%>'"/>
			<input type="button" value="삭제" onclick="del()"/>
			<input type="button" value="답글쓰기" onclick="location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'"/>  <!-- 답글을 쓰기 위해서 부모글(새글)이 무엇인지 알려줘야함 그 역할을 해주는 것이 num임-->
			<!-- 부모글와 답글은 같은 그룹이여야 하기에 '그룹(ref)', 여러가지 답글을 달 수도 있고 대댓글도 있을 수 있기에 글순서(re_step), 들여쓰기(re_level)도 num과 같이 넘겨줘야한다.(writeForm.jsp로) -->
			<input type="button" value="글목록" onclick="location.href='list.jsp'"/>
		</td>
	</tr>
</table>
<br><br>
<div align = "center">
	<textarea rows="5" cols="50" id="msg"></textarea>
	<input type="button" value="comment Insert" id="commentBtn"/>
</div>

Comment(<span id="cntSpan"></span>)<br/>
<div id="result"></div> <!-- 이 영역에 댓글을 출력해줄 것임 -->

<script>

var init = function() {
	$.getJSON("commentList.jsp",
			{"bnum" : $("#num").val()},
			function(resp){  // resp에는 main이 담겨져 있음(main에는 데이터와 개수가 담겨 있음)
				var str="<table>";
				$.each(resp.dataObj, function(key,val){  // resp.dataObj(데이터)를 반복해서 출력
					str += "<tr>"
					str += "<td>"+val.msg+"</td>"
					str += "<td>"+val.userid+"</td>"
					str += "<td>"+val.regdate+"</td>"
					str += "</tr>"
				})
				str += "</table>"
				$("#cntSpan").text(resp.countObj.count);
				$("#result").html(str);
				
			}  // 콜백함수
	) // getJSON
}  // function
	$("#commentBtn").click(function() {
		if($("#msg").val()==""){
			alert("메시지를 입력하세요")
			return;
		}
		$.ajax({
			type:"get",
			url : "commentInsert.jsp",
			data : {"msg" : $("#msg").val(), "bnum" : $("#num").val()},
			success:function(resp){
				if(resp.trim()==1){  // 로그인 안됨
					alert("로그인하세요");
					location.href="../member/loginForm.jsp";  // 상대경로로 표현
				} else { // 로그인x
					init();
					$("#msg").val("")
				}
				
			},
			error : function(e){
				alert(e+"error")
			}
		})  // ajax
	})  // commentBtn
	
	init(); // 변수를 함수처럼 부름, 이걸 제일 먼저 실행
</script>

</body>
</html>