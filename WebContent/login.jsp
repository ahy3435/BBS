<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="./css/design.css"/>
   <link rel="stylesheet" href="./css/1_font_style.css"/>
<title>ㅇㅇㅇ의 미니홈피</title>
<!-- <style>
.login{
    background-color: #F4D4DE;
    border-radius: 10px;
    border: 1px solid #6d7085;
    
    width: 1200px;
    height: 650px;

    margin: 50px auto;
    position: relative;}</style> -->
    <style>
    body{
    margin:0;}
    @font-face {
    font-family: 'Wemakeprice-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    </style>
</head>
<body class="grid_background"></body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">ooo의 미니홈피</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li><a href="diary.jsp">일기장</a></li>
				<li><a href="gallery.jsp">사진첩</a></li>
			</ul>
			
			</ul>
		</div>
	</nav>
	<div class="login">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
	
	
	<div class="jumbotron
	" style="padding-top:20px;">
	<form method="post" action="loginAction.jsp">
	<h3 class="font1" style="text-align:center";>Login</h3>
	<div class="form-group">
	<input type="text" class="form-control" placeholder="Id" name="userID" maxlength="20">
	</div>
	<div class="form-group">
	<input type="password" class="form-control" placeholder="Password" name="userPassword" maxlength="20">
	</div>
	<input type="submit" class="btn-primary1 form-control" value="회원가입">
	<input type="submit" class="btn-primary form-control" value="로그인">
	</form>
	</div>
	<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>