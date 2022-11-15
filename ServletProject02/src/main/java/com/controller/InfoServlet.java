package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InfoServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");  
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		
		//req.setAttribute("name", name); // 값을 저장
		//req.setAttribute("id", id); 
		//req.setAttribute("pwd", pwd);
		//req.setAttribute("phone", phone);
		//req.setAttribute("address", address);
		
		// 객체를 이용
		//Info info = new Info();
		//info.setAddress(address);  // setter을 이용해서 값을 저장
		//info.setId(id);
		//info.setName(name);
		//info.setPhone(phone);
		//info.setPwd(pwd);
		
		// 생성자를 이용해서 값을 저장
		Info info = new Info(name, id, pwd, phone, address);
		
		req.setAttribute("info", info);  // 객체 info를 info라는 이름으로 값을 저장
		
		RequestDispatcher rd = req.getRequestDispatcher("infoResult.jsp"); // 연결을 유지한 상태임
		rd.forward(req, resp);  // infoResult.jsp로 저장된 값을 보낸다.
		
	}
}
