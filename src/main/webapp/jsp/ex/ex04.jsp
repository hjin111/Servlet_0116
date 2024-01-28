<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료구조 활용</title>
</head>
<body>

	<%
		// 과일 이름 리스트
		List<String> fruitList = new ArrayList<>();
		fruitList.add("사과");
		fruitList.add("바나나");
		fruitList.add("딸기");
		
		String fruitString = "";
		for(int i = 0; i < fruitList.size(); i++){
			fruitString += fruitList.get(i)+ " ";
		}
	%>
	
	<h4><%= fruitString %></h4>
	
	<table border="1">
		<% for(int i = 0; i < fruitList.size(); i++) { %>
		<tr>
			<td><%= fruitList.get(i) %></td>
		</tr>	
		<% } %>
	<%-- <tr>
		<td><%=fruitList.get(0) %></td>
	</tr>
	<tr>
		<td><%=fruitList.get(1) %></td>
	</tr>
	<tr>
		<td><%=fruitList.get(2) %></td>
	</tr> --%>
	<!-- 똑같은 패턴의 태그 반복시키기 ( 반복문을 통해서 tr태그 여러개 만들기 )-->
		<% for(String fruit : fruitList) { %>
		<tr>
			<td><%= fruit %></td>
		</tr>
		<% } %>
	</table>
	
	<%
		// 과목 성적 맵 - 두 학생의 성적 정보를 map으로 저장
		// {"국어":85, "수학":90, "영어":100} 과목 이름이 key가 되고 그에 대응 되는 점수가 value가 될 것이다 / key는 String(문자열), value(정수)
		Map<String, Integer> scoreMap1 = new HashMap<>(); // HashMap을 통해서 Map 객체를 생성함
		scoreMap1.put("국어",85);
		scoreMap1.put("수학",90);
		scoreMap1.put("영어",100);
		
		Map<String, Integer> scoreMap2 = new HashMap<>();
		scoreMap2.put("국어",50);
		scoreMap2.put("수학",65);
		scoreMap2.put("영어",70);
		
		// 두 개의 map을 List에 하나로 묶어서 저장 하기
		List<Map<String, Integer>> scoreList = new ArrayList<>();
		scoreList.add(scoreMap1);
		scoreList.add(scoreMap2);
		
 	%>
 	
 	<table border="1">
 		<thead>
 			<tr>
 				<th>국어</th>
 				<th>수학</th>
 				<th>영어</th>
 			</tr>
 		</thead>
 		<tbody>
 			<%
 				// tr태그를 범위로 List를 통한 반복문을 수행
 				for( int i = 0; i < scoreList.size(); i++){
 					// 리스트를 통해서 객체 하나를 먼저 끄집어낸다.
 					Map<String, Integer> scoreMap = scoreList.get(i); // 리스트 안에 들어 있는 하나의 객체(Map 객체)를 끄집어내기
 					
 				// 향상된 for문
 				// for(Map<String, Integer> scoreMap : scoreList) {
 			%>
 			<tr>
 				<td><%= scoreMap.get("국어") %></td>
 				<td><%= scoreMap.get("수학") %></td>
 				<td><%= scoreMap.get("영어") %></td>
 			</tr>
 			<% } %>
 		</tbody>
 	</table>
</body>
</html>