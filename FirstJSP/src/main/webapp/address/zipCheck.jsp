<%@page import="com.address.ZipCode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a:link {text-decoration:none; color:#000}
	a:hover {text-decoration:none; color:#000} 
	a:visited {text-decoration:none; color:#000} 
</style>
<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong");  // 우리가 입력한 값이 dong에 저장됨
	AddressDAO dao = AddressDAO.getInstance();
	ArrayList<ZipCode> zarr = dao.zipcodeRead(dong);
%>
<script>
	function dongCheck() {
		if(document.getElementById("dong").value==""){
			alert("동이름을 입력해주세요.")
			document.getElementById("dong").focus() // 커서 깜빡이게 하는 함수
			return
		}
		document.getElementById('frm').submit()
	}
	
	function send(code,sido,gugun,dong,bunji){
		const address = sido+" "+gugun+" "+dong+" "+bunji
		//opener는 자신을 호출한 페이지(insert.jsp)
		opener.document.getElementById("zipcode").value=code
		opener.document.getElementById("addr").value=address
		self.close()
		
	}
</script>
</head>
<body>
<b>우편번호 찾기</b>
<!-- action 생략하면 자신의 페이지로 돌아간다. -->
<form action="zipCheck.jsp" id="frm">
	<table>
		<tr>
			<td>동이름 입력 : <input type="text" name="dong" id="dong"/>
			<input type="button" value="검색" onclick="dongCheck()"/>
			</td>
		</tr>
		<tr>
<%
	if(zarr.isEmpty()) {  // zarr이 비어있다면
%>
		<td> 검색 결과가 없습니다.</td>
<%	
	} else { 
%>
		<td>* 검색 후, 아래 우편번호를 클릭하면 자동 입력됩니다.</td>
<%
	}

%>
		</tr>
<%
	for(ZipCode z : zarr) {
		String zip = z.getZipcode();
		String sido = z.getSido();
		String gugun = z.getGugun();
		String d = z.getDong();
		String bunji = z.getBunji();
%>
	<tr>
	<td>
	<!-- send()로 다섯개의 값을 전달해줘야함 -->
		<a href="javascript:send('<%=zip %>','<%=sido %>','<%=gugun %>','<%=d %>','<%=bunji %>')"> <!--자바스크립트의 함수를 불러오기 위해서 javascript 키워드를 사용함  -->
			<%=zip %>
			<%=sido %> 
			<%=gugun %>
			<%=d %>
			<%=bunji %>
		</a>
	</td>
	</tr>
		
<%
	}
%>
	</table>
</form>
</body>
</html>