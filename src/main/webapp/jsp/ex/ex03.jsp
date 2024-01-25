<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post method</title>
</head>
<body>

	<%
		// 닉네임을 전달 받고 보여주는 기능
		String nickname = request.getParameter("nickname");
	
		// 좋아하는 과일을 전달 받는 파라미터를 정해보자
		String fruit = request.getParameter("fruit");
		
	%>
	
	<h3><%= nickname %></h3>
	<h3><%= fruit %></h3>
</body>
</html>