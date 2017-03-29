

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DataView
 */
@WebServlet("/DataView")
public class DataView extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setCharacterEncoding("UTF-8"); 
		  response.setContentType("text/html; charset=UTF-8");
		   
		  PrintWriter out = response.getWriter();
		  
		  
		  String _s =String.valueOf(request.getSession().getAttribute("result"));
		  String _a =String.valueOf(request.getServletContext().getAttribute("result"));
		  
		  Cookie[] cookies =request.getCookies();
		  String _c="";
		  
		  if(cookies != null)
			  for(Cookie cookie : cookies)
				  if(cookie.getName().equals("result"))
					  _c=cookie.getValue();
		  
		  String s="";
		  String c="";
		  String a="";
		  
		  if(_s != null)
			  s=_s ;
		  if(_a != null)
			  a=_a;
		  
		  c=_c;
		  
		  out.printf("session data : %s<br />", s);
		  out.printf("cookie data : %s<br />", c);
		  out.printf("application data : %s<br />", a);
		  out.printf("<a href=\"add\">데이터편집</a>");
		  
	}

}
