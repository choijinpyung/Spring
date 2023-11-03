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
<form action="result" method="post">
<table class="table table-bordered" style="width: 360px;">
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" width="150px;"></td>
	</tr>
	
	
	<tr>
		<th>좋아하는색깔</th>
		<td><input type="color" name="color"></td>
	</tr>
	
	<tr>
		<th>취미</th>
		<td>
		<input type="checkbox" name="hobby" value="게임"> 게임
		<input type="checkbox" name="hobby" value="운동"> 운동
		<input type="checkbox" name="hobby" value="공부"> 공부
		<input type="checkbox" name="hobby" value="독서"> 독서
		<input type="checkbox" name="hobby" value="산책"> 산책
		</td>
	</tr>
	
	<tr>
		<th>좋아하는언어</th>
		<td>
		<select name="lang">
		<option value="java">java</option>
		<option value="html">html</option>
		<option value="oracle">oracle</option>
		<option value="spring">spring</option>
		</select>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="서버로 전송">
		</td>
	</tr>
</table>
</form>
</body>
</html>