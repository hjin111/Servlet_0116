<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보입력</title>
</head>
<body>

	<!-- 이름과 생년월일을 입력하기 위한 input과 이 입력된 내용을 아까 만든 ex02.jsp로 요청 하기 위한 form 태그가 필요할 것 같음 -->
	<!-- input에 입력된 값이 ex02.jsp의 파라미터로 전달될 수 있도록 구성을 해 볼거임 -->
	<form method="get" action="/jsp/ex/ex02.jsp">
		<label>이름 : </label><input type="text" name="name"><!-- input에 입력된 값이 파라미터로 전달 되어야 하는데 파라미터의 이름이 필요하니깐 해당되는 input에 대응되는 파라미터 이것도 마찬가지로 ex02.jsp에서 다 정해놓은 거임 거기에 맞춰서 대응되는 파라미터 이름을 속성으로 명시해 주면 된다 -->
		<label>생년월일 : </label><input type="text" name="birthday">
		<button type="submit">입력</button>
		<!-- 이 버튼을 누르면 form 태그 속성에 있는 method로 action에 있는 주소에다가 요청을 하는데 그때 input에 name 속성에 대응되는 파라미터 이름으로 입력된 값들이 같이 전달이 된다 -->
	</form>
	
</body>
</html>