<%@page import="com.newlecture.web.dao.NoticeDao"%>
<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String code = request.getParameter("code");
	
	System.out.println(title);	
	System.out.println(content);	
	System.out.println(code);
	NoticeDao noticeDao = new MySQLNoticeDao();

	
	int result = noticeDao.update(title, content, code);


	if(result > 0)
		response.sendRedirect("notice-detail.jsp?c="+code);

%>    