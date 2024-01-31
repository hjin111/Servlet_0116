<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일기장</title>
</head>
<body>

	<h2>일기장</h2>
	<%-- 현재 날짜 시간 정보 --%>
	<%-- 정적 방식 => ex01 안에서 자바 코드가 처리가 됨 --%>
	<%@ include file="date.jsp" %>
	<%= dateString %><%-- 정적 방식에서는 dateString이라는 변수를 여기서 직접 쓸 수가 있음 date.jsp안에 있는 변수지만 여기 안에 있는 코드가 그대로 ex01에 적용되는거기 때문에 date.jsp 파일 안에 있는 변수를 직접 쓸 수가 있음  --%>
	<%-- 동적 방식 => ex01에서 포함 되기 전에 코드가 처리가 되어서 완성된 결과가 ex01에 포함된다 / 가능하다면 동적 방식을 쓰자!! --%>
	<jsp:include page="date.jsp" />
	<%-- <%= dateString --%><%-- 동적 방식에서는 date.jsp에 있는 자바 코드는 이미 다 사라지고 결과 태그만 여기 포함되기 떄문에 dateString이라는 문자열 자체가 변수가 없다(에러가 남)--%>
	<%-- jsp 안에 들어 있는 결과물에 html코드만 필요하다 그러면 동적 방식을 쓰면 되고 그 안에 있는 코드에 자바 코드도 활용을 해야된다 그러면 정적 방식을 활용하면 된다.  --%>
	<hr>
	
	<div>
		오늘 너무 추운 날이다. 너무 힘들었다. 그래도 오늘도 해냈다 고생했어!!
	</div>
	
</body>
</html>