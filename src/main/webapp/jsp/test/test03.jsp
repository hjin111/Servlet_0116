<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 시간 정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	
	
	<%
		Date now = new Date();
	
		// 날짜를 표현할 문자열 형태 구성
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy년 M월 d일"); // 생성자에 내가 표현하고 싶은 형태를 규격으로 문자열로 넣어주면 됨
		SimpleDateFormat timeFormatter = new SimpleDateFormat("HH시 mm분 ss초");
		
		// dateFormatter 객체를 기반으로 Date객체를 인자로 전달하면 문자열이 만들어짐
		String dateString = "오늘 날짜 " + dateFormatter.format(now);
		String timeString = "현재 시간 " + timeFormatter.format(now);
		
		// 하나의 페이지에서 뭔가 구분할려고 하면 구분할 수 있는 데이터가 전달이 되어야 한다 => 파라미터 
		// 값을 전달 받아서 구분해야 하는데 뭘 전달 받아서 이걸 구분할까? => "date"라는 문자열을 전달 받으면 날짜를 보여주고 / "time"이라는 문자열을 전달 받으면 시간을 보여줘라 이렇게 규격을 정하기
		// what 파라미터
		// "date" 날짜
		// "time" 시간
		// 정해진 what이라는 파라미터 이름으로 둘 중에 하나를 선택해서 보내주면 date는 날짜 보여주고 time 보내주면 시간 보여주겠다
		// 구분하기 위한 규격을 여기서 하나 만들기 정해진 문자열이 하나 전달이 되면 그 규격에 맞춰서 원하는 결과를 태그에 포함시켜 주기
		// http://localhost:8081/jsp/test/test03.jsp?what=time 주소창에 이렇게 치면 현재 시각 페이지가 나옴
		String what = request.getParameter("what");
		
		String resultString = null;
		if(what.equals("date")){
			resultString = dateString;
		}else{
			resultString = timeString;
		}
		
	%>
	
	<div class="container">
		<div class="display-4"><%= resultString %></div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>