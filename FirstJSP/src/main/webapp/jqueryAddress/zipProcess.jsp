<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.jqueryAddress.ZipCodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jqueryAddress.JAddressDAOImpl"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong");
	//String dong = "부전동";
	
	JAddressDAO dao = JAddressDAOImpl.getInstance();
	ArrayList<ZipCodeVO> zarr = dao.getZipcode(dong);
	
	//java zarr ==> json
	// ArrayList로 받은 것을 JSON으로 변경 : JSON Simple사용 
	JSONArray jsonarr = new JSONArray();  // json들이 들어있는 Array
	for(ZipCodeVO z : zarr){
		JSONObject obj = new JSONObject(); //JsonObject는 객체(주로 String)를 Json객체로 바꿔주거나 Json객체를 새로 만드는 역할을 합니다.
		obj.put("zipcode", z.getZipcode()); //키값이 'zipcode'인 요소 추출하기
		obj.put("sido", z.getSido());
		obj.put("gugun", z.getGugun());
		obj.put("dong", z.getDong());
		obj.put("bunji", z.getBunji());
		jsonarr.add(obj);
	}
	out.println(jsonarr.toString());  // JSON객체의 형태로 출력
	
%>

