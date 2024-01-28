<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
		// 리스트 안에 들어 있는 하나의 객체는 HashMap이다 
		// HashMap의 형태는 name, menu, point라는 key로 각각의 대응되는 값들을 저장 하고 있다.
		// 똑같은 key를 가진 Map들을 처리하는 거니깐 하나의 처리 방식을 반복해서 수행하면 모두 처리 됨
		List<Map<String, Object>> list = new ArrayList<>();
	    Map<String, Object> map = new HashMap<String, Object>() {{ put("name", "버거킹"); put("menu", "햄버거"); put("point", 4.3); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BBQ"); put("menu", "치킨"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "교촌치킨"); put("menu", "치킨"); put("point", 4.1); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "도미노피자"); put("menu", "피자"); put("point", 4.5); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "맥도날드"); put("menu", "햄버거"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BHC"); put("menu", "치킨"); put("point", 4.2); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "반올림피자"); put("menu", "피자"); put("point", 4.3); } };
	    list.add(map);
	    
	    // 웹 페이지에서 파라미터는 request안에 포함된 거를 전달받아서 활용 하는 거기 때문에 
	    // 서블릿에서는 톰캣이 만들어준 request 객체로부터 파라미터 얻어오면 됨
	    String menu = request.getParameter("menu");
	%>

	<div class="container">
		<h1 class="text-center">검색 결과</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>매뉴</th>
					<th>상호</th>
					<th>별점</th>
				</tr>
			</thead>
			<tbody>
				<% for(Map<String, Object> store:list) {
					// menu라는 key의 저장된 value값이
					// 저장하는 당시에는 업캐스팅을 통해서 자연스럽게 저장이 되지만 ( String인데 Object로 자연스럽게 업캐스팅 )
					// 저장된 값을 리턴 받아서 쓸 때는 String이 아니라 Object 객체가 리턴 됨
					// 그래서 다운 캐스팅을 해줘야함 
					String storeMenu = (String)store.get("menu"); // Object에서 String으로 다운 캐스팅 
					if(storeMenu.equals(menu)){
				%>
				<tr>
					<td><%= store.get("menu") %></td>
					<td><%= store.get("name") %></td>
					<td><%= store.get("point") %></td>
				</tr>
				<%}
				} %>
			</tbody>
		</table>
	</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>