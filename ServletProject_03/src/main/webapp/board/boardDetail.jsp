<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<script>
function del(){
	if(confirm('정말 삭제할까요?')){
		location.href="boardDelete?num=${board.num}";
	}
}
</script>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Board Detail</h1>      
  </div>
</div>


<div class = "container">
<input type="hidden" id="num" name="num" value="${board.num}">
	<table class="table">
	<tr>
		<th>번호</th>
		<td>${board.num }</td>
		<th>조회수</th>
		<td>${board.readcount }</td>
	<tr>
	
	<tr>
		<th>작성자</th>
		<td>${board.userid }</td>
		<th>작성일</th>
		<td>${board.regdate }</td>
	<tr>

	<tr>
		<th>글제목</th>
		<td colspan="3">${board.subject }</td>
	<tr>
	<tr>
		<th>글내용</th>
		<td colspan="3">${board.content}</td>
	<tr>
	</table>
	
	<c:if test="${sessionScope.suser.userid== board.userid}"> <!-- 세션에 있는 userid와 입력한 userid가 같다면 -->
		<input type="button" value="수정" class="btn btn-primary" onclick="location.href='boardUpdate?num=${board.num}'">
		<input type="button" value="삭제" class="btn btn-primary" onclick="del()"><br>
	</c:if>
	
	comment:
	<textarea class="form-control" rows="5" id="msg"></textarea><br>
	<button type="button" class="btn btn-secondary" id="commentBtn">입력</button>
	<br><br>
	<div class="mt-3">댓글(<span id="cntSpan"></span>)</div>
	<div id="result"></div>	
</div>



<script>
var init = function(){
	$.getJSON("commentlist",
			{"bnum" : $("#num").val()},
			function(resp){
				var str="<table class='table table-hover'>";
				$.each(resp.jarr, function(key,val){
					str += "<tr>"
					str += "<td>"+val.msg+"</td>"
					str += "<td>"+val.userid+"</td>"
					str += "<td>"+val.regdate+"</td>"
					str += "</tr>"
				})
				str += "</table>"
				$("#cntSpan").text(resp.count);
				$("#result").html(str);
			})  //getJSON
}

$("#commentBtn").click(function() {
	if($("#msg").val()==""){
		alert("메시지를 입력하세요")
		return;
	}
	$.ajax({
		type:"post",
		url : "commentInsert",
		data : {"msg" : $("#msg").val(), "bnum" : $("#num").val()}
		})  // ajax
		.done(function(resp){
			if(resp.trim()=="1") { 
				alert("로그인하세요")
				location.href="../member/login";
			} else {
				alert("성공")
				init();
				$("#msg").val("")
			}
		})  // done
		.fail(function(e){
			alert("error" + e)
		})  // fail
}) // commentBtn

init();

</script>


<%@include file="../include/footer.jsp" %>