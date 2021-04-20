<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import = "user.UserDAO" %>
	<%@ page import = "java.io.PrintWriter" %> 
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="user" class="user.User" scope="page"/>
	<jsp:setProperty name="user" property="userID" />
	<jsp:setProperty name="user" property="userPassword" />
	<jsp:setProperty name="user" property="userName" />
	<jsp:setProperty name="user" property="userGender" />
	<jsp:setProperty name="user" property="userEmail" />
	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ㅇㅇㅇ의 미니홈피</title>
</head>
<body>
		<%
		// 현재 세션 상태를 체크한다
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		// 이미 로그인했으면 회원가입을 할 수 없게 한다
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		
		
	if(user.getUserID() == null || user.getUserPassword() == null ||user.getUserName()==null||
			user.getUserGender() == null || user.getUserEmail() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			//회원가입에 성공했을 때 세션을 부여하는 코드 추가
			session.setAttribute("userID", user.getUserID());
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	}
%>
</body>
</html>