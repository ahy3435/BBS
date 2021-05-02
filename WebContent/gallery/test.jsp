<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="gallery.GalleryDAO"%>
<%@ page import="gallery.Gallery"%>
<%@ page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
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
<% request.setCharacterEncoding("UTF-8"); %>


   
      <jsp:include page="../header.jsp" />
      <%String userId = (String)session.getAttribute("userId"); %>
      <!-- 부트스트랩 참조 영역 -->
  


   <div class="galleryDiv">
      <h3 class="font1"
         style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
         <br>Gallery
      </h3>
      
      <%
      InitialContext ic = new InitialContext();
      DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
      Connection conn = ds.getConnection();

	PreparedStatement pstmt = conn.prepareStatement("select gallerytitle, gallerycontent,galleryImagename from gallery where userid=?");
	pstmt.setString(1, userId);
	ResultSet rs = pstmt.executeQuery();	
	ArrayList<Gallery> gall = new ArrayList<Gallery>();
	while (rs.next()) {
		gall.add(new Gallery(rs.getString(1), rs.getString(2), rs.getString(3)));
	}
	rs.close();
	pstmt.close();
	conn.close();

	%>
	<c:set var="gall" value="<%=gall%>" />
								<c:forEach var="gall" items="${gall}">
         <div class="cardList">
            <div class="card" >
       
               <img class="card-img-top myImg" src="../upload/${gall.galleryImagename}"
                  alt="Card image cap"/>
               <div class="card-body">
                  <h5 class="card-title">${gall.galleryTitle }</h5>
                  <p class="card-text">${gall.galleryContent }</p>
                  <a href="#" class="btn btn-primary">Go somewhere</a>
               </div>
            </div>
         </div>
      </c:forEach>
      <button onclick="location.href='galleryWrite.jsp'">사진 올리기</button>
   </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="js/bootstrap.js"></script>

</body>
</html>