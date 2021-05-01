<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mini.*"%>
<%@ page import="java.io.*"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
	<%
	request.setCharacterEncoding("utf-8");
	%>

	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />

	<%
	if (user.getUserId() == null || user.getUserPwd() == null || user.getUserName() == null || user.getEmail() == null) {
	%><script>
		alert("입력이 안된 사항이 있습니다");
		history.back();
	</script>
	<%
	} else {
	miniUserDAO udao = new miniUserDAO();

	int result = udao.joinUser(user);
	if (result == 1) {		
	%><script>
		alert('환영합니다! "${user.getUserName()}" 님!'); document.location.href="login.jsp";
	</script>
	<%
	}

	else if (result == 0) {
	%><script>
		alert('이미 존재하는 아이디 입니다.');
		history.back();
	</script>
	<%
	}
	}
	%>
</body>
</html>