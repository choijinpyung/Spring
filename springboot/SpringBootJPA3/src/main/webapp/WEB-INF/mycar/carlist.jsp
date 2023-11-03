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
.box{
	width: 40px;
	height: 40px;
	border-radius: 100px;
}

img{
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
<h2 class="alert alert-dark" align="center">총 ${list.size() }개의 자동차가 등록되었습니다 </h2>
	<div style="margin: 50px 570px;">
		<button type="button" class="btn btn-outline-dark" style="width: 300px; height: 200px; font-size: 2em;"
		onclick="location.href='carform'">자동차 정보 입력</button>
	</div>
	
	<div style="margin: 50px 270px;">
		<table class="table table-borered" style="width: 1000px;">
			<tr>
				<th width="70">번호</th>
				<th width="200" align="center">자동차명</th>
				<th width="80">색상</th>
				<th width="120">가격</th>
				<th width="120">구입일</th>
				<th width="150">등록일</th>
				<th width="200">편집</th>
			</tr>
			
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td><a href="detail?num=${dto.num }">
				<img alt="" src="../save/${dto.carphoto }">${dto.carname }</a></td>
				<td><div style="background-color: ${dto.carcolor}" class="box"></div></td>
				<td><fmt:formatNumber value="${dto.carprice }" type="currency"/></td>
				<td>${dto.carguip }</td>
				<td><fmt:formatDate value="${dto.guipday }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>
				<button type="button" class="btn btn-outline-dark" style="width: 60px;"
				onclick="location.href=''">수정</button>
				<button type="button" class="btn btn-outline-dark" style="width: 60px;"
				onclick="location.href=''">삭제</button>
				</td>
			</tr>
		</c:forEach>
			
		</table>
	</div>
	
	
</body>
</html>