<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
		List<Map<String, Object>> list = new ArrayList<>();
	    Map<String, Object> map = new HashMap<String, Object>() {
	        { 
	            put("id", 1000);
	            put("title", "아몬드"); 
	            put("author", "손원평"); 
	            put("publisher", "창비");
	            put("image", "http://image.kyobobook.co.kr/images/book/xlarge/267/x9788936434267.jpg");
	        } 
	    };
	    list.add(map);
	
	    map = new HashMap<String, Object>() {
	        { 
	            put("id", 1001);
	            put("title", "사피엔스"); 
	            put("author", "유발 하라리"); 
	            put("publisher", "김영사");
	            put("image", "http://image.kyobobook.co.kr/images/book/xlarge/464/x9788934972464.jpg");
	        } 
	    };
	    list.add(map);
	
	    map = new HashMap<String, Object>() {
	        { 
	            put("id", 1002);
	            put("title", "코스모스"); 
	            put("author", "칼 세이건"); 
	            put("publisher", "사이언스북");
	            put("image", "http://image.kyobobook.co.kr/images/book/xlarge/892/x9788983711892.jpg");
	        } 
	    };
	    list.add(map);
	
	    map = new HashMap<String, Object>() {
	        { 
	            put("id", 1003);
	            put("title", "나미야 잡화점의 기적"); 
	            put("author", "히가시노 게이고"); 
	            put("publisher", "현대문학");
	            put("image", "http://image.kyobobook.co.kr/images/book/xlarge/194/x9788972756194.jpg");
	        } 
	    };
	    list.add(map);
	    
	    // 요청하는 쪽에서 뭔가를 전달할 수 있는 것은 파라미터 밖에 없다 
	    // 이 페이지를 요청하는 쪽에서 내가 이 책을 보고싶어요 라고 값을 전달하면 책 목록 중에 너가 보고싶은게 이거구나 하고 보여줄 수 있어야 함
	    // 요청하는 쪽에서 원하는 책 정보를 전달할 수 있도록 파라미터 추가해야 함
	    // 내가 보고 싶은 책 제목은 사피엔스하면 사피엔스를 보여주도록 할 수 있으니깐 책 제목을 전달받아야 함
	    int id = Integer.parseInt(request.getParameter("id")); // 요청하는 쪽에서 뭔가 정해서 전달할 수 있도록 title이라는 파라미터 이름으로 책 제목을 전달하도록 페이지를 구성
	    // 근데 책 제목이 같은게 있을 수 있으므로 파라미터로는 책 제목이 애매하다.
	%>
	<div class="container">
		<% for(Map<String, Object> book:list) {
			int bookId = (int)book.get("id");
			if(id == bookId){
				
		%>
		<div class="d-flex">
			<div>
				<img src="<%= book.get("image") %>">			
			</div>
			<div class="ml-4">
				<div class="display-1 font-weight-bold"><%= book.get("title") %></div>
				<div class="display-2 text-info"><%= book.get("author") %></div>
				<div class="display-4"><%= book.get("publisher") %></div>
			</div>
		</div>
		<%} 
		} %>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>