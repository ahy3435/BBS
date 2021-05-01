<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		  <%@ page import="java.sql.*"%>
<%@ page import="mini.MiniUser"%>
<%@page import="java.util.*,java.io.*,  javax.sql.*, javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="./css/test.css" />
<link rel="stylesheet" href="./css/1_font_style.css" />
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
	
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
	<div class="col-lg-4"></div>



	<form action="proFileAction.jsp" style="width: 900px;">
		<h3 class="font1" style="text-align: center; margin-top: 10px;">Profile</h3>

		<img  name="img" style="position: static;" src="images/background1.jpg"> 
		
		
		<a	style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 107.5px; left: 37px; font-size: 17px;">ID</a>
		<div class="form-group" style="display: inline-block; position: relative; bottom: 107.5px; left: 70px; width: 200px;">
			<input type="text" class="form-control" value="<%=rs.getString(1) %>" name="userId" readonly="readonly">
		</div>

		<a style="position: relative; font-family: 'Wemakeprice-Bold'; bottom: 107.5px; left: 107px; font-size: 17px;">GENDER</a>
        <div class="form-group" style="display: inline-block; position: relative; bottom: 107.5px; left: 139px; width: 200px;">
		<input type="text" class="form-control"value="<%=rs.getString(5) %>" name="gender" maxlength="20">
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
		
		<input style="position: relative; top: 38px;" type="submit" class="btn-primary1 form-control" value="수정하기">



	</form>
</body>
</html>