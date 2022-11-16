package com.controller;

import java.io.IOException;
import java.util.jar.Attributes.Name;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonServlet extends HttpServlet {
	// get방식 사용하기에 doGet 사용
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name=req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		String[] hobby = req.getParameterValues("hobby");  // hobby는 배열이기 때문에 getParameterValues로 값을 가져와야함
		String job = req.getParameter("job");
		
		//req.setAttribute("name", name);  // name에 들어있는 값을 name에 저장
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
		
		req.setAttribute("p", person);  // person에 들어있는 값들을 p에 저장
		
		// formResult.jsp로 값을 전달하기 위해 RequestDispatcher를 사용
		RequestDispatcher rd = req.getRequestDispatcher("formResult.jsp");  // 객체를 만들고
		rd.forward(req, resp); // forwoard함수로 formResult.jsp로 값을 뿌려줌
		
	}
	
}
