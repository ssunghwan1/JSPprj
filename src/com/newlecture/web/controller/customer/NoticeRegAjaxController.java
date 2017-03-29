package com.newlecture.web.controller.customer;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//@WebServlet("/customer/notice-reg-ajax")
public class NoticeRegAjaxController extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath("/customer/upload");
		PrintWriter out = response.getWriter();
		
		out.println(path);

		File d = new File(path);
		if(!d.exists()) //경로가 존재하지 않는다면
			d.mkdir();	
			
		MultipartRequest req = new MultipartRequest(request
		, path
		, 1024*1024*10
		, "UTF-8"
		, new DefaultFileRenamePolicy());
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
			
		out.println("<br/>"+title);
		out.println("<br/>"+content);
		
		NoticeDao noticeDao = new MySQLNoticeDao();
		
		
		int result = noticeDao.add(title,content,"newlec");
		String noticeCode = noticeDao.lastCode();
		
		NoticeFileDao noticeFileDao = new MySQLNoticeFileDao();
		
		Enumeration fnames=req.getFileNames();	
		
		while(fnames.hasMoreElements()){
			String f= (String)fnames.nextElement();
			String fname=req.getFilesystemName(f);
			NoticeFile file = new NoticeFile();
			
			file.setNoticeCode(noticeCode);
			file.setSrc(fname);
		 	noticeFileDao.add(file);// 여기서 오류

			out.println("<br />"+fname);
			out.println("<br />"+fname);
		} 
		
		if(result > 0)
			response.sendRedirect("notice.jsp");
	}
}
