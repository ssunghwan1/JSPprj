<%@page import="com.newlecture.web.data.dao.NoticeDao"%>
<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	NoticeDao noticeDao = new MySQLNoticeDao();

	int result = noticeDao.add(title, content, "newlec");
	
	if(result > 0)
		response.sendRedirect("notice.jsp");
	//else
		//에러페이지로 가기

%>    
    