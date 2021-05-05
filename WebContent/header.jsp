<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,
 javax.sql.*,
  javax.naming.*,
  java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mini.*"%>


<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="./css/design.css" />
<link rel="stylesheet" href="./css/1_font_style.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />
<%
		String userId = (String)session.getAttribute("userId");
String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
sql = "select * from miniuser where userId=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,userId);
ResultSet rs = pstmt.executeQuery();
rs.next();
%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
<%if(userId!=null){ %>
			<a class="navbar-brand"><%=rs.getString(3) %>의 미니홈피</a>

		</div>
		<%-- 		<% if(userID != null){ %> --%>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/BBS/main.jsp">메인</a></li>
				<li><a href="${contextPath}/diary/list.jsp">일기장</a></li>
				<li><a href="${contextPath}/gallery/galleryList.jsp">사진첩</a></li>
				<li><a href="${contextPath}/member/proFile.jsp">프로필</a></li>
				<li><a href="${contextPath}/member/logoutAction.jsp">로그 아웃</a></li>
			</ul>
		</div>
		<%}
		else if(userId==null){
		%><a class="navbar-brand">로그인 후 이용가능합니다</a>

		</div>
		<%-- 		<% if(userID != null){ %> --%>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
		</div>
		<%} rs.close(); pstmt.close(); conn.close();%>
		<%-- 	<%} else out.print("<script>alert('비밀번호 불일치');	history.back();	</script>");  %> --%>
	</nav>
</body>
</html>