<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	
	<%
		int height = Integer.parseInt(request.getParameter("height")); // 키는 height라는 이름에 파라미터로 전달 받을 거다
		int weight = Integer.parseInt(request.getParameter("weight")); // 여기서 파라미터 이름을 정하는 것이다
		
		// BMI =  몸무게 / ((키 / 100.0) * (키 / 100.0));
		double bmi = weight / ((height / 100.0) * (height / 100.0));
		
		/* 
		수치	결과
		18.5 미만	저체중
		18.5 이상 ~ 25 미만	정상
		25 이상 ~ 30 미만	과체중
		30 이상	비만 
		*/
		String status = null;
		if(bmi < 18.5){
			status = "저체중";			
		} else if(bmi < 25){ // else if는 위에 if 조건문을 만족하지 않았을 때 내려온 것 ( 즉, 저 조건 만족 안하면 18.5 이상이라는 뜻 )
			status = "정상";
		} else if(bmi < 30){
			status = "과체중";
		} else {
			status = "비만";
		}

	%>
	
	<div class="container">
		<h1>BMI 측정 결과</h1>
		<div class="display-4">당신은 <span class="text-info"><%= status %></span> 입니다</div>
		<div >BMI 수치 : <%= bmi %></div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	
</body>
</html>