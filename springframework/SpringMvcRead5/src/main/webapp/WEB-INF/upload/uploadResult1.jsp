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
<h2>제목 : ${title }</h2>
<h2>업로드한 실제 경로 : ${path }</h2>
<h2>업로드한 이미지명 : ${fileName }</h2>
<c:if test="${fileName=='no' }">
	<img alt="" src="../photo/noimage.png" style="max-width: 300px;">
</c:if>
<img alt="" src="../photo/${fileName }" style="max-width: 300px;">
</body>
</html>