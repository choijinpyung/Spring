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
	<div style="width: 300px;">
		상품명 : ${shopDto.sang }<br>
		색상 : <b style="color: ${shopDto.color }">${shopDto.color }</b><br>
		가격 : <fmt:formatNumber value="${shopDto.price }" type="currency"/><br>
		선택한 이미지 : <img alt="" src="../photo/${shopDto.image }.png" style="width: 300px; border-radius: 50px;">
	</div>
</body>
</html>