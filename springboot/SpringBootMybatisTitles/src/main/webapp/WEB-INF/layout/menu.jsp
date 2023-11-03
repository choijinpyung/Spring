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
ul.menu{
	list-style: none;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #346CF0;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

ul.menu li{
	width: 20vh;
	height: 7vh;
	float: left;
	text-align: center;
	padding-top: 2vh;
	font-size: 2vh;
	cursor: pointer;
	padding-bottom: 0.5vh;
	font-weight: bold;	
}

ul.menu li:hover {
    border-bottom: 3px solid #FFDB58;
}

ul.menu li a{
	text-decoration: none;
	color: white;
}
</style>
</head>
<script type="text/javascript">
</script>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<ul class="menu">
	<li>
		<a href="/">Home</a>
	</li>
	
	<li>
		<a href="${root }/ipgo/ipgoform">상품등록</a>
	</li>
	
	<li>
		<a href="${root }/ipgo/list">상품목록</a>
	</li>
	
	<li>
		<a href="${root }/memboard/list">회원게시판</a>
	</li>
	
	<li>
		<a href="${root }/reboard/list">답변게시판</a>
	</li>
	
	<li>
		<a href="${root }/member/list">회원목록</a>
	</li>
	
	<li>
		<a href="${root }/road/map">오시는길</a>
	</li>
</ul>
</body>
</html>