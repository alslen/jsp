<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>


<script>
$(function(){
	$("#writeBtn").click(function(){
		if(${empty sessionScope.suser}){
			alert("로그인 하세요");
			location.href="../member/login";
			return false;
		}
		location.href="write";

	})
})

$(function() {
	$("#searchBtn").click(function(){
		if($("#word").val()==""){
			alert('검색어를 입력하세요')
		}
		$("#sfrm").submit();
		
	})  //searchBtn 
}) // document

	
</script>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Board List(${count})</h1>      
  </div>
</div>

<div class="container mt-5">
	<table class="table table-hover">	
		<thead>
			<tr>
				<th>번호</th>
				<th>Userid</th>
				<th>Subject</th>
				<th>Email</th>
				<th>날짜</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${arr}" var="board">
		<tr>
			<td>${board.num }</td>
			<td>${board.userid }</td>
			<td><a href="boardDetail?num=${board.num}">${board.subject }</a></td>
			<td>${board.email }</td>
			<td>${board.regdate }</td>
			
		</tr>
	</c:forEach>
	</tbody>
</table>

	<div align="right">
		<input type="button" value="글쓰기" class="btn btn-primary" id="writeBtn">
	</div> <br><br>
	
	<ul class="pagination">
	<!--  이전 -->

	<c:if test="${startPage > pageBlock }">
		<li class="page-item">
		<a class="page-link" href="boardlist?pageNum=${startPage-pageBlock}&field=${field}&word=${word}">Previous</a></li>
	</c:if>
	<!-- 페이지 번호 -->
	<c:forEach begin="${startPage }" end="${endPage }" var="i">
		<!--  현재페이지가 아니면 -->
		<c:if test="${currentPage != i }">
			<li class="page-item ">
			<a class="page-link" href="boardlist?pageNum=${i }&field=${field}&word=${word}">${i }</a></li>
		</c:if>
		<!-- 현재페이지 -->
		<c:if test="${currentPage == i }" >
			<li class="page-item active"><a class="page-link" href="">${i }</a></li>
		</c:if>
	</c:forEach>	
	<!--  다음 -->	
	<c:if test="${endPage < pageCount }">
		<li class="page-item">
		<a class="page-link" href="boardlist?pageNum=${endPage+1}&field=${field}&word=${word}">Next</a></li>
	</c:if>	
	</ul>

<form action="boardlist" id="sfrm">
	 <select id="field" name="field" class="custom-select" style="width:150px">
      <option value="userid">아이디</option>
      <option value="subject">제목</option>
    </select>
    <input type="text" size=16 id="word" name="word">
    <input type="button" value="검색" id="searchBtn"/>
</form>
</div>

<%@include file="../include/footer.jsp" %>