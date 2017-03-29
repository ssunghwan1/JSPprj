
<%@page import="com.newlecture.web.dao.NoticeDao"%>
<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String code = request.getParameter("c");
	System.out.println("code: "+code);
	NoticeDao noticeDao = new MySQLNoticeDao();
	System.out.println("!!!!!!!!!!!!!!!!!!!");
	int result = noticeDao.delete(code);
	System.out.println("------------------");
	if(result > 0)
		response.sendRedirect("notice.jsp");
	//else
		//에러페이지로 가기

%>    
    