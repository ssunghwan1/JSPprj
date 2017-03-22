package com.newlecture.web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.newlecture.web.dao.MemberDao;
import com.newlecture.web.dao.mysql.MySQLMemberDao;
import com.newlecture.web.data.entity.Member;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.util.List;

@WebServlet("/memberlist")
public class MemberList extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		/*==============================================================================*/
		
		String query = request.getParameter("query");
		
		System.out.println(query);
		
		response.setCharacterEncoding("UTF-8"); // �ѱ��� ������ �ʰ� 
		response.setContentType("text/html; charset=UTF-8"); // ũ�ҿ����� html�� ����ǵ��� �ϴ� ����
		
		//OutputStream os = response.getOutputStream();
		//PrintStream out = new PrintStream(os);

		PrintWriter out = response.getWriter();
		// OutputStream/InputStream : byte, Writer/Reader : char ==> ���� �̿ܿ��� Writer/Reader�� ���°� ����
		
		MemberDao memberDao = new MySQLMemberDao();
		List<Member> list = memberDao.getList(query);		
		
		// ================== View ===================================================
		
		for (Member m : list) {
			out.println("ID�� "+m.getId()+"�̰� �н������ "+"<span style='color:red;'>"+m.getPwd()+"</span>"+"�̴�" +"<br />");

		}

	}

}