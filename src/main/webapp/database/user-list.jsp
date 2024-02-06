<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jinju.servlet.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 리스트</title>
</head>
<body>

	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect(); // DB 접속 
		
		// select 쿼리 수행하는 메서드 
		ResultSet resultSet = mysqlService.select("SELECT `name`, `yyyymmdd`, `email` FROM `new_user`;");
		// resultSet 객체는 해당 테이블을 모두 가지고 있는 녀석이 아니라 결과를 한 행씩 가르키고 있는 놈이다.
		// 한 행씩 반복해서 처리하는 형태로 사용해주면 됨
		
	%>

	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>생년월일</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<% while(resultSet.next()){ // resultSet이 한 행씩 가르키고 그 가리키는 상태에서 값들 채워주기%>
			<tr><!-- 한 행의 정보를 표현하는 태그 범위이다 -->
				<td><%= resultSet.getString("name") %></td>
				<td><%= resultSet.getString("yyyymmdd") %></td>
				<td><%= resultSet.getString("email") %></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>