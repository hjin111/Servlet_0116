<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post 입력</title>
</head>
<body>
	
	<form method="post" action="/jsp/ex/ex03.jsp">
	<!-- 우리가 지금까지 form 태그에서 파라미터 값으로 사용한거는 사용자가 입력한 값을 그대로 전달하는 input 텍스트만 다루어 봄 -->
		<label>닉네임 : </label><input type="text" name="nickname">
		
		<!-- 셀렉트 박스가 form태그에서 어떻게 값이 전달이 되는지 확인해보자 -->
		<h3>좋아하는 과일 선택</h3>
		<!-- 선택된 option의 값이 이 파라미터 이름으로 전달될것이다 -->
		<!-- select박스에 name 속성 부여해놓으면 선택된 option 값이 그대로 해당하는 파라미터의 값으로 전달되는 것이다. -->
		<select name="fruit"> 
			<option value="banana">바나나</option><!-- value 속성이 있으면 value속성의 값이 전달됨 -->
			<option value="peach">복숭아</option>
			<option>딸기</option>
		</select>
		
		<!-- 라디오 버튼 -->
		
		<!-- 체크박스 -->
		
		<button type="submit">입력</button>
	</form>
	
</body>
</html>