<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div style="margin-left: 600px; margin-top: 200px;">
	
	<button type="button" class="btn btn-outline-info" style="width: 200px;"
	onclick="location.href='naver/form1'">각각 읽기</button>
	
	<br>
	
	<button type="button" class="btn btn-outline-warning" style="width: 200px;"
	onclick="location.href='naver/form2'">Dto 읽기</button>
	
	<br>
	
	<button type="button" class="btn btn-outline-danger" style="width: 200px;"
	onclick="location.href='naver/form3'">Map 읽기</button>
	
	<br>
	
	<button type="button" class="btn btn-outline-dark" style="width: 200px;"
	onclick="location.href='naver/form4'">이미지 업로드</button>
	
	<br>
	
	<button type="button" class="btn btn-outline-dark" style="width: 200px;"
	onclick="location.href='naver/uploadform5'">이미지 업로드_여러개</button>
	
	<br>
	
	<button type="button" style="width: 200px;"
	onclick="location.href='naver/test'">연습 버튼</button>
	
	</div>
</body>
</html>