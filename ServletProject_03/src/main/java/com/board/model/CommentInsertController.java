package com.board.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.SMemberDAO;
import com.member.model.SMemberDTO;

/**
 * Servlet implementation class CommentInsertController
 */
@WebServlet("/board/commentInsert")
public class CommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param session 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String msg = request.getParameter("msg");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		HttpSession session = request.getSession();
		SMemberDTO suser = (SMemberDTO)session.getAttribute("suser");
		if(suser == null) {
			PrintWriter out = response.getWriter();
			out.println("1");
			return;
		}
		SBoardDAO sdao = SBoardDAOImpl.getInstance();
		CommentDTO comment = new CommentDTO();
		comment.setBnum(bnum);
		comment.setMsg(msg);
		comment.setUserid(suser.getUserid());
		sdao.commentInsert(comment);
	}

}
