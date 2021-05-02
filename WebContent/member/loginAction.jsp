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
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>

	<%request.setCharacterEncoding("utf-8"); 
	String userId=request.getParameter("userId");
	String userPwd=request.getParameter("userPwd");
	%>
	
	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />

<%InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
String sql = "select * from miniuser where userid=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,userId);
ResultSet rs = pstmt.executeQuery();


while(rs.next()){
	if(userId.equals(rs.getString(1))&&userPwd.equals(rs.getString(2))){
		session.setAttribute("userId",userId);	
		session.setAttribute("userPwd",userPwd);
		%><script>
		document.location.href="/BBS/main.jsp";
	</script>
	<%

	}else if(!userId.equals(rs.getString(1))){
		%><script>
			alert("아이디가 존재하지 않습니다");
			history.back();
		</script>
		<%
	}else if(userId.equals(rs.getString(1))&&!userPwd.equals(rs.getString(2))){
		%><script>
			alert("비밀번호가 틀립니다");
			history.back();
		</script>
		<%	
	}	
	
}	
rs.close(); pstmt.close();  conn.close();


%>

</body>
</html>