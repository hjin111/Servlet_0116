<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Method</title>
</head>
<body>
	
	<%
		// 파라미터를 얻어오는 과정을 자바 코드를 통해 request 객체로부터 값을 얻어오는 형태로 구성을 했음
		// 그래서 결국 파라미터를 다룬다는 얘기는 자바 코드 안에서 수행 해야 함
		
		// 이름과 생년월일을 전달 받고,
		// 이름과 나이를 테이블 태그로 구성한다.

		// 요청에 대한 처리고 요청에서 전달해주는 값은 request 객체 안에 들어 있는 값을 얻어 와서 그 값을 활용
		// 파라미터는 request 객체를 얻어내는 것?
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		
		int year = Integer.parseInt(birthday.substring(0,4));
		
		int age = 2024 - year + 1;
		
	%>
	
	<table border="1">
		<tr>
			<td>이름</td>
			<td><%= name %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%= age %></td>
		</tr>
	</table>
</body>
</html>