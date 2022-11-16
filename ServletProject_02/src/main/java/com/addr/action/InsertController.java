package com.addr.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.AddPortOffsetRule;

import com.addr.model.AddrDTO;
import com.addr.model.SAddrDAO;
import com.addr.model.SAddrDAOImpl;

/**
 * Servlet implementation class InsertController
 */
@WebServlet("/addr/insert.addr")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertController() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("addr_insert.jsp");
		rd.forward(request, response);
 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");  // �ѱ�ó��
		
		AddrDTO dto = new AddrDTO();
		dto.setAddr(request.getParameter("addr"));
		dto.setName(request.getParameter("name"));
		dto.setZipcode(request.getParameter("zipcode"));
		dto.setTel(request.getParameter("tel"));
		
		SAddrDAO dao = SAddrDAOImpl.getInstance();
		dao.addrInsert(dto);
		
		//RequestDispatcher rd = request.getRequestDispatcher("list.addr");  // ���谡 �����Ǹ鼭 ���� ����ִ� �͵��� forward������
		//rd.forward(request, response);  // �ּҰ� �ٲ��� �ʴ´�.
		response.sendRedirect("list.addr");  // ���谡 �������鼭 ���� ����, �ּҰ� �ٲ�(list.addr��)
	}

}
