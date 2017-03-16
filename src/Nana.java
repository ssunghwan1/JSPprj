
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;

import com.newlecture.web.dao.mysql.MySQLMemberDao;
import com.newlecture.web.data.dao.MemberDao;
import com.newlecture.web.data.entity.Member;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.util.List;

public class Nana extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		
		
		/*==============================================================================*/
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); // 크롬에서도 html이 적용되도록 하는 구문
		
		OutputStream os = response.getOutputStream();
		//PrintStream out = new PrintStream(os);

		PrintWriter out = response.getWriter();
		// OutputStream/InputStream : byte, Writer/Reader : char ==> 영어 이외에는 Writer/Reader를 쓰는게 좋다
		
		MemberDao memberDao = new MySQLMemberDao();
		List<Member> list = memberDao.getList("");		
		
		// ================== View ===================================================
		
		for (Member m : list) {
			out.println("ID는 "+m.getId()+"이고 패스워드는 "+"<span style='color:red;'>"+m.getPwd()+"</span>"+"이다" +"<br />");

		}

	}

}