<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="diary.DiaryDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="diary" class="diary.Diary" scope="page" />
<jsp:setProperty name="diary" property="diaryTitle" />
<jsp:setProperty name="diary" property="diaryContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>

	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 해주세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} else {
		if (diary.getDiaryTitle() == null || diary.getDiaryTitle() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			DiaryDAO diaryDAO = new DiaryDAO();
			int result = diaryDAO.write(diary.getDiaryTitle(), userID, diary.getDiaryContent());
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 등록에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='list.jsp'");
		script.println("</script>");

			}

		}
	}
	%>


</body>
</html>