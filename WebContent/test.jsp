<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="./css/test.css" />
<link rel="stylesheet" href="./css/1_font_style.css" />
</head>
<body>

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
		</div>
	</nav>
	<div class="col-lg-4"></div>



	<form>
		<h3 class="font1" style="text-align: center">Profile</h3>

		<img style="position: static;" src="images/background1.jpg"> <a
			style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 107.5px; left: 37px; font-size: 17px;">ID</a>

		<div class="form-group"
			style="display: inline-block; position: relative; bottom: 107.5px; left: 70px; width: 200px;">
			<input type="text" class="form-control" placeholder="Id"
				name="userID" maxlength="20">
		</div>

		<a
			style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 107.5px; left: 107px; font-size: 17px;">GENDER</a>

		<div class="form-group"
			style="display: inline-block; position: relative; bottom: 107.5px; left: 139px; width: 200px;">
			<input type="text" class="form-control" placeholder="gender"
				name="userID" maxlength="20">
		</div>

		<a
			style="position: relative; font-family: 'Wemakeprice-Bold'; top: 20px; right: 475px; font-size: 17px;">PWD</a>

		<div class="form-group"
			style="display: inline-block; position: relative; bottom: 125px; left: 292px; width: 200px;">
			<input type="text" class="form-control" placeholder="pwd"
				name="userID" maxlength="20">
		</div>

		<a
			style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 125px; left: 338px; font-size: 17px;">NAME</a>

		<div class="form-group"
			style="display: inline-block; position: relative; bottom: 125px; left: 381px; width: 200px;">
			<input type="text" class="form-control" placeholder="gender"
				name="userID" maxlength="20">
		</div>
		
		<a
			style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 31px; right: 125px; font-size: 17px;">EMAIL</a>
		
		<div class="form-group"
			style="display: inline-block; position: relative; bottom: 33px; right: 95px; width: 300px;">
			<input type="text" class="form-control" placeholder="email"
				name="userID" maxlength="20">
		</div>
		
		<input style="width:200px; height:90px; bottom:20px;
		position: relative;" type="text" name="info">
		
	<input style="position: relative;
    top: 38px;" type="submit" class="btn-primary1 form-control" value="수정하기">
		
		

	</form>
</body>
</html>