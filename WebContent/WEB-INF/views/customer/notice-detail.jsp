<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

				<table border="1">
					<tbody>
						<tr>
							<th>제목</th>
							<td>
								${n.title}
							</td>
						</tr>
						
						<tr>
							<th>작성자</th>
							<td>
								${n.writer}
							</td>
						</tr>
						
						
						<tr>
							<th>작성일</th>
							<td>
							${n.regDate }
							</td>
						</tr>
						
						<tr>
							<th>조회수</th>
							<td>
							${n.hit }
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<c:forEach var ="f" items="${list }">
								
								<a href="upload/${f.src }"download>${f.src }</a>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								${n.content }
							</td>
						</tr>
						
						
					</tbody>
				</table>
				<div>
					<a href="notice.jsp">목록</a>
					<a href="notice-edit.jsp?c=${n.code}">수정</a>
					<a href="notice-del-proc.jsp?c=${n.code}">삭제</a>					
				</div>
				
				<div>
					<ul>
						<li>
						 	<span>다음글:</span>
							<c:if test="${empty next }">
							<span>다음글이 존재하지 않습니다.</span>
							</c:if>
							<c:if test="${not empty next }">
							<a href ="?c=${next.code} }">${next["title"]}</a>			
							</c:if>
							
					
						</li>
						<li>
							<span>이전글:</span>
							<c:if test="${empty prev }">
							<span>이전글지 존재하지 않습니다.</span>
							</c:if>
							<c:if test="not empty prev">
							<a href="notice-detail.jsp?c=${prev.code }">${prev.title }</a>
							</c:if>
						</li>
					</ul>
				</div>
				
			</main>
