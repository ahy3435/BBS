<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="diary.DiaryDAO"%>
<%@ page import="diary.Diary"%>
<%@ page import="java.util.ArrayList"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/design.css" />
<link rel="stylesheet" href="../css/1_font_style.css" />
<title>ㅇㅇㅇ의 미니홈피</title>
</head>

	<jsp:include page="../header.jsp"/>
	<h3 class="font1"
			style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
			<br>Diary</h3>		
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<% request.setCharacterEncoding("UTF-8"); %>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
<%
	
		String userId = null;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
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
		}
	%>

	

	
	<div class="container">
		<div class="row">
			<form method="post" action="diaryUpdateAction.jsp?diaryNo=<%=diaryNo%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align:center;">글수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="diaryTitle" maxlength="50"
								value="<%=diary.getDiaryTitle()%>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="diaryContent" maxlength="2048" style="height: 350px;"><%=diary.getDiaryContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-primary pull-right">글
					수정</button>
			</form>
		</div>
	</div>


<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/../jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>