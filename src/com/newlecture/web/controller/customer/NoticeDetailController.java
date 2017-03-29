package com.newlecture.web.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.dao.NoticeDao;
import com.newlecture.web.dao.NoticeFileDao;
import com.newlecture.web.dao.mysql.MySQLNoticeDao;
import com.newlecture.web.dao.mysql.MySQLNoticeFileDao;
import com.newlecture.web.data.entity.NoticeFile;
import com.newlecture.web.data.entity.NoticeView;

@WebServlet("/customer/notice-detail")
public class NoticeDetailController extends HttpServlet{
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String title =request.getParameter("title");
	String content =request.getParameter("Content");

	System.out.println(title);
	System.out.println(content);
	
	PrintWriter out = response.getWriter();
	out.println("1");
	
	/*String code = request.getParameter("c");
	
	NoticeDao noticeDao=new MySQLNoticeDao();
	NoticeFileDao noticeFileDao = new MySQLNoticeFileDao();
	
	NoticeView n= noticeDao.get(code);
	NoticeView prev= noticeDao.getPrev(code);
	NoticeView next= noticeDao.getNext(code);

	List<NoticeFile> list = noticeFileDao.getList(n.getCode());
	
	//response.sendRedirect(""); //현재하는 작업을 취소하고 새로운 서블릿을 요청한다.
	request.setAttribute("n", n);
	request.setAttribute("prev", prev);
	request.setAttribute("next", next);
	request.setAttribute("list", list);
	
	
	request.getRequestDispatcher("notice-detail.jsp").forward(request,response); //현재하는 작업을 계속 이어받아 처리할 수 있는 서블릿
	*/
	
	}
}
