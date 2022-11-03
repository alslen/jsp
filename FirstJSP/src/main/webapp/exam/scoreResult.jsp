<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
// request.getParameter의 반환형은 문자열
// Integer.parseInt은 String형을 int형으로 바꿔줌
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	// 총점, 평균
	int total = kor+eng+math;
	float avg = total/3.0f;
	
	//평균이 90점 이상A, 80점 이상 B, 70이상이면 C, 나머지 F
	String grade;
	
	//if문 사용해도 되고 switch문 사용해도 된다.
	/*if(avg>=90) grade="A";
	else if(avg>=80) grade="B";
	else if(avg>=70) grade="C";
	else grade="F"; */
	
	switch((int)avg/10) {  // 90~99/80~89/70~79
	case 10:
	case 9:grade="A"; break;
	case 8:  grade="B"; break;
	case 7: grade="C"; break;
	 default: grade="F"; break;
	}

%>

	이름 :
	<%=name %><br> 국어 :
	<%=kor %><br> 영어 :
	<%=eng %><br> 수학 :
	<%=math %><br> 총점 :
	<%=total %><br> 평균 :
	<%=avg %><br> 학점 :
	<%=grade %><br>
</body>
</html>