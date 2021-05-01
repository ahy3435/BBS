<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="mini.MiniUser"%>
<%@page import="java.util.*,java.io.*,  javax.sql.*, javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>ㅇㅇㅇ의 미니홈피</title>
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
	<%request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="user" class="mini.MiniUser" />
	<jsp:setProperty property="*" name="user" />
	
		<%
		String userId = (String)session.getAttribute("userId");
		
String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
sql = "select * from miniuser where userId=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,userId);
ResultSet rs = pstmt.executeQuery();
rs.next();
%>
<header>
	<jsp:include page="header.jsp"/>
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
							<span>TODAY <span class="color_red">28</span> | TOTAL
								234918
							</span>
						</div>
					</div>
					<div class="L_PROFILE_box box_white">
						<div class="image_box_in_PF">
							<img src="images/dog.jpg" width="100%" />
						</div>
						<div class="text_box_in_PF">

							<div class="text_align_center" >
								<span><%if(rs.getString(7)==null){%>자기 소개를 입력해 주세요<%}
								else {%><%=rs.getString(7)%><% } %></span>
							</div>

						</div>
						<div class="my_imfo_in_PF">
							<div class="text_in_my_imfo"><%=rs.getString(3) %></div>
							<div class="dropdown_box_in_my_imfo">
								<div class="dropdown_button_in_dd_box">
									<div class="text_in_dd_button">이동</div>
									<div class="reverse_triangle_in_dd_button"></div>
								</div>
								<div class="contents_in_dd_box">
									<a href="#" target="_blank">트위터 바로가기</a> <a href="#"
										target="_blank">블로그 바로가기</a>
										<a href="#" target="_blank">인스타그램 바로가기</a>
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
							<div class="contents_in_updated">
								<div class="board_in_contents">
									<div style="width: 540px; margin: 5px;">
										<!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->
										<!-- carousel는 특이하게 id를 설정해야 한다.-->
										<div id="carousel-example-generic" class="carousel slide">
											<!-- carousel의 지시자 -->
											<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
											<ol class="carousel-indicators">
												<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
												<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
												<!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
												<li data-target="#carousel-example-generic"
													data-slide-to="0" class="active"></li>
												<li data-target="#carousel-example-generic"
													data-slide-to="1"></li>
											</ol>
											<!-- 실제 이미지 아이템 -->
											<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
											<div class="carousel-inner" role="listbox"
												style="width: 100%; height: 200px !important;">
												<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
												<div class="item active">
													<!-- 아미지 설정- -->
													<img src="images/cherryblossom.jpg" style="width: 100%">
													<!-- 캡션 설정 (생략 가능) -->
													<!-- 글자 색은 검은색 -->
													<div class="carousel-caption" style="color: white;">
													</div>
												</div>
												<div class="item">
													<img src="images/moon.jpg" style="width: 100%"> 아쟈아쟈
													<div class="carousel-caption" style="color: black;">
													</div>
												</div>
											</div>
											<!-- 왼쪽 화살표 버튼 -->
											<!-- href는 carousel의 id를 가르킨다. -->
											<a class="left carousel-control" opacity
												href="#carousel-example-generic" role="button"
												data-slide="prev"> <!-- 왼쪽 화살표 --> <span
												class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
											</a>
											<!-- 오른쪽 화살표 버튼 -->
											<!-- href는 carousel의 id를 가르킨다. -->
											<a class="right carousel-control"
												href="#carousel-example-generic" role="button"
												data-slide="next"> <!-- 오른쪽 화살표 --> <span
												class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
											</a>
										</div>
									</div>
									<script>
										$(function() {
											// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
											$('#carousel-example-generic')
													.carousel({
														// 슬리아딩 자동 순환 지연 시간
														// false면 자동 순환하지 않는다.
														interval : 3000,
														// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
														pause : "hover",
														// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
														wrap : true,
														// 키보드 이벤트 설정 여부(?)
														keyboard : true
													});
										});
									</script>
								</div>
							</div>
						</div>

						<div class="miniroom_box_in_MAIN">
							<div class="title_in_box">Diary</div>
							<div class="contents_in_miniroom">
							<li><a href="list.jsp">2021-04-11</a></li>
							<li>2021-04-13</li>
							<li>2021-04-15</li>
							<li>2021-04-17</li>
							</div>
						</div>
					</div>
				</div>
				<div class="Right_container z_index_10">
					<div class="R_blank_space_box"></div>
					<div class="R_menu_box">
						<a href="/main.jsp" class="button_in_menu">홈</a> <a
							href="diary/list.jsp" class="button_in_menu">다이어리</a> <a
							href="gallery/gallery.jsp" class="button_in_menu">사진첩</a>
							<a href="member/proFile.jsp" class="button_in_menu">개인 정보</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%rs.close(); pstmt.close();  conn.close(); %>
</body>
</html>