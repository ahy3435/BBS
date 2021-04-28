<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="mini.MiniUser" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="mini.MiniUser"/>
<jsp:setProperty property="*" name="user"/>

<%miniUserDAO udao = new miniUserDAO();
int result = udao.joinUser(user);
if(result != 1){
	%><script>alert('이미 있는 아이디 입니다'); history.back();</script><%
}
else{
	String loginId = (String)session.getAttribute("userId");
	%><script>alert('환영합니다! "${user.getUserName()}" 님!');</script><%
}
%>
</body>
</html>