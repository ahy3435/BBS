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
	<jsp:include page="../header.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/design.css" />
<link rel="stylesheet" href="../css/1_font_style.css" />
<title>ㅇㅇㅇ의 미니홈피</title>
</head>


	
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>





	<%
		String userId = null;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		int diaryNo = 0;
		if (request.getParameter("diaryNo") != null) {
			diaryNo = Integer.parseInt(request.getParameter("diaryNo"));
		}
		if (diaryNo == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'write.jsp'");
			script.println("</script>");
		}
		Diary diary = new DiaryDAO().getDiary(diaryNo);
	%>

<h3 class="font1"
			style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
			<br>Diary</h3>		
	<div class="container">
		<div class="row">
			<table class="table table-strped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">나의 기록</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%; background-color: #eeeeee;">글 제목</td>
						<td colspan="2"><%=diary.getDiaryTitle()%></td>
					</tr>
					<tr>
						<td style="width: 20%; background-color: #eeeeee;">작성자</td>
						<td colspan="2"><%=diary.getUserId()%></td>
					</tr>
					<tr>
						<td style="width: 20%; background-color: #eeeeee;">작성일</td>
						<td colspan="2"><%=diary.getDiaryDate()%></td>
					</tr>
					<tr>
						<td style="width: 20%; background-color: #eeeeee;">내용</td>
						<td colspan="2" style="min-height: 200px; text-align: center;"><%=diary.getDiaryContent()%></td>
					</tr>

				</tbody>
			</table>
			<a href="list.jsp" class="btn btn-primary">목록</a>
			<%
				if (userId != null && userId.equals(diary.getUserId())) {
			%>
			<a href="diaryUpdate.jsp?diaryNo=<%=diaryNo%>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="diaryDeleteAction.jsp?diaryNo=<%= diaryNo %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>
	</div>
	<script src="https://code.jquery.com/../jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>