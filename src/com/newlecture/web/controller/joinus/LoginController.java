package com.newlecture.web.controller.joinus;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.newlecture.web.dao.mysql.MySQLMemberDao;
import com.newlecture.web.data.entity.Member;

@WebServlet("/joinus/login")
public class LoginController extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/joinus/login.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		String pwd = request.getParameter("pwd");
	
		Member member = new MySQLMemberDao().get(id);
		
		HttpSession session = request.getSession();
		
//		System.out.println("id: "+member.getId());
//
//		System.out.println("id: "+member.getPwd());
		
		boolean validate = true;
		if(member==null)
			validate = false;
		else if(!member.getPwd().equals(pwd))
			validate = false;
		else
		{
			session.setAttribute("id", id);
		}
		
		if(validate)
			response.sendRedirect("../index");
		else{
		request.setAttribute("validate", validate);
		request.getRequestDispatcher("/WEB-INF/views/joinus/login.jsp").forward(request, response);
		}
		
		System.out.println(member.getId());
		System.out.println(member.getPwd());
}
}