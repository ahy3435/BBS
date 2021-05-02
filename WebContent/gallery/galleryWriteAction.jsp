<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="gallery.GalleryDAO"%>
<%@ page import="java.io.PrintWriter"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="gallery" class="gallery.Gallery" scope="page" />
<jsp:setProperty name="gallery" property="galleryTitle" />
<jsp:setProperty name="gallery" property="galleryContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>

	<%
	String userId = null;
	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
		
	}
	
	String title=request.getParameter("GalleryTitle");
	String content=request.getParameter("GalleryContent");
	if (userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 해주세요.')");
		script.println("location.href='/BBS/member/login.jsp'");
		script.println("</script>");
	} else {
		if (title == null || content == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			GalleryDAO galleryDAO = new GalleryDAO();
			int result = galleryDAO.gallerywrite(userId, gallery.getGalleryTitle(), gallery.getGalleryContent(), gallery.getGalleryImagename());
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 등록에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='galleryList.jsp'");
		script.println("</script>");

			}

		}
	}
	%>


</body>
</html>