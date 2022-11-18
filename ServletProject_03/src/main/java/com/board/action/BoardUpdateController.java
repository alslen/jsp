package com.board.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDTO;
import com.board.model.SBoardDAO;
import com.board.model.SBoardDAOImpl;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/board/boardUpdate")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		SBoardDAO dao = SBoardDAOImpl.getInstance();
		BoardDTO board = dao.findByNum(num);
		request.setAttribute("board", board);
		
		request.getRequestDispatcher("boardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BoardDTO board = new BoardDTO();
		
		board.setContent(request.getParameter("content"));
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setSubject(request.getParameter("subject"));
		board.setEmail(request.getParameter("email"));
		SBoardDAO dao = SBoardDAOImpl.getInstance();
		dao.boardUpdate(board);
		request.getRequestDispatcher("boardDetail").forward(request, response);

	}

}
