<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
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
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
	<jsp:include page="../header.jsp" />
	<%
	String userId = null;
	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	%>



	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">


				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
		
							<th colspan="2"
								style="background-color: #e1e6ff; text-align: center; font-size: 15px; font-family: 'Wemakeprice-Bold';">Diary</th>

						</tr>
					</thead>
					<tbody>
						<tr>
					
							<td><input type="text" class="form-control"
								placeholder="제목을 입력하세요" name="diaryTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea col="50" rows="15" type="text"
									class="form-control" placeholder="내용을 입력하세요"
									name="diaryContent" maxlength="2048" "height=350px;"></textarea></td>
			
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-success pull-right" value="등록">
			</form>
		</div>
	</div>








	<script src="https://code.jquery.com/../jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>