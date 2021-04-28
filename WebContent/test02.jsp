<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*,java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.oreilly.servlet.*"%>

<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="./css/design.css" />
<link rel="stylesheet" href="./css/1_font_style.css" />
<link rel="stylesheet" href="./css/test.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
.cards {
	background: #f6f0fa;
	/* border: 1px solid #ffffff; */
	padding: 10px;
	margin: 0 auto;
	overflow: hidden; /* float �Ӽ��ν� */
}

.card {
	height: 400px;
	width: 350px;
	border-radius: 15px;
	display: inline;
	margin-top: 30px;
	margin-left: 30px;
	margin-bottom: 30px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow: hidden;
	float: left;
}

.card-header {
	width: 100%;
	height: 270px;
}

.card:hover .card-header {
	opacity: 0.8;
	height: 100px;
}

.card-header-text {
	background-color: #fa2414;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	margin: 15px 15px 15px 15px;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px 10px 10px;
	line-height: 30px;
}

.card-body-header {
	margin: 10px 20px 0px 20px;
}

.card-body-hashtag {
	color: #2478ff;
}

.btn btn-outline-danger {
	margin: 0 auto;
}
</style>

</head>
<body>
	<div class="card">
		<!-- �� ī�� ��� -->
		<div class="card-header">
			<div class="card-header-text">HOT</div>
		</div>
		<!--  ī�� �ٵ� ��� -->
		<div class="card-body-header">
			<img src="">
			<h1>�Ͻö� �ڵ�ũ��</h1>
			<p class="card-body-hashtag">#�ܿ� #�⺻�� #����Ŀ</p>
			<p>���� ���� ���� �⺻ ������! �ڵ�ũ���̶�� ��� ���� �ڵ�ũ���̾ƴϴ�. '�Ͻö�' �̸� �ϳ��� �ִ� ���
				ü�鵵 �츮�� �޴� ����� ���������� ������ �ڵ�ũ��</p>
			<button type="button" class="btn btn-outline-danger">�ڼ��� ����</button>
		</div>
	</div>
</body>
</html>