<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*,java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.oreilly.servlet.*"%>
<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="./css/design.css" />
<link rel="stylesheet" href="./css/1_font_style.css" />
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
body {
	margin: 0;
}
</style>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="col-lg-4"></div>
	<div>
		<div class="jumbotron" style="padding-top:20px;">
			<form method="post" action="loginPros.jsp">
				<h3 class="font1" style="text-align:center">Login</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Id" name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="Password" name="userPassword" maxlength="20">
				</div>
				<input type="submit" class="btn-primary1 form-control" value="회원가입" onclick="location.href='join.jsp'">
				<input type="submit" class="btn-primary form-control" value="로그인">
	
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>