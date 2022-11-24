package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.SMemberDAO;
import com.member.model.SMemberDAOImpl;
import com.member.model.SMemberDTO;
import com.util.SHA256;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/member/memberUpdate")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		SMemberDAO dao = SMemberDAOImpl.getInstance();
		SMemberDTO member = dao.findById(userid);
		request.setAttribute("member", member);
		
		request.getRequestDispatcher("memberUpdate.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		SMemberDTO member = new SMemberDTO();
		
		member.setAdmin(Integer.parseInt(request.getParameter("admin")));
		member.setEmail(request.getParameter("email"));
		member.setName(request.getParameter("name"));
		member.setPhone(request.getParameter("phone"));
		//member.setPwd(request.getParameter("pwd"));
		
		String userid = request.getParameter("userid");
		member.setUserid(userid);
		
		String pwd = request.getParameter("pwd_check");
		String encPwd = SHA256.getEncrypt(pwd, userid);
		//System.out.println(encPwd);
		member.setPwd(encPwd);
		
		SMemberDAO dao = SMemberDAOImpl.getInstance();
		int flag = dao.memberUpdate(member);
		
		if(flag == 1) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("login");
			
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
			request.getRequestDispatcher("memberDetail?userid='"+userid+"'").forward(request, response);
			out.flush();
			
		}
	
	}

}
