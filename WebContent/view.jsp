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
	<jsp:include page="header.jsp"/>
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





	<%
		//로긴한 사람이라면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
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

			<%
				//로긴 안 된경우
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				//로그인 된경우
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<!-- 게시판 -->
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
						<td colspan="2"><%=diary.getUserID()%></td>
					</tr>
					<tr>
						<td style="width: 20%; background-color: #eeeeee;">작성일</td>
						<td colspan="2"><%=diary.getDiaryDate()%></td>
					</tr>
					<tr>
						<td style="width: 20%; background-color: #eeeeee;">내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=diary.getDiaryContent()%></td>
					</tr>

				</tbody>
			</table>
			<a href="list.jsp" class="btn btn-primary">목록</a>
			<%
				//글작성자 본인일시 수정 삭제 가능
				if (userID != null && userID.equals(diary.getUserID())) {
			%>
			<a href="diaryUpdate.jsp?diaryNo=<%=diaryNo%>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="diaryDeleteAction.jsp?diaryNo=<%= diaryNo %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>
	</div>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>