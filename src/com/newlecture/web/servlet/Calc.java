package com.newlecture.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc")
public class Calc extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String _x = request.getParameter("x"); //임시변수라서  _x로 쓴다.
		String _y = request.getParameter("y");
	
		// x,y 가 필수 입력 값이라면
		/*int x = Integer.parseInt(_x);
		int y = Integer.parseInt(_y);*/
		
		// x,y 가 필수가 아닌 옵션 값이라면
		int x = 0;
		int y = 0;
		
		if(_x != null && !_x.equals("")) // x가 전달된 것이 있다면
			x = Integer.parseInt(_x);
		
		if(_y != null && !_y.equals(""))
			y = Integer.parseInt(_y);
		
		// 쿼리 스트링이 전달되는 방식 3가지
		/*
		 * /calc        -> x=null
		/calc?x=&y=     -> x=""
		/calc?x=1&y=2   -> x=1
		 * */
		
		
		PrintWriter out = response.getWriter();

		
		out.write("<!DOCTYPE html>");
		out.write("<html>");
		out.write("<head>");
		out.write("<meta charset=\"UTF-8\">");
		out.write("<title>Insert title here</title>");
		out.write("</head>");
		out.write("<body>");
		out.write("   <form action=\"calc\" method=\"get\">");
		out.write("      <p>");
		out.write("         <label>x:</label>");
		out.write("         <input id=\"txt-x\"  name=\"x\"/>"); 
		out.write("         <label>y:</label>");
		out.write("         <input id=\"txt-y\" name=\"y\"/>");
		out.write("      </p>");
		out.write("      <p>");
		out.write("         sum = <input id=\"txt-sum\" value=\"");
		out.println(x+y);
		out.write("\" />");
		out.write("      </p>");
		out.write("      <p>");
		out.write("         <input id=\"btn-sum\" type=\"submit\" value=\"Sum\" />");
		out.write("      </p>");
		out.write("   </form>");
		out.write("</body>");
		out.write("</html>");
		
	}

}
