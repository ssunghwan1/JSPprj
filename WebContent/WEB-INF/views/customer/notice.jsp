<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<main id="main"> 
			<h2 class="main-title">
				��������[${size}]
			</h2>
			<div class="breadcrumb">
				<h3 class="hidden">breadcrumb</h3>
				<ul>
					<li>home</li>
					<li>������</li>
					<li>��������</li>
				</ul>
			</div>

			<div>
				<h3 class="hidden">���� �˻� ��</h3>
				<form class="main-margin">
					<fieldset>
						<legend class="hidden">�˻��ʵ�</legend>
						<label class="hidden">�˻��з�</label> 
						<select name="f">
							
							<c:if test="${param.f =='TITLE'}">
								<c:set var="selTitle" value="selected" />									
							</c:if>
							<c:if test="${param.f =='CONTENT' }">
								<c:set var="selContent" value="selected" />									
							</c:if>
							
							<option value="TITLE"${sel}>����</option>
							<option value="CONTENT" ${selContent}>����</option>
							
						</select> 
						<label class="hidden">�˻���</label> <input name="q" type="text"
							value="${param.q }" placeholder="�˻�� �Է��ϼ���" /> <input
							class="btn btn-search" type="submit" value="�˻�" /> <input
							type="hidden" name="p" value="1" />
					</fieldset>
				</form>

			</div>

			<div class="notice">
				<h3 class="hidden">�������</h3>
				
				<table class="table notice-table">
					<thead>
						<tr>
							<td>��ȣ</td>
							<td>����</td>
							<td>�ۼ���</td>
							<td>�ۼ���</td>
							<td>��ȸ��</td>
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
			<!-- ����, ��ϵ�, ���嵵, ����, ǥ�� �ƴϸ� ��� div -->
			<div class="margin">
				<div>
					<a href="">����</a>
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
					<a href="">����</a>
				</div>
			</div>

			<div>
				<a href="notice-reg.jsp">�۾���</a>
				<span id="more-button">������</span>
			</div>
			</main>