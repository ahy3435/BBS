<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />

	<%miniUserDAO udao = new miniUserDAO();
int result = udao.loginUser(user);
if(result==1){
	session.setAttribute("loginName",user.getUserName());
	session.setAttribute("loginId",user.getUserId());
	response.sendRedirect("mainex01.jsp");
}else if(result == 2){
	%><script>alert("회원정보가 존재하지 않습니다"); history.back();</script>
<%}
%>
</body>
</html>