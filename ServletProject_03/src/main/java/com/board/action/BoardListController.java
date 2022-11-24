package com.board.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDTO;
import com.board.model.SBoardDAO;
import com.board.model.SBoardDAOImpl;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/board/boardlist")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		SBoardDAO dao = SBoardDAOImpl.getInstance();
		ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {  // �� ù���ۿ� ������ ��ȣ�� ���� ������
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);  // ���� ������
		int pageSize = 3; // �� ȭ�鿡 �������� �Խù� ��
		
		// �� ȭ�鿡 �������� �Խù� ��ȣ
		int startRow = (currentPage-1)*pageSize+1;  // 1 6 11
		int endRow = currentPage * pageSize;  // 5 10 15
		
		String field="";
		String word="";
		if(request.getParameter("word")!= null) {  // �˻��̸�
			field = request.getParameter("field");
			word = request.getParameter("word");
		} 
			//arr = dao.boardList();
		arr = dao.boardList(startRow, endRow, field, word);
	
		
		int count = dao.boardCount(field, word);  // �˻��� ������ ���� ���ϱ�
		
		
		
		if(count>0){  // ex> �Խñ� 38��, �� ȭ�� 5�� ==> 38/5+(38%5==0?0:1) = 7�� + 1�� ==> 8��
			int pageCount = count/pageSize+(count%pageSize == 0 ? 0 : 1);  //����¡ ����
			int pageBlock = 3;   // �� �������� ������ ����¡ ��
			int startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1; // (6-1)/3 ==> 1*3+1 ==>4
			int endPage = startPage + pageBlock -1;  // 4+3-1 ==> 6
			if(endPage > pageCount) {  //9(����)  > 8(����)
				endPage = pageCount;  // endpage = 8;	
			}
			
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageBlock", pageBlock);
	}
			request.setAttribute("count", count);
			request.setAttribute("arr", arr);
			request.setAttribute("field", field);
			request.setAttribute("word", word);
			request.setAttribute("currentPage", currentPage);
		
		RequestDispatcher rd = request.getRequestDispatcher("boardList.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
