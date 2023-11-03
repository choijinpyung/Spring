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
<style type="text/css">
div{
	position: absolute;
	top: 400px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<img alt="" src="../res/ddong.png" align="left">
	
	<div class="alert alert-warning">
	
	로그인한 아이디: ${id }<br>
	<b>${msg }</b>
	</div>
</body>
</html>