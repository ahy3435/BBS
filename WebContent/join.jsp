<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="./css/design.css" />
<link rel="stylesheet" href="./css/1_font_style.css" />
<title>ㅇㅇㅇ의 미니홈피</title>
<style>
body {
	margin: 0;
}
</style>
</head>
<body>

	<jsp:include page="header.jsp"/>
	
	
		<div class="col-lg-4"></div>
		<div>
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="joinProsEx01.jsp">
					<h3 class="font1" style="text-align: center;">Join</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userId" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPwd" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일"
							name="email" maxlength="50">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" name="gender" autocomplete="off" value="남자"
								checked>남자
							</label> <label class="btn btn-primary"> <input type="radio"
								name="gender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>
					</div>


					
					<input type="submit" class="btn-primary1 form-control" value="로그인">
					<input style="text-align:center" type="submit" class="btn-primary form-control" value="가입완료">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>