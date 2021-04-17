<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<jsp:include page="header.jsp"/>
	<!-- 게시판 메인 페이지 영역 시작 -->
	<div class="container">
		<div class="row">
			<!-- table-striped : 게시글 목록 홀수/짝수 번갈아 색상변경하여 보기 쉽게 해주는 요소 -->
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
					<tr>
						<!-- 테스트 코드 -->
						<td>1</td>
						<td>멍멍</td>
						<td>땅콩이</td>
						<td>2021-04-09</td>
					</tr>
					<tr>
						<td>2</td>
						<td>멍멍</td>
						<td>땅콩이</td>
						<td>2021-04-09</td>
					</tr>
					<tr>
						<td>3</td>
						<td>멍멍</td>
						<td>땅콩이</td>
						<td>2021-04-09</td>
					</tr>
				</tbody>
			</table>
			<!-- 글쓰기 버튼 생성 - 버튼 오른쪽에 고정되도록 만들어줌-->
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<!-- 게시판 메인 페이지 영역 끝 -->




	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>