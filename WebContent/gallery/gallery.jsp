<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="gallery.Gallery"%>
<%@ page import="gallery.GalleryDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>ㅇㅇㅇ의 미니홈피</title>
<link rel="stylesheet" href="../css/1_font_style.css" />
<link rel="stylesheet" href="../css/2_layout_style.css" />
<link rel="stylesheet" href="../css/3_design_style.css" />
<link rel="stylesheet" href="../css/test.css" />
<script src="https://kit.fontawesome.com/66ae39e275.js"
	crossorigin="anonymous"></script>

<style>
.galleryDiv {
	width: 900px;
	min-height: 500px;
	height: auto;
	border-radius: 5px;
	margin: 0 auto;
	box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31);
	/*     padding: 1.1%; */
	background-image: linear-gradient(-225deg, #E3FDF5 50%, #FFE6FA 50%);
	top: 50%;
	left: 50%;
}

.galleryDiv div {
	text-align: center;
}

.cardList {
	margin-top: 30px !important;
}

.myImg {
	height: auto;
}
</style>
</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
	<header>
		<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		//로그인 안한경우
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요.')");
			script.println("location.href = '../member/login.jsp'");
			script.println("</script>");
		}
		
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}

		GalleryDAO galleryDAO = new GalleryDAO();
		ArrayList<Gallery> galleryList = galleryDAO.getList(userID, pageNumber);
		
		%>
		<jsp:include page="../header.jsp" />
		<!-- 부트스트랩 참조 영역 -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
	</header>

	<div class="galleryDiv">
		<h3 class="font1"
			style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
			<br>Gallery
		</h3>

		<%
			for(Gallery gallery: galleryList) {			
		%>
			<div class="cardList">
				<div class="card">
					<img class="card-img-top myImg" src="<%=request.getContextPath()%>/images/<%=gallery.getGalleryImagename()%>>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=gallery.getGalleryTitle()%></h5>
						<p class="card-text"><%=gallery.getGalleryContent()%></p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
		
		<%
		
			}
		%>





	</div>


</body>
</html>