<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	MemberDAO dao = MemberDAOImpl.getInstance();
	dao.memberDelete(userid);
	ArrayList<MemberDTO> arr = dao.memberList();
	int count = dao.getCount();  // 삭제된 개수를 구할 수 있음
	
	// 자바 ==>json
	
	//mainObj(루트)
	JSONObject mainObj = new JSONObject();
	
	// countObj(개수)
	JSONObject countObj = new JSONObject();
	countObj.put("count", count);
	
	// arr
	JSONArray jarr = new JSONArray();
	for(MemberDTO member : arr){
		String mode = member.getAdmin()==0 ? "일반회원":"관리자";
		JSONObject obj = new JSONObject();
		obj.put("name", member.getName());
		obj.put("userid", member.getUserid());
		obj.put("pwd", member.getPwd());
		obj.put("email", member.getEmail());
		obj.put("phone", member.getPhone());
		obj.put("admin", mode);
		jarr.add(obj);
	}
	
	// 메인에 추가
	mainObj.put("countObj", countObj);
	mainObj.put("jarrObj", jarr);	
	out.println(mainObj.toString());
	
%>