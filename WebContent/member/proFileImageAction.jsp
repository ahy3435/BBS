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

<%
	MultipartRequest multi = null;
	/* String path = "C:\\workspace\\miniProject\\WebContent\\upload";//시스템 물리적인 경로 */
	String path = application.getRealPath("/upload");
	
	int size = 1024*1024*10;
		multi = new MultipartRequest(
		request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		String userId = multi.getParameter("userId");
		Enumeration files = multi.getFileNames();
		String name = (String)files.nextElement();
		String file = multi.getFilesystemName(name);
		String orgFile = multi.getOriginalFileName(name);
		
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		Connection conn = ds.getConnection();

		PreparedStatement pstmt = conn.prepareStatement("update miniuser set img=? where userId=?");	
		pstmt.setString(1, orgFile);
		pstmt.setString(2, userId);

		
		pstmt.execute();
		
		pstmt.close();
		conn.close();
		response.sendRedirect("proFile.jsp");
		%>

 

</body>
</html>