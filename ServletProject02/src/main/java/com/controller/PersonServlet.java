package com.controller;

import java.io.IOException;
import java.util.jar.Attributes.Name;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonServlet extends HttpServlet {
	// get��� ����ϱ⿡ doGet ���
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name=req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		String[] hobby = req.getParameterValues("hobby");  // hobby�� �迭�̱� ������ getParameterValues�� ���� �����;���
		String job = req.getParameter("job");
		
		//req.setAttribute("name", name);  // name�� ����ִ� ���� name�� ����
		//req.setAttribute("age", age);
//		req.setAttribute("gender", gender);
//		req.setAttribute("hobby", hobby);
//		req.setAttribute("job", job);
		
		Person person = new Person();
		person.setAge(age);
		person.setGender(gender);
		person.setHobby(hobby);
		person.setJob(job);
		person.setName(name);
		
		req.setAttribute("p", person);  // person�� ����ִ� ������ p�� ����
		
		// formResult.jsp�� ���� �����ϱ� ���� RequestDispatcher�� ���
		RequestDispatcher rd = req.getRequestDispatcher("formResult.jsp");  // ��ü�� �����
		rd.forward(req, resp); // forwoard�Լ��� formResult.jsp�� ���� �ѷ���
		
	}
	
}
