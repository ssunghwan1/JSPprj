<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<a href="../index.html">메인 페이지</a>
		<c:if test="${empty sessionScope.id }">
		<a href="joinus/login">로그인</a>
		</c:if>
		<c:if test="${not empty sessionScope.id  }">
		<a href="joinus/logout">${sessionScope.id }님 로그아웃</a>
		</c:if>
		<a href="join.html">회원가입</a>
		<a href="customer/notice">고객센터</a>
	</header>
	<h1>로그인</h1>
</body>
</html>