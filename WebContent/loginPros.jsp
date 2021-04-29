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

	<%request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />

<%InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
String sql = "select userid, userpwd from miniuser where userid=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, user.getUserId());
ResultSet rs = pstmt.executeQuery();


while(rs.next()){
	if((user.getUserId()).equals(rs.getString(1))&&(user.getUserPwd()).equals(rs.getString(2))){
		session.setAttribute("memberId",user.getUserId());	
		session.setAttribute("memberPwd",user.getUserPwd());
		response.sendRedirect("mainex01.jsp");
		break;
	}else if(!(user.getUserId()).equals(rs.getString(1))){
		%><script>
			alert("아이디가 존재하지 않습니다");
			history.back();
		</script>
		<%
		break;
	}else if((user.getUserId()).equals(rs.getString(1))&&!(user.getUserPwd()).equals(rs.getString(2))){
		%><script>
			alert("비밀번호가 틀립니다");
			history.back();
		</script>
		<%
		break;
	}	
	
}	
rs.close(); pstmt.close();  conn.close();


%>

</body>
</html>