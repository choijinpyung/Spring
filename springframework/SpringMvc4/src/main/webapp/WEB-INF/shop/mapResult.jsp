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
<h2>학생 정보 출력_map</h2>
<div>
이름 : ${name }<br>
자바 점수: ${java }<br>
스프링 점수: ${spring }<br>
제이쿼리 점수: ${jquery }<br>
<c:set var="tot" value="${java+spring+jquery }"/>
<c:set var="avg" value="${tot/3 }"/>
총 합계 : ${tot }<br>
평균 : ${avg }
</div>
</body>
</html>