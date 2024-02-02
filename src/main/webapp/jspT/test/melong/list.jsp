<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Melong</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>

	<div id="wrap" >
		<header class="d-flex">
			<div class="logo d-flex align-items-center">
				<h1 class="text-success">Melong</h1>
			</div>
			<div class="search d-flex align-items-center">
				<div class="input-group col-5"><!-- col-5 : 12칸 기준으로 5칸 -->
				  <input type="text" class="form-control">
				  <div class="input-group-append">
				    <button class="btn btn-success" type="button">검색</button>
				  </div>
				</div>
			</div>
		</header>
		<nav class="main-menu">
			<ul class="nav font-weight-bold">
				<li class="nav-item"><a class="nav-link text-dark" href="#">멜롱챠트</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">최신음악</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">장르음악</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">멜롱DJ</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">뮤직어워드</a></li>
			</ul>
		</nav>
		<section class="contents">
			<div class="singer d-flex border border-success p-3 mt-3">
				<div class="image">
					<img width="150" src="https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/111/535/81111535_1539157728291_1_600x600.JPG">
				</div>
				<div class="info ml-4"><!-- ml : 마진 왼쪽 -->
					<h1>아이유</h1>
					<div>JYP엔터테이먼트</div>
					<div>2009 데뷔</div>
				</div>
			</div>
		</section>
		<footer>
			<hr>
			<div class="small text-secondary">Copyright © melong 2024</div>
		</footer>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>