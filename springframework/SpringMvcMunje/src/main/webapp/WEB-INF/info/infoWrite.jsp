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
<table>
<tr>
<h2>퀴즈 출력</h2>
이름 : ${infoDto.name }<br>
좋아하는색깔 : <b style="color: ${infoDto.color }"> ${infoDto.color }</b><br>
취미 : <c:if test="${empty infoDto.hobby }">없음</c:if>
<c:if test="${!empty infoDto.hobby }">${infoDto.hobby}</c:if><br>
좋아하는언어 : ${infoDto.lang }<br>
</tr>
</table>
</body>
</html>