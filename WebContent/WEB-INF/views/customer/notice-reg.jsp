<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>으갹갹갹</title>
<link href="../css/customer/style.css" type="text/css" rel="stylesheet"/>
<script src="../js/customer/notice.js"> </script>

</head>
<body>
	<!-- ---------------------------------------------헤 더------------------------------------------------------------ -->
	<!-- 헤더부분 -->
	<!-- ---------------------------------------------비주얼------------------------------------------------------------ -->
	<div id="visual">
		<!-- 비ㅇ주얼 영역 -->
		<div class="content-container"></div>
	</div>


	<!-- -----------------------------------------------바디---------------------------------------------------------- -->
	<div id="body">
		<!-- 섹션과 메인을 div로 묶어줌 -->
		<div class="content-container clearfix">
			<aside id="aside">
				<!-- div를 시맨틱하게 태그로 표현 (nav, article, aside) -->
				<!-- 	Section 내에서 헤더 푸터 따로 사용 가능. 메인은 사용 불가능 (문서 내 메인은 단 하나만 존재해야함 ) -->
				<h1 class="aside-title aside-main-title aside-margin">고객센터</h1>
				<nav>
					<h1 class="hidden">고객센터 메뉴</h1>
					
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
					<div>
						<h1 class="aside-title margin">추천사이트</h1>
						<ul class="margin">
							<li><a href=""><img src="../images/answeris.png"
									alt="answeris"></a></li>
							<li><a href=""><img src="../images/w3c.png" alt="w3c"></a></li>
							<li><a href=""><img src="../images/microsoft.png"
									alt="마이크로소프트"></a></li>
						</ul>
					</div>
				</nav>
			</aside>


			<main id="main"> <!-- <section id="quick-menu">
						<h2>퀵메뉴</h2>
					</section> -->
				<h2 class="main-title">공지사항 등록</h2>
				<div class="breadcrumb">
					<h3 class="hidden">breadcrumb</h3>
					<ul>
						<li>home</li>
						<li>고객센터</li>
						<li>공지사항</li>
					</ul>
				</div>
				
				<form action="notice-reg-proc" method="post" enctype="multipart/form-data">
					<table border="1">
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title"/></td>
							</tr>
							<tr>
								<th>파일선택</th>
								<td><input type="file" name = "files"/></td>
							</tr>
							
							
							<tr>
								<td colspan="2">
									<textarea rows="20" cols="80" name="content"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<input type="submit" value="등록" /> <a href="notice.jsp">취소</a>
					</div>
				</form>
			</main>

		</div>
	</div>

	<!-- -----------------------------------------------푸터---------------------------------------------------------- -->
	<footer id="footer">
		<div class="content-container">

			<h2>회사정보</h2>
			푸터당
			<div>주소서울특별시 마포구 토정로35길 11, 인우빌딩 5층
				266호관리자메일admin@newlecture.com사업자 등록번호132-18-46763 통신 판매업 신고제
				2013-서울강동-0969 호 상호뉴렉처대표박용우전화번호070-4206-4084 [죄송합니다. 당분간 문의내용은 고개센터
				메뉴에서 1:1 문의를 이용해주시기 바랍니다] Copyright ⓒ newlecture.com 2012-2014 All
				Right Reserved. Contact admin@newlecture.com for more information</div>
		</div>
	</footer>

</body>
</html>