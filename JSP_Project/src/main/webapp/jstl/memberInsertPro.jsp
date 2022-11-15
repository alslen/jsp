<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> <!-- core에는 DB연결할 수 있는 것이 없기때문에 DB연결하기 위해서 선언해줘야함  -->

<%
	// jstl은 usebean이 없음
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String admin = request.getParameter("admin");
%>

<!-- setDataSource : DB에 접속하기 위한 데이터 소스를 생성합니다. -->
<!-- dataSource : 컨텍스트에 JNDI 설정 시 리소스 네임, var : 생성한 데이터 소스를 저장할 변수명, scope : 유효 범위 ( 전체가 공통으로 사용함 ) -->
<sql:setDataSource dataSource="jdbc/jsp" var="dataSource" scope="application"/> <!-- DB연결 -->
<!-- sql:update = SQL 쿼리 문장을 업데이트(삽입, 수정, 삭제)합니다 -->
<sql:update dataSource="${dataSource}">
insert into memberdb(name, userid, pwd, email, phone, admin) values(?,?,?,?,?,?)
	<sql:param value="${param.name}"/>
	<sql:param value="<%=userid %>"/>
	<sql:param value="<%=pwd %>"/>
	<sql:param value="<%=email %>"/>
	<sql:param value="<%=phone %>"/>
	<sql:param value="<%=admin %>"/>
</sql:update>
<c:import url="memberList.jsp"/>