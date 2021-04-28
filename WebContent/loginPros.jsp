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
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
%>

<%String userId = request.getParameter("userID");
String userPwd = request.getParameter("userPassword");

InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
String sql = "select userid, userpwd from miniuser";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

while(rs.next()){
	if(userId.equals(rs.getString(1))&&userPwd.equals(rs.getString(2))){
		session.setAttribute("memberId",userId);	
		session.setAttribute("memberPwd",userPwd);
		response.sendRedirect("mainex01.jsp");
		break;
	}else if(userId.equals(rs.getString(1))&&!userPwd.equals(rs.getString(2))){
		%><script>
		alert("비밀번호가 틀립니다");
		history.back();
	</script>
	<%
		break;
	}else if(!userId.equals(rs.getString(1))){
		%><script>
		alert("아이디가 존재하지 않습니다");
		history.back();
	</script>
	<%
	}	
	
}	
pstmt.close(); rs.close(); conn.close();


%>

</body>
</html>