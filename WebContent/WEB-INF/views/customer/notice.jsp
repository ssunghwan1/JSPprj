<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<main id="main"> 
			<h2 class="main-title">
				공지사항[${size}]
			</h2>
			<div class="breadcrumb">
				<h3 class="hidden">breadcrumb</h3>
				<ul>
					<li>home</li>
					<li>고객센터</li>
					<li>공지사항</li>
				</ul>
			</div>

			<div>
				<h3 class="hidden">과정 검색 폼</h3>
				<form class="main-margin">
					<fieldset>
						<legend class="hidden">검색필드</legend>
						<label class="hidden">검색분류</label> 
						<select name="f">
							
							<c:if test="${param.f =='TITLE'}">
								<c:set var="selTitle" value="selected" />									
							</c:if>
							<c:if test="${param.f =='CONTENT' }">
								<c:set var="selContent" value="selected" />									
							</c:if>
							
							<option value="TITLE"${sel}>제목</option>
							<option value="CONTENT" ${selContent}>내용</option>
							
						</select> 
						<label class="hidden">검색어</label> <input name="q" type="text"
							value="${param.q }" placeholder="검색어를 입력하세요" /> <input
							class="btn btn-search" type="submit" value="검색" /> <input
							type="hidden" name="p" value="1" />
					</fieldset>
				</form>

			</div>

			<div class="notice">
				<h3 class="hidden">공지목록</h3>
				
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
						
						<c:forEach var ="v" items="${list }">
										
						<tr>
							<td>${v.code}</td>
							<td><a href="notice-detail?c=${v.code }">${v.title }</a></td>
							<td>${v.writer }</td>
							<td>${v.regdate }</td>
							<td>${v.hit }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			

			<c:set var="last" value="${(size % 10) > 0 ? size / 10 + 1 : size / 10}"></c:set>
			<div class="margin">${param.p}/${last }
				pages
			</div>
			<!-- 제목도, 목록도, 문장도, 폼도, 표도 아니면 모두 div -->
			<div class="margin">
				<div>
					<a href="">이전</a>
				</div>
				<ul>
				       <c:forEach var="i"  begin="1" end="${last }">
                  <li><a href="?p=${i }&f=${param.f }&q=${param.q}">${i }</a></li>
                     </c:forEach>
					<%-- 
					<li><a href="?p=2&f=<%=field %>&q=<%=query %>">2</a></li>
					<li><a href="?p=3&f=<%=field %>&q=<%=query %>">3</a></li>
					<li><a href="?p=4&f=<%=field %>&q=<%=query %>">4</a></li>
					<li><a href="?p=5&f=<%=field %>&q=<%=query %>">5</a></li>
					 --%>
				</ul>
				<div>
					<a href="">다음</a>
				</div>
			</div>

			<div>
				<a href="notice-reg.jsp">글쓰기</a>
				<span id="more-button">더보기</span>
			</div>
			</main>