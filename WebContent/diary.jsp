<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>ㅇㅇㅇ의 미니홈피</title>
<link rel="stylesheet" href="./css/1_font_style.css"/>
    <link rel="stylesheet" href="./css/2_layout_style.css"/>
    <link rel="stylesheet" href="./css/3_design_style.css"/>
    <script src="https://kit.fontawesome.com/66ae39e275.js" crossorigin="anonymous"></script>
</head>
<body>
<header>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId= (String)session.getAttribute("userId");
		}
	%>
	<nav class="navbar navbar-default"> <!-- 네비게이션 -->
		<div class="navbar-header"> 	<!-- 네비게이션 상단 부분 -->
			<!-- 네비게이션 상단 박스 영역 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!-- 이 삼줄 버튼은 화면이 좁아지면 우측에 나타난다 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- 상단 바에 제목이 나타나고 클릭하면 main 페이지로 이동한다 -->
			<a class="navbar-brand" href="main.jsp">ㅇㅇㅇ의 미니홈피</a>
		</div>
		<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				// 로그인 하지 않았을 때 보여지는 화면
				if(userId == null){
			%>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역 -->	
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				// 로그인이 되어 있는 상태에서 보여주는 화면
				}else{
			%>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역 -->	
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
    	</div>
    </nav>       
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
                            <span>TODAY <span class="color_red">28</span> | TOTAL 234918</span>
                        </div>
                    </div>
                    <div class="L_PROFILE_box box_white">
                        <div class="image_box_in_PF">
                            <img src="./static/images/image_profile.jpg" width="100%"/>
                        </div>
                        <div class="text_box_in_PF">
                            <span>난 싸이월드 시절도 이 정도 감성충은 아녔어<br></span>
                            <div class="text_align_center"><br>𝅘𝅥𝅮 ONE-MAN SHOW ♬<br>지코</div>
                            <span><br>노래 가사랍니다. 저는 싸이월드를 해본 적이 없어요...(´。＿ 。｀)</span>
                        </div>
                        <div class="my_imfo_in_PF">
                            <div class="text_in_my_imfo">사람 (♀)</div>
                            <div class="dropdown_box_in_my_imfo">
                                <div class="dropdown_button_in_dd_box">
                                    <div class="text_in_dd_button">파도타기</div>
                                    <div class="reverse_triangle_in_dd_button"></div>
                                </div>
                                <div class="contents_in_dd_box">
                                    <a href="#" target="_blank">코뮤니티 바로가기</a>
                                    <a href="#" target="_blank">내 블로그 바로가기</a>
                                    <a href="#" target="_blank">인스타그램 바로가기</a>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
                <div class="Center_container">
                    <div class="C_TOP_box">
                        <div class="Title_box_in_TOP">
                            <span>세희으i 추억ฺ 상ㅈr...♥ ʕっ•ﻌ•ʔっ ♡L</span>
                        </div>
                        <div class="URL_box_in_TOP visit-URL_font_style">
                            <a href="https://julia8024.github.io/2021-Sehee-mini-hompage/home.html"><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                    <div class="C_MAIN_box box_white z_index_20">
                        <div class="updated_box_in_MAIN">
                           
                            <div class="contents_in_updated">
                              
                         
                                <div class="board_in_contents">
                                      <p>내용 들어가는지 테스트</p>
                                      
                                      
                                      
                                      
                                    <div class="board_list_right">
                                        <div class="board_div_2">
                                        </div>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="miniroom_box_in_MAIN">
                            
                        </div>
                    </div>
                </div>
                <div class="Right_container z_index_10">
                    <div class="R_blank_space_box"></div>
                    <div class="R_menu_box">
                        <a href="./mainex01.jsp" class="button_in_menu">홈</a>
                        <a href="./diary.jsp" class="button_in_menu">다이어리</a>
                        <a href="./gallery.jsp" class="button_in_menu">사진첩</a>
                        <a href="./visitors.html" class="button_in_menu">방명록</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>