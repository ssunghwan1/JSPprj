<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String _x = request.getParameter("x"); //임시변수라서  _x로 쓴다.
	String _y = request.getParameter("y");

	// x,y 가 필수 입력 값이라면
	/*int x = Integer.parseInt(_x);
	int y = Integer.parseInt(_y);*/
	
	// x,y 가 필수가 아닌 옵션 값이라면
	int x = 0;
	int y = 0;
	
	if(_x != null && !_x.equals("")) // x가 전달된 것이 있다면
		x = Integer.parseInt(_x);
	
	if(_y != null && !_y.equals(""))
		y = Integer.parseInt(_y);
	
	// 쿼리 스트링이 전달되는 방식 3가지
	/*
	 * /calc        -> x=null
	/calc?x=&y=     -> x=""
	/calc?x=1&y=2   -> x=1
	 * */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕? Jasper</title>
</head>
<body>
	<form action="calc" method="get">
		<p>
			<label>x:</label>
			<input name="txt-x" id="x" /> 
			<label>y:</label>
			<input name="txt-y" id="y" />
		</p>
		<p>
			sum = <input id="txt-sum" value="7"/>
		</p>
		<p>
			<input id="btn-sum" type="submit" value="결과" />
		</p>
	</form>

</body>
</html>