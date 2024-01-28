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
		<h3>좋아 하는 동물</h3>
					<!--  input 태그 자체에 값이 없기 때문에 그냥 선택되었다는 걸 의미하는 on이라는 값만 전달됨 
						  그래서 각 input들이 어떤 값을 의미하는지를 미리 부여한다 ( value 속성 값 부여 ) -->
		<label>강아지<input type="radio" name="animal" value="dog"></label>
		<label>고양이<input type="radio" name="animal" value="cat"></label>
		<label>사자<input type="radio" name="animal" value="lion"></label>
		
		<!-- 체크박스 -->
		<h3>좋아하는 음식을 모두 고르세요</h3>
		<label>민트초코<input type="checkbox" name="food" value="민초"></label>
		<label>하와이안 피자<input type="checkbox" name="food" value="하와이안피자"></label>
		<label>번데기<input type="checkbox" name="food" value="번데기"></label>
		
		<button type="submit">입력</button>
	</form>
	
</body>
</html>