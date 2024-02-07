<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jinju.servlet.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>

	<%
		// MysqlService 클래스는 데이터베이스 접속하는 과정이 꽤 복잡해서 그것을 단순화 해서 간단한 메소드로 활용할 수 있도록 하기 위해 만들었다
		MysqlService mysqlService  = MysqlService.getInstance();
		mysqlService.connect(); // DB 접속
		
		// 쿼리 수행
		// resultSet은 그 테이블 조회된 결과 그 자체가 아니라 조회된 결과를 한 행씩 가르키는 객체 
		ResultSet resultSet = mysqlService.select("SELECT * FROM `favorite` ORDER BY `id` DESC;");
		// 한 행씩 처리하는 반복문을 통해서 처리한다 ( 한 행을 어떻게 처리할지를 정의해서 그게 자연스럽게 반복되도록 수행시켜주면 됨 )
		
	%>
	
	<div class="container">
		<table class="table text-center">
			<thead>
				<tr>
					<th>사이트</th>
					<th>사이트 주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<% // resultSet을 통한 반복문은 현재 가장 첫 번쨰 행보다 더 위쪽을 가르키는 가상의 공간을 가르키는 상태에서 
					// 다음 것을 가르키면서 있는지 없는지 결과를 리턴하고 그 가르키는 대상의 특정 컬럼 값을 가져오는 과정을 활용해주면 됨 
				%>
				<% while(resultSet.next()) { // next()메소드를 호출해주면 이 메소드가 다음 것을 가르키면서 있으면 true 없으면 false 그래서 자연스럽게 있는 경우에 해당하는 반복문이 수행이 된다.다음 행이 없을 때까지 쭉 반복이 됨%>
				<tr>
					<td><%= resultSet.getString("name") %></td>
					<td><a target="_blank" href="<%= resultSet.getString("url") %>"><%= resultSet.getString("url") %></a></td>
					<td><a class="btn btn-danger btn-sm" href="/database/favorite/delete?id=<%= resultSet.getInt("id") %>">삭제</a></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		
		<a href="/database/favorite-input.jsp">즐겨찾기 추가</a>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>