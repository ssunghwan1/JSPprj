
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefitx="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>으갹갹갹</title>
<link href="../css/customer/style.css" type="text/css" rel="stylesheet" />
<script src="../js/customer/notice.js"> </script>

<script>
	window.addEventListener("load", function(e) {
		
		var moreButton = document.querySelector("#more-button");

		var notices = [
			{code:"1", title:"오오오"},
			{code:"2", title:"요요요"},
			{code:"3", title:"유유유"}
		];
		
		
		moreButton.onclick = function(){
			var template = document.querySelector("#notice-row");
			
			for(var i in notices){
				var tbody = document.querySelector(".notice-table tbody");
				var tds = template.content.querySelectorAll("td");
				
				tds[0].innerText = notices[i].code;
				tds[1].innerText = notices[i].title;
				
				var clone = document.importNode(template.content, true);
				tbody.appendChild(clone);
			};
		};
	});
</script>



</head>
<body>
	<!-- ---------------------------------------------헤 더------------------------------------------------------------ -->
	<!-- 헤더부분 -->
	<tiles:insertAttribute name="header" />
	<!-- ---------------------------------------------비주얼------------------------------------------------------------ -->

	<tiles:insertAttribute name="visual" />

	<!-------------------------------------------------바디---------------------------------------------------------- -->
	<div id="body">
		<!-- 섹션과 메인을 div로 묶어줌 -->
		<div class="content-container clearfix">
			<!-- 어사이드 부분 -->
		<tiles:insertAttribute name="aside" />
			
			<!-- 메인부분 -->
			<tiles:insertAttribute name="main" />
		</div>
	</div>

	<!-- -----------------------------------------------푸터---------------------------------------------------------- -->
	<!--부터부분  -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>