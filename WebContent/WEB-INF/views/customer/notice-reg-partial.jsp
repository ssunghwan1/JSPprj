<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var f= function(){
		var regButton = document.querySelector(".reg-button");
		
		regButton.onclick=function(){
			
			var form = document.querySelector("#form");
			var formData = new FormData(form);
			var request = new window.XMLHTTpRequest();
			
			var progressBar = document.querySelector("progress");
            request.onprogress = function(event){
               progressBar.value = parseInt((event.loaded / event.total) * 100);
            };
			request.onload= function(event){

			};

			request.open("POST","notice-reg-ajax",true);
			request.send(formData);
			
			alert("tt");
			

			return false;
		};	
	};
	
	f();
</script>

	<form action="notice-reg-proc.jsp" method="post">
		<table border="1">
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" /></td>
				</tr>
				<tr>
					<th>첨부파일<progress value="23" max="100"/></th>
					<td><input type= "file"/></td>
				<tr>
					<td colspan="2">
					<textarea rows="20" cols="80" name="content"></textarea>
					</td>
				</tr>	
			</tbody>
		</table>
		<div>
			<input class = "reg-button" type="submit" value="등록" /> <a href="ajax.jsp">취소</a>
		</div>
	</form>
</body>
</html>