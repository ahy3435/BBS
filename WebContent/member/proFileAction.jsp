<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ page import="java.sql.*"%>
<%@ page import="mini.MiniUser"%>
<%@page import="java.util.*,java.io.*,  javax.sql.*, javax.naming.*"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
		<%request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />

<%InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
String sql = "update miniuser set userPwd=?, userName=?, email=?, infotext=? where userId=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,request.getParameter("userPwd"));
pstmt.setString(2,request.getParameter("userName"));
pstmt.setString(3,request.getParameter("email"));
pstmt.setString(4,request.getParameter("info"));
pstmt.setString(5,request.getParameter("userId"));
pstmt.execute();

conn.close(); pstmt.close();%> 

<script>
alert("수정 되었습니다"); 	document.location.href="/BBS/main.jsp";
</script>

<%-- <%
	MultipartRequest multi = null;
	String path = application.getRealPath("/upload");//시스템 물리적인 경로
	int size = 1024*1024*10;
		multi = new MultipartRequest(
		request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		String userId = multi.getParameter("userId");
		String userPwd = multi.getParameter("userPwd");
		String userName =multi.getParameter("userName");
		String email = multi.getParameter("email");
		String gender = multi.getParameter("gender");
		String infotext = multi.getParameter("infotext");
		Enumeration files = multi.getFileNames();
		String name = (String)files.nextElement();
		String file = multi.getFilesystemName(name);
		String orgFile = multi.getOriginalFileName(name);
		
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		Connection conn = ds.getConnection();

		PreparedStatement pstmt = conn.prepareStatement("update miniuser set userPwd=?, userName=?,	email=?, gernder=?, img=?, infotext=? where userId=?");
		pstmt.setString(1, userPwd);
		pstmt.setString(2, userName);
		pstmt.setString(3, email);
		pstmt.setString(4, gender);
		pstmt.setString(5, orgFile);
		pstmt.setString(6, infotext);
		pstmt.setString(7, userId);
		pstmt.execute();
		
		pstmt.close();
		conn.close();
		
		%>

 --%>

</body>
</html>