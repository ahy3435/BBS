<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="mini.MiniUser"%>
<%@ page import="diary.*"%>
<%@ page import="gallery.*"%>
<%@page import="java.util.*,java.io.*,  javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>MiniWorld</title>
<link rel="stylesheet" href="./css/1_font_style.css" />
<link rel="stylesheet" href="./css/2_layout_style.css" />
<link rel="stylesheet" href="./css/3_design_style.css" />
<script src="https://kit.fontawesome.com/66ae39e275.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>

	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />

	<%
	String userId = (String) session.getAttribute("userId");

	String sql = null;
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	sql = "select * from miniuser where userId=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	%>
	<header>
		<jsp:include page="header.jsp" />
		<!-- 부트스트랩 참조 영역 -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
	</header>
<body class="grid_background">
	<div class="bookcover">
		<div class="bookdot">
			<div class="page TOP_CONTAINER">
				<div class="Left_container">
					<div class="L_VISIT_box">
						<div class="text_box_in_VISIT visit-URL_font_style">
							<span>proFIie </span>
						</div>
					</div>
					<div class="L_PROFILE_box box_white">

						<div class="image_box_in_PF">
							<img src="upload/<%=rs.getString(6)%>" width="100%"
								alt="사진을 넣어주세요" />
						</div>
						<div class="text_box_in_PF">

							<div class="text_align_center">
								<span> <%
 if (rs.getString(7) == null) {
 %>자기 소개를 입력해 주세요<%
 } else {
 %><%=rs.getString(7)%> <%
 }
 %>
								</span>
							</div>

						</div>
						<div class="my_imfo_in_PF">
							<div class="text_in_my_imfo"><%=rs.getString(3)%></div>
							<div class="dropdown_box_in_my_imfo">
								<div class="dropdown_button_in_dd_box">
									<div class="text_in_dd_button">이동</div>
									<div class="reverse_triangle_in_dd_button"></div>
								</div>
								<div class="contents_in_dd_box">
									<a href="https://twitter.com/" target="_blank">트위터 바로가기</a> <a href="https://section.blog.naver.com/"
										target="_blank">블로그 바로가기</a> <a href="https://www.instagram.com/" target="_blank">인스타그램
										바로가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="Center_container">
					<div class="C_TOP_box">
						<div class="Title_box_in_TOP">
							<span>Mini</span>
						</div>
						<div class="URL_box_in_TOP visit-URL_font_style">
							<a
								href="https://julia8024.github.io/2021-Sehee-mini-hompage/home.html"><i
								class="fas fa-home"></i></a>
						</div>
					</div>
					<div class="C_MAIN_box box_white z_index_20">
						<div class="updated_box_in_MAIN">
							<div class="title_in_box">Gallery</div>
							<%
							rs.close();
							pstmt.close();
							pstmt = conn.prepareStatement(
									"select galleryimagename from	(select * from gallery order by galleryid desc ) where rownum =1 and userid=?");
							pstmt.setString(1, userId);
							rs = pstmt.executeQuery();
							ArrayList<Gallery> gall = new ArrayList<Gallery>();
							while (rs.next()) {
								gall.add(new Gallery(rs.getString(1)));
							}
							rs.close();
							pstmt.close();
							%>

					<div style="width: 540px; margin: 5px;">
					<c:set var="gall" value="<%=gall%>" />
								<c:forEach var="gall" items="${gall}">
					<img src="./upload/${gall.galleryImagename}" style="width: 540px; height:200px; margin: 5px;"/>
					</c:forEach>
					</div>

						</div>




						<%
						sql = "select diaryno, diarydate, diarytitle from (select userid, diaryno, diarydate, diarytitle from diary order by diaryno desc ) where rownum <=4 and userid =?";
					
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userId);
						rs = pstmt.executeQuery();
						ArrayList<Diary> diary = new ArrayList<Diary>();
						while (rs.next()) {
							diary.add(new Diary(rs.getInt(1), rs.getString(2), rs.getString(3)));
						}
						%>
						<div class="miniroom_box_in_MAIN">
							<div class="title_in_box">Diary</div>
							<div class="contents_in_miniroom">
							<br>
								<c:set var="diary" value="<%=diary%>" />
								<c:forEach var="diary" items="${diary}">
									<li><a
										href="/BBS/diary/view.jsp?diaryNo=${diary.diaryNo }">${diary.diaryDate }제목:${diary.diaryTitle}</a></li>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="Right_container z_index_10">
					<div class="R_blank_space_box"></div>
					<div class="R_menu_box">
						<a href="/BBS/main.jsp" class="button_in_menu">홈</a> <a
							href="diary/list.jsp" class="button_in_menu">다이어리</a> <a
							href="gallery/galleryList.jsp" class="button_in_menu">사진첩</a> <a
							href="member/proFile.jsp" class="button_in_menu">개인 정보</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	rs.close();
	pstmt.close();
	conn.close();
	%>
</body>
</html>


