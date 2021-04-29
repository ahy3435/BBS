<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="mini.*"%>
<%@page import="java.util.*,java.io.*,  javax.sql.*, javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />

	<%
	if (user.getUserId() == null || user.getUserPwd() == null || user.getUserName() == null || user.getEmail() == null) {
		%><script>
			alert("입력이 안된 사항이 있습니다");
			history.back();
		</script>
		<%
		}else{
		miniUserDAO udao = new miniUserDAO();
	
int result = udao.joinUser(user);
if(result == 1){
	String loginId = (String)session.getAttribute("userId");
	%><script>alert('환영합니다! "${user.getUserName()}" 님!');</script>
	<%
}

else if(result ==-1){

	%><script>alert('이미 존재하는 아이디 입니다.'); history.back();</script>
	<%
}}
%>

	


</body>
</html>