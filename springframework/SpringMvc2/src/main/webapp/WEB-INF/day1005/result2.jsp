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
<c:set var="tot" value="${java+spring }"/>
<c:set var="avg" value="${tot/2 }"/>
	<h2>점수 출력 결과</h2><br>
	<pre>
	<b>자바 점수 : ${java }</b><br>
	<b>스프링 점수 : ${spring }</b><br>
	<b>총점 : ${tot }</b><br>
	<b>평균 : ${avg }</b><br>
	</pre>
</body>
</html>