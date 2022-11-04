<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Calendar ca = Calendar.getInstance();
	String day="";
	
	switch(ca.get(Calendar.DAY_OF_WEEK)) {  // 요일을 반환하기 위해 switch문을 만들었음
	case 1:day="일"; break;
	case 2:day="월"; break;
	case 3:day="화"; break;
	case 4:day="수"; break;
	case 5:day="목"; break;
	case 6:day="금"; break;
	case 7:day="토"; break;
	}
	// 요일을 배열에 넣어서 반환하는 방법
	String[] arr = {"일", "월", "화", "수", "목", "금", "토"};
	
	
%>
</head>
<body>
<!-- 오늘은 년 월 일 금요일 -->
오늘은 <%= ca.get(Calendar.YEAR) %>년 
<%= ca.get(Calendar.MONTH)+1 %>월 <!-- MONTH가 0부터 시작해서 +1을 해줘야한다. -->
<%= ca.get(Calendar.DATE) %>일 
<%= ca.get(Calendar.DAY_OF_WEEK) %>요일 <!--DAY_OF_WEEK는 숫자로 반환된다.  -->
<hr/>
switch 요일 :<%=day %><br/>
배열요일 : <%= arr[ca.get(Calendar.DAY_OF_WEEK)-1] %> 
</body>
</html>