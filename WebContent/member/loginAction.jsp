<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="mini.MiniUser"%>
<%@page import="java.util.*,java.io.*,  javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="contextPath" value="<%=request.getContextPath()%>" />

	<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	%>

	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />

	<%
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	String sql = "select userpwd from miniuser where userid=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	ResultSet rs = pstmt.executeQuery();

	if(rs.next()){
		if(userPwd.equals(rs.getString(1))){
			session.setAttribute("userId",userId);
			%><script>
			document.location.href = "/BBS/main.jsp";
		</script>
		<%
		}
		else{
			%><script>
			alert("비밀번호가 틀립니다");
			history.back();
		</script>
		<%
		}
	}
	else{
		%><script>
		alert("아이디가 존재하지 않습니다.");
		history.back();
	</script>
	<%
	}
	rs.close();
	pstmt.close();
	conn.close();
	%>

</body>
</html>