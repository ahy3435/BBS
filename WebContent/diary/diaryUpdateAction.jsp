<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="diary.DiaryDAO"%>
<%@ page import="diary.Diary"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../header.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="./css/design.css" />
<link rel="stylesheet" href="./css/1_font_style.css" />
<title>ㅇㅇㅇ의 미니홈피</title>
</head>


	<h3 class="font1"
			style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
			<br>Diary</h3>		
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
		String userId = null;
		if (session.getAttribute("userId") != null) {//유저아이디 이름으로 세션이 존재하는 회원들은
			userId = (String) session.getAttribute("userId");//유저아이디에 해당 세션값을 넣어준다

		}
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}

		//글이 유효한지 판별
		int diaryNo = 0;
		if (request.getParameter("diaryNo") != null) {
			diaryNo = Integer.parseInt(request.getParameter("diaryNo"));
		}
		if (diaryNo == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'list.jsp'");
			script.println("</script>");
		}
		Diary diary = new DiaryDAO().getDiary(diaryNo);
		if (!userId.equals(diary.getUserId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'list.jsp'");
			script.println("</script>");
		} else {
			if (request.getParameter("diaryTitle") == null || request.getParameter("diaryContent") == null
					|| request.getParameter("diaryTitle").equals("")
					|| request.getParameter("diaryContent").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DiaryDAO DiaryDAO = new DiaryDAO();
				int result = DiaryDAO.update(diaryNo, request.getParameter("diaryTitle"),
						request.getParameter("diaryContent"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='list.jsp'");
					//script.println("history.back()");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>