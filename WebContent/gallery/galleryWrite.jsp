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
<title>MiniWorld</title>
</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
	<jsp:include page="../header.jsp" />
	<%
	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
	String userId = null;
	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	%>

	<!-- 게시판 메인 페이지 영역 시작 -->

	<div class="container">
		<div class="row">
			<form method="post" action="galleryWriteAction.jsp" enctype="multipart/form-data">

				<!-- table-striped : 게시글 목록 홀수/짝수 번갈아 색상변경하여 보기 쉽게 해주는 요소 -->
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<!-- colspan :2개 열만큼 -->
							<th colspan="2"
								style="background-color: #e1e6ff; text-align: center; font-size: 15px; font-family: 'Wemakeprice-Bold';">사진첩</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<!-- 테스트 코드 -->
							<td><input type="text" class="form-control"
								placeholder="제목" name="GalleryTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea col="50" rows="11" type="text"
									class="form-control" placeholder="내용을 입력하세요"
									name="GalleryContent" maxlength="2048" "height=350px;"></textarea></td>
							<!-- textarea:장문의 글 작성 시 사용 -->
						</tr>
						<tr>
								<td> <input type="file" class="form-control"  name="diaryimages" size="40"> <br></td>
							</tr>
					</tbody>
				</table>
				<!-- 글쓰기 버튼 생성 - 버튼 오른쪽에 고정되도록 만들어줌-->
				<input type="submit" class="btn btn-success pull-right" value="등록">
			</form>
		</div>
	</div>


	<!-- 게시판 메인 페이지 영역 끝 -->




	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/../jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>