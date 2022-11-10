<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");  // 인코딩
	String field = request.getParameter("field");
	String word = request.getParameter("word");
	JAddressDAO dao = JAddressDAOImpl.getInstance();
	ArrayList<AddressVO> sarr =dao.searchList(field, word);
	int count = dao.getCount(field, word);
	// sarr ==> json
	// count ==> json
	
	//mainObj(루트)
	JSONObject mainObj = new JSONObject();
	
	// countObj(개수)
	JSONObject countObj = new JSONObject();
	countObj.put("count", count);  // countObj에 값을 넣는다.
	
	// sarr ==> json
	JSONArray jarr = new JSONArray();
	for(AddressVO avo : sarr){
		JSONObject obj = new JSONObject();
		obj.put("num", avo.getNum());
		obj.put("name", avo.getName());
		obj.put("addr", avo.getAddr());
		obj.put("zipcode", avo.getZipcode());
		obj.put("tel", avo.getTel());
		jarr.add(obj);
	}
	mainObj.put("countObj", countObj);  // 개수값을 main에 추가
	mainObj.put("jarrObj", jarr);  // ArrayList에 담겨 있던 값들을 main에 추가
	
	out.print(mainObj.toString());  //toString으로 반환시켜줌 -> 출력값을 파싱해줌
	// 하나의 값만 파싱해줘야함
%>

