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
<title>MiniWorld</title>
<!-- <link rel="stylesheet" href="../css/bootstrap.css"> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous"> -->
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/test.css" />
<link rel="stylesheet" href="../css/1_font_style.css" />
</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<%request.setCharacterEncoding("utf-8"); 
	%>
	
	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />
	
		<%
String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
sql = "select * from miniuser where userId=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,(String)session.getAttribute("userId"));
ResultSet rs = pstmt.executeQuery();
rs.next();
%>
	<jsp:include page="../header.jsp" />
	
<!-- 	<div class="col-lg-4"></div> -->


	<form id="imageForm" action="proFileImageAction.jsp" enctype="multipart/form-data" method="post">
		<input type="hidden" name="userId" value="<%=rs.getString(1) %>">
		<input type="file" id="updateImage" name="updateImage" style="display: none;">
	</form>
	<form action="proFileAction.jsp" style="width: 900px;">
	
		<h3 class="font1" style="text-align: center; margin-top: 10px;">Profile</h3>
<!-- 			<div style="width: 300px;"> -->
				<img id="img" name="img" style="position: static;" src="../upload/<%=rs.getString(6) %>">
		<%-- 		<img  name="img" style="position: static;" src="../upload/<%=rs.getString(6) %>.jpg">  --%>
<!-- 				<input type="file" name="pImage" id="pImage" class="form-control"> -->
<!-- 			</div> -->
<!-- 			<div style="width: 600px;"> -->
				<a	style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 107.5px; left: 37px; font-size: 17px;">ID</a>
				<div class="form-group" style="display: inline-block; position: relative; bottom: 107.5px; left: 70px; width: 200px;">
					<input type="text" class="form-control" value="<%=rs.getString(1) %>" name="userId" readonly="readonly">
				</div>
		
				<a style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 107.5px; left: 107px; font-size: 17px;">GENDER</a>
		        <div class="form-group" style="display: inline-block; position: relative; bottom: 107.5px; left: 139px; width: 200px;">
				<input type="text" class="form-control"value="<%=rs.getString(5) %>" name="gender" maxlength="20"  readonly="readonly">
				</div>
		
				<a style="position: relative; font-family: 'Wemakeprice-Bold'; top: 20px; right: 475px; font-size: 17px;">PWD</a>
		        <div class="form-group" style="display: inline-block; position: relative; bottom: 125px; left: 292px; width: 200px;">
				<input type="text" class="form-control" value="<%=rs.getString(2) %>" name="userPwd" maxlength="20">
				</div>
		
				<a style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 125px; left: 338px; font-size: 17px;">NAME</a>
		        <div class="form-group" style="display: inline-block; position: relative; bottom: 125px; left: 381px; width: 200px;">
				<input type="text" class="form-control" value="<%=rs.getString(3) %>" name="userName" maxlength="20">
				</div>
		
				<a style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 31px; right: 125px; font-size: 17px;">EMAIL</a>
		        <div class="form-group" style="display: inline-block; position: relative; bottom: 33px; right: 95px; width: 300px;">
				<input type="text" class="form-control" value="<%=rs.getString(4) %>" name="email" maxlength="20">
				</div>
		
				<textarea style="width: 200px; height: 90px; bottom: 20px; position: relative;" name="info"></textarea>
<!-- 			</div> -->
		
		<input style="position: relative; top: 38px;" type="submit" class="btn-primary1 form-control" value="수정하기">


	</form>
	
	<script>
		$("#imageForm").hide();
	
		$("#img").click(function() {
			$("#updateImage").trigger("click");
		});
		
		$("#updateImage").change(function () {
			$("#imageForm").submit();
		});
	</script>
	<%conn.close(); pstmt.close(); rs.close(); %>
</body>
</html>