<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.io.*, gallery.Gallery"%>
<%@ page import="gallery.GalleryDAO"%>
<%@ page import="java.io.PrintWriter"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="gallery" class="gallery.Gallery" scope="page" />
<jsp:setProperty name="gallery" property="galleryTitle" />
<jsp:setProperty name="gallery" property="galleryContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<<jsp:useBean id="product" class="gallery.Gallery" scope="request" />
	<%
	String galleryId = request.getParameter("galleryId");
	String userId = request.getParameter("userId");
	String galleryDate = request.getParameter("galleryDate");
	String galleryContent = request.getParameter("galleryContent");
	String galleryImagename = request.getParameter("galleryImagename");
	
	InitialContext ic = new InitialContext();

	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("insert into gallery values(?,?,?,?,?,?)");
	pstmt.setString(1, galleryId);
	pstmt.setString(2, userId);
	pstmt.setString(3, galleryDate);
	pstmt.setString(4, galleryContent);
	pstmt.setString(5, galleryImagename);
	ResultSet rs = pstmt.executeQuery();
	response.sendRedirect("galleryList.jsp");
	%>
</body>
</html>