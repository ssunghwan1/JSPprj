<%@page import="com.newlecture.web.data.entity.NoticeView"%>
<%@page import="com.newlecture.web.dao.NoticeDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>

<%@page import="java.util.List"%>
<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<main id="main"> <!-- <section id="quick-menu">
						<h2>퀵메뉴</h2>
					</section> -->
				<h2 class="main-title">공지사항 내용</h2>
				<div class="breadcrumb">
					<h3 class="hidden">breadcrumb</h3>
					<ul>
						<li>home</li>
						<li>고객센터</li>
						<li>공지사항</li>
					</ul>
				</div>
				<form action="notice-edit-proc.jsp" method="post">
				<table border="1">
					<tbody>
						<tr>
							<th>제목</th>
							<td><input name="title" type="text" value="<%=n.getTitle() %>"/></td>
						</tr>
						
						<tr>
							<th>작성자</th>
							<td><input type="text" value="<%= n.getWriter()%>"/></td>
						</tr>
						
						
						
						<tr>
							<th>작성일</th>
							<td><%=n.getRegDate()%></td>
						</tr>
						
						<tr>
							<th>조회수</th>
							<td><%=n.getHit()%></td>
						</tr>
						<tr>
							<td colspan="2">`
								<textarea name="content" rows="20" cols="80"><%=n.getContent()%></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<input type="hidden" name="code" value="<%=code %>"/>
					<input type="submit" value = "저장"/>
					<a href="notice-del-proc.jsp?c=<%=n.getCode()%>">삭제</a>
				</div>
				</form>
			</main>