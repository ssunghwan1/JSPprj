import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class Add extends HttpServlet {
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
	  response.setCharacterEncoding("UTF-8"); 
	  response.setContentType("text/html; charset=UTF-8");
	   
      PrintWriter out = response.getWriter();
      
      int result = 0;
      
      out.write("<form action=\"add\" method=\"post\">");
      out.write("    <ul>");
      out.write("        <li><label for=\"x\">X :</label><input name=\"x\" /></li>");
      out.write("        <li><label for=\"y\">Y :</label><input name=\"y\" /></li>");
      out.write("    </ul>");
      out.write("    <p>");
      out.printf("    <input type=\"hidden\" name=\"result\" value=\"%d\" />", result);
      out.write("    <input type=\"submit\" name=\"btn\" value=\"덧셈\" />");
      out.write("    <input type=\"submit\" name=\"btn\" value=\"application\" />");
      out.write("    <input type=\"submit\" name=\"btn\" value=\"session\" />");
      out.write("    <input type=\"submit\" name=\"btn\" value=\"cookie\" />");
      out.write("    </p>");
      out.write("    <p><a href=\"DataView\">데이터보기</a></p>");
      out.write("</form>");
   }
   
   
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   response.setCharacterEncoding("UTF-8"); 
	   response.setContentType("text/html; charset=UTF-8");
		   
	   
	   PrintWriter out = response.getWriter();
	   String _x= request.getParameter("x");
	   String _y= request.getParameter("y");
	   String btn = request.getParameter("btn");
	   int x=Integer.parseInt(_x);
	   int y=Integer.parseInt(_y);
	   
	   int result = x+y;
	   
	   //세션
	   if(btn.equals("session")){
		   request.getSession().setAttribute("result", result);
	   }	   
	   //쿠키
	   if(btn.equals("cookie")){
		   Cookie cookie = new Cookie("result", String.valueOf(result));
		   cookie.setMaxAge(60*60*24);
		   response.addCookie(cookie);
	   }
	   //어플리케이션
	   if(btn.equals("application")){
		   request.getServletContext().setAttribute("result", result);
	   }
	   
	   out.println("<script> alert('"+btn+"에 저장되었습니다.');location.href='add'; </script>");
	   
   }
}