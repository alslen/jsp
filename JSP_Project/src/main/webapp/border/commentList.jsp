<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.board.dto.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// bnum이라는 값을 받아와서 BoardDAO.java파일에서 처리한 결과 값을
	// 제이슨 객체로 만들어줌
	// 댓글을 detail.jsp파일에 보여주기 위해서
	request.setCharacterEncoding("utf-8");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	
	BoardDAO dao = BoardDAO.getInstance();
	ArrayList<CommentDTO> carr = dao.commentList(bnum);
	int count = dao.getCommentCount(bnum);
	

			
	// mainObj(루트) : 두 값(count, ArrayList)을 담기위한 JSONObject객체
	JSONObject mainObj = new JSONObject();
	
	// carr(java) ==> json
	// 댓글 내용
	JSONArray jarr = new JSONArray();  // ArrayList로 값을 받아와서 JSON도 JSONArray로 선언 
	for(CommentDTO comm : carr){
		JSONObject obj = new JSONObject();
		obj.put("userid", comm.getUserid());
		obj.put("cnum", comm.getCnum());
		obj.put("bnum", comm.getBnum());
		obj.put("regdate", comm.getRegdate());
		obj.put("msg", comm.getMsg());
		jarr.add(obj);
	}
	
	// countObj(개수)
	JSONObject countObj = new JSONObject();
	countObj.put("count", count);  // 구해온 count를 넣음
	
	// main에 추가(데이터와 개수)
	mainObj.put("countObj", countObj);
	mainObj.put("dataObj",jarr);
	
	// 출력한 결과가 resp에 담김
	out.println(mainObj.toString()); // mainObj가 resp에 넘어감
	
%>