<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴검색</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	
	<%
		// form 태그는 입력된 내용을 파라미터로 하는 주소요청을 할 뿐인거고 ( action에 있는 주소로 input에 입력한 값을 menu라는 파라미터로 요청하기 위한 요청만 만들뿐이다 )
		// test07.jsp 페이지는 menu라는 파라미터로 전달된 값으로 검색 결과를 보여준다 
	%>
	<div class="container">
		<h1>메뉴검색</h1>
		<form method="get" action="/jsp/test/test07.jsp">
			<div class="d-flex">
				<input type="text" class="form-control col-4" name="menu"> 
				<!-- checkbox는 기본적으로 체크가 됐다 라고 하는 정보를 on이라는 값으로 표현 합니다 왜? 해당 input에는 별다른 값이 없으니깐 
				input type이 text는 사용자가 입력한 값이 있고 그 값을 value로 지정해서 해당하는 값을 name속성의 값으로(이 파라미터 이름으로 )전달을 해줌 
				input 태그는 value 속성에 있는 값을 값으로 전달해요 -->
				<!-- on으로 표현되는게 적절하다고 판단 되면 그냥 그래도 쓰면 되고( value 없이 )
					정해진 값을 부여 하고 싶으면 valuer 값 지정하기 -->
				<label><input type="checkbox" name="option" >4점 이하제외</label>
			</div>
			<button type="submit" class="btn btn-success">검색</button>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>