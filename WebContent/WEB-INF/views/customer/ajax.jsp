
<%@page import="com.newlecture.web.data.entity.NoticeView"%>
<%@page import="com.newlecture.web.dao.NoticeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String _page = request.getParameter("p");
	String _field = request.getParameter("f");
	String _query = request.getParameter("q");

	int pg = 1;
	String field = "TITLE";
	String query = "";

	if (_page != null && !_page.equals(""))
		pg = Integer.parseInt(_page);

	if (_field != null && !_field.equals(""))
		field = _field;

	if (_query != null && !_query.equals(""))
		query = _query;

	NoticeDao dao = new MySQLNoticeDao();
	List<NoticeView> list = dao.getList(pg, field, query);

	int size = dao.getSize(field, query);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/reset.css" type="text/css" rel="stylesheet" />
<link href="../css/customer/style.css" type="text/css" rel="stylesheet" />
<script src="../js/customer/notice.js"></script>
</head>
<body>
	<!-- ------header--------------------------------------------------- -->
	<header id="header">
		<div class="content-container">
			<h1 id="logo">
				<img src="../images/logo.png" alt="뉴렉처 온라인" />
			</h1>

			<section>
				<h1>헤더</h1>

				<nav id="main-menu" class="hr-menu">
					<h1 class="hidden">메인메뉴</h1>
					<input type="button" value="클릭" id="btn-result" />

					<ul>
						<li><a href="">학습가이드</a></li>
						<li><a href="">뉴렉과정</a></li>
						<li><a href="">강좌선택</a></li>
					</ul>
				</nav>

				<div id="lecture-search-form">
					<h3 class="hidden">강좌검색폼</h3>
					<form>
						<fieldset>
							<legend class="hidden">검색 필드</legend>
							<label>과정검색</label> <input type="text" /> <input
								class="lecture-search-botton" type="submit" value="검색" />
						</fieldset>
					</form>
				</div>

				<nav id="account-menu" class="hr-menu">
					<h1 class="hidden">계정메뉴</h1>
					<ul>
						<li class="first"><a href="../index.html">HOME</a></li>
						<li><a href="../joinus/login.html">newlec 로그아웃</a></li>
						<li>회원가입</li>
					</ul>
				</nav>

				<nav id="member-menu" class="hr-menu">
					<h1 class="hidden">회원메뉴</h1>
					<ul>
						<li class="first">마이페이지</li>
						<li><a href="">고객센터</a></li>
					</ul>
				</nav>
			</section>

		</div>
	</header>
	<!-- ------visual--------------------------------------------------- -->
	<div id="visual">
		<div class="content-container">
			<!-- visual -->
		</div>
	</div>
	<!-- ------body--------------------------------------------------- -->
	<div id="body">
		<div class="content-container clearfix">
			<aside id="aside">

				<h1 class="aside-title aside-main-title aside-margin">고객센터</h1>

				<nav>
					<h1 class="hidden">고객센터메뉴</h1>
					<ul>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">공지사항</a></li>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">1:1고객문의</a></li>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">학습안내</a></li>
					</ul>
				</nav>

				<nav>
					<h1 class="aside-title margin">추천사이트</h1>
					<ul class="margin">
						<li><a href=""><img src="../images/answeris.png"
								alt="앤서이즈" /></a></li>
						<li><a href=""><img src="../images/w3c.png" alt="w3c" /></a></li>
						<li><a href=""><img src="../images/microsoft.png"
								alt="마이크로소프트" /></a></li>
					</ul>
				</nav>
			</aside>

			<main id="main">

			<h2 class="main-title">
				공지사항[[[<%=size%>]]]
			</h2>

			<div class="breadcrumb">
				<h3 class="hidden">현재경로</h3>
				<ul>
					<li>home</li>
					<li>고객센터</li>
					<li>공지사항</li>
				</ul>
			</div>

			<form class="main-margin">
				<fieldset>
					<legend class="hidden">검색필드</legend>
					<label class="hidden">검색분류</label> <select name="f">
						<option value="TITLE" <%if (field.equals("TITLE")) {%> selected
							<%}%>>제목</option>
						<option value="CONTENT" <%if (field.equals("CONTENT")) {%>
							selected <%}%>>내용</option>
					</select> <label class="hidden">검색어</label> <input name="q" type="text"
						value="<%=query%>" placeholder="검색어를 입력하세요" /> <input
						class="btn btn-search" type="submit" value="검색" />
				</fieldset>
			</form>

			<div class="notice margin">
				<h3 class="hidden">공지목록</h3>
				<script>
               window.addEventListener("load", function() {

                     var moreButton = document.querySelector("#more-button");
					 var regButton = document.querySelector("#reg-button");

                     regButton.onclick = function() {
						 var request = new window.XMLHttpRequest();
                     	request.open("GET", "notice-reg-partial.jsp", true);
                     	request.onload = function() {

					var screen = document.createElement("div");
                           screen.style.width="100%";
                           screen.style.height="100%";
                           screen.style.position="fixed";
                           screen.style.left="0px";
                           screen.style.top="0px";
                           screen.style.background="#000";
                           screen.style.opacity="0.5";
						   
                           document.body.appendChild(screen);

						   var formScreen = document.createElement("div");
                           formScreen.style.width="100%";
                           formScreen.style.height="100%";
                           formScreen.style.position="fixed";
                           formScreen.style.left="0px";
                           formScreen.style.top="0px";
						   
                           document.body.appendChild(formScreen);

							var formText = request.responseText;
							formScreen.innerHTML = formText;
						   
						   var form = formScreen.querySelector("form");
						   form.style.background = "#fff";
						   form.style.width = "500px";
						   form.style.marginLeft = "auto";
						   form.style.marginRight = "auto";
						   
						   form.style.borderRadius = "3px";
				
						   var script = formScreen.querySelector("script");
						   eval(script.textContent);
					 };
					 request.send();

					 return false;
					 };

                     moreButton.onclick = function() {
                  
                     var request = new window.XMLHttpRequest();
                     request.open("GET", "ajax-data.jsp?p=2", true);
                     request.onreadystatechange = function() {
                        if (request.readyState == 4) {
                           var notices = JSON.parse(request.responseText);
                           var template = document.querySelector("#notice-row");
                           for (var i in notices) {
                              var tbody = document.querySelector(".notice-table tbody");
                              var tds = template.content.querySelectorAll("td");
            
                              tds[0].innerText = notices[i].code;
                              tds[1].innerText = notices[i].title;
            
                              var clone = document.importNode(template.content, true);
                              tbody.appendChild(clone);
                           };
                           document.body.removeChild(screen);
                        }
            
                     };
                     request.send();
                     
                     var screen = document.createElement("div");
                           screen.style.width="100%";
                           screen.style.height="100%";
                           screen.style.position="fixed";
                           screen.style.left="0px";
                           screen.style.top="0px";
                           screen.style.background="#000";
                           screen.style.opacity="0.5";
                           document.body.appendChild(screen);
               
                  };
               });
            </script>
				<table class="table notice-table">
					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					<tbody>
						<template id="notice-row">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						</template>
						<%
							for (NoticeView v : list) {
						%>
						<tr>
							<td><%=v.getCode()%></td>
							<td><%=v.getTitle()%></td>
							<td><%=v.getWriter()%></td>
							<td><%=v.getRegDate()%></td>
							<td><%=v.getHit()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<%
				int last = (size % 10) > 0 ? size / 10 + 1 : size / 10;
			%>
			<div class="margin"><%=pg%>/<%=last%>
				pages
			</div>
			<div class="margin">
				<div>
					<a href="">이전</a>
				</div>
				<ul>
					<%
						for (int i = 0; i < last; i++) {
					%>
					<li><a href="?p=<%=i + 1%>&f = <%=field%>&q = <%=query%>"><%=i + 1%></a></li>
					<%
						}
					%>
				</ul>
				<div>
					<a href="">다음</a>
				</div>
			</div>
			<script>
			
			</script>
			<div>
				<a id = "reg-button" href="notice-reg.jsp">글쓰기</a> <span id="more-button">더보기</span>
			</div>
			</main>

		</div>
	</div>
	<!-- ------footer--------------------------------------------------- -->
	<footer id="footer">
		<div class="content-container">
			<h2>회사정보</h2>
			<div>Copyright ⓒ newlecture.com 2012-2014 All Right Reserved.
				Contact admin@newlecture.com for more information</div>
		</div>
	</footer>


</body>
</html>