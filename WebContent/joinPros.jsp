<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="mini.MiniUser"%>
<%@page import="java.util.*,java.io.*,  javax.sql.*, javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userEmail = request.getParameter("userEmail");
	String userGender = request.getParameter("userGender");
	
	if (userId == null || userPassword == null || userName == null || userEmail == null || userGender == null) {
		%><script>
			alert("입력이 안된 사항이 있습니다");
			history.back();
		</script>
		<%
		}

	else {InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	String sql = "INSERT INTO MINIUSER (USERID,USERPWD,USERNAME,EMAIL,GENDER) VALUES(?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	pstmt.setString(2, userPassword);
	pstmt.setString(3, userName);
	pstmt.setString(4, userEmail);
	pstmt.setString(5, userGender);
	ResultSet rs = pstmt.executeQuery();
		
	//회원가입에 성공했을 때 세션을 부여하는 코드 추가
	session.setAttribute("userId", userId);
	%><script>
		alert("회원가입 성공!");
	</script>
	<%
	

	rs.close();
	pstmt.close();
	conn.close();

	response.sendRedirect("login.jsp");}
	%>
</body>
</html>