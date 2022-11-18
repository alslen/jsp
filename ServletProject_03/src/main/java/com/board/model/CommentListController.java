package com.board.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

/**
 * Servlet implementation class CommentListController
 */
@WebServlet("/board/commentlist")
public class CommentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		SBoardDAO dao = SBoardDAOImpl.getInstance();
		ArrayList<CommentDTO> carr = dao.findAllComment(bnum);
		int count = dao.commentCount(bnum);
		
		//gson.jar
		Gson gson = new Gson();
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("jarr", carr);
		hm.put("count", count);
		
		String jsonStr = gson.toJson(hm);  // �ڹٸ� ���̽���ü�� �ٲ��� -> ���ڿ��� ��ȯ
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonStr);
		
		/*JSONObject mainObj = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		for(CommentDTO comm : carr) {
			JSONObject obj = new JSONObject();
			obj.put("userid", comm.getUserid());
			obj.put("msg", comm.getMsg());
			obj.put("cnum",comm.getCnum());
			obj.put("regdate", comm.getRegdate());
			obj.put("bnum", comm.getBnum());
			jarr.add(obj);
		}
		
		JSONObject countObj = new JSONObject();
		countObj.put("count", count);
		
		mainObj.put("countObj", ) */
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
