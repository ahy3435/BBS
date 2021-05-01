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
		<%request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />

<%InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
String sql = "update miniuser set userPwd=?, userName=?, email=?, gernder=?, img=?, infotext=? where userId=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,request.getParameter("userPwd"));
pstmt.setString(2,request.getParameter("userName"));
pstmt.setString(3,request.getParameter("email"));
pstmt.setString(4,request.getParameter("gender"));
pstmt.setString(5,request.getParameter("img"));
pstmt.setString(6,request.getParameter("infotext"));
pstmt.setString(7,request.getParameter("userId"));
pstmt.execute();

conn.close(); pstmt.close();%>



</body>
</html>