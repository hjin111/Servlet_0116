<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 문법</title>
</head>
<body>
	<h2> 1. 기본 문법 </h2>
	
	<!-- html 주석  -> response에 그대로 담겨서 전달 된다 -->
	<%-- jsp 주석 -> 서버에서 제거됨( 사용자에게 안보여짐 ) --%>
	<%-- 스크립트릿 : 자바 코드 작성 --%>
	<%
		// 자바 문법 시작
		// 1부터 10까지의 합 구하기
		int sum = 0;
		for(int i = 1; i <= 10; i++){
			sum += i;
		}
	%>
	
	<h3>합계 : <%= sum %><h3>
	<input type="text" value="<%=sum%>">
	
	<<%= sum %>>??</<%= sum %>>
	
	<%= sum * 2 %>
	
	<h3>2. 리스트 다루기</h3>
	
	<%
		// 동물이름 저장 리스트
		List<String> animalList = new ArrayList<>();
		animalList.add("dog");
		animalList.add("cat");
	%>
	
	<ul>
		<li><%= animalList.get(0) %></li>
		<li><%= animalList.get(1) %></li>
	</ul>
	
	<h3>3. 선언부</h3>
	<%!
		// 메소드 선언
		// hello world 문자열을 리턴하는 메소드
		public String getHelloWorld(){
			return "Hello World";
		}
	%>
	
	<h3><%= getHelloWorld() %></h3>
	
</body>
</html>