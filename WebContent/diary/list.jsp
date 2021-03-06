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
	<jsp:include page="../header.jsp" />
	<h3 class="font1"
			style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
			<br>Diary</h3>		
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>


<% request.setCharacterEncoding("UTF-8"); %>
	<%
	
		String userId = null;
	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	int pageNumber = 1;


	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>


	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #e1e6ff; text-align: center; font-size:15px; font-family: 'Wemakeprice-Bold';">번호</th>
						<th style="background-color: #e1e6ff; text-align: center; font-size:15px; font-family: 'Wemakeprice-Bold';">제목</th>
						<th style="background-color: #e1e6ff; text-align: center; font-size:15px; font-family: 'Wemakeprice-Bold';">작성자</th>
						<th style="background-color: #e1e6ff; text-align: center; font-size:15px; font-family: 'Wemakeprice-Bold';">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
						DiaryDAO diaryDAO = new DiaryDAO();
						
						ArrayList<Diary> list = diaryDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getDiaryNo()%></td>
						<td><a href="view.jsp?diaryNo=<%=list.get(i).getDiaryNo()%>">
						<%=list.get(i).getDiaryTitle()%></a></td>
						<td><%=list.get(i).getUserId()%></td>
						<td><%=list.get(i).getDiaryDate() %></td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>
			<a href="list.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arrow-left">이전</a>
			<%
				}
				if (diaryDAO.nextPage(pageNumber)) {
			%>
			<a href="list.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>
			<%
				if (session.getAttribute("userId") != null) {
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">작성</a>
			<%
				} else {
			%>
			<a href="#" class="btn btn-primary pull-right" onclick="if(confirm('로그인 하세요'))location.href='login.jsp';">작성</a>

			<%
				}
			%>

		</div>
	</div>




	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/../jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>