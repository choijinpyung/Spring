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
<style type="text/css">
img{
	width: 40vh;
}

.logoutformbox{
	width: 100%;
	height: 62vh;
	display: flex;
	justify-content: center;
    align-items: center;
    flex-direction: column;
}	
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<div align="center" class="logoutformbox">
	<img alt="" src="${root }/image/smile.gif">
	<br>
	<b>${name }님 환영합니다!</b>
</div>
</body>
</html>