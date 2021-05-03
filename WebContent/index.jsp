<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MiniWorld</title>
</head>
<body>
<script>
location.href='login.jsp'; 
/*location.href:객체의 속성으로 페이지를 이동하는 것
 --> 뒤로가기 버튼을 누른 경우 이전 페이지로 이동이 가능*/
</script>


<form action="galleryUploadAction.jsp" method="post" enctype="multipart/form-data">

		파일 : <input type="file" name="file"><br>

		<input type="submit" value="업로드"><br>

	</form>
</body>
</html>