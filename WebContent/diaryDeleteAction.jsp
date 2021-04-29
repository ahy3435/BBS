<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="diary.DiaryDAO"%>
<%@ page import="diary.Diary"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="./css/design.css" />
<link rel="stylesheet" href="./css/1_font_style.css" />
<title>ㅇㅇㅇ의 미니홈피</title>
</head>

	<jsp:include page="header.jsp"/>
	<h3 class="font1"
			style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
			<br>Diary</h3>	
<body>
 <%
        String userID = null;
        if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
            userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
        }
        if (userID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } 
        int diaryNo = 0;
        if(request.getParameter("diaryNo") != null){
            diaryNo = Integer.parseInt(request.getParameter("diaryNo"));
        }
        if(diaryNo == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글 입니다')");
            script.println("location.href='list.jsp'");
            script.println("</script>");
        }
       Diary diary = new DiaryDAO().getDiary(diaryNo);
        if(!userID.equals(diary.getUserID())) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다')");
            script.println("location.href='list.jsp'");
            script.println("</script>");            
        }
        else{
            DiaryDAO diaryDAO = new DiaryDAO();
            int result = diaryDAO.delete(diaryNo);
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 삭제에 실패했습니다')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href='list.jsp'");
                script.println("</script>");
            }
        }
    %>
</body>
</html>