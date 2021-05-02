<%@page import="java.util.*,gallery.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%

String userId = (String)session.getAttribute("userId");

	MultipartRequest multi = null;
	String path = application.getRealPath("/upload");//시스템 물리적인 경로
	System.out.println(path);
	int size = 1024*1024*10;
	System.out.println("asd");
		multi = new MultipartRequest(
		request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		String GalleryTitle = multi.getParameter("GalleryTitle");
		String GalleryContent = multi.getParameter("GalleryContent");
		Enumeration files = multi.getFileNames();
		String name = (String)files.nextElement();
		String file = multi.getFilesystemName(name);
		String orgFile = multi.getOriginalFileName(name);
		
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		Connection conn = ds.getConnection();

		PreparedStatement pstmt = conn.prepareStatement("insert into gallery values(?,?,to_date(sysdate,'yyyy-mm-dd hh24:mi'),?,?,?,?)");
		pstmt.setInt(1, 5);
		pstmt.setString(2, userId);
		pstmt.setString(3, GalleryTitle);
		pstmt.setString(4, GalleryContent);
		pstmt.setString(5, orgFile);
		pstmt.setInt(6, 1);
		pstmt.execute();
		
		pstmt.close();
		conn.close();
		response.sendRedirect("test.jsp");
	
	
	
	
	
	
	%>
</body>
</html>