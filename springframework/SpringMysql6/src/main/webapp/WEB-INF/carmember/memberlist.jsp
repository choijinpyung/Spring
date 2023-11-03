<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${count==0 }">
		<h2>등록된 고객 정보가 없습니다</h2>
	</c:if>

	<c:if test="${count>0 }">
		<h2>${count }명의고객이 있습니다 <button type="button" onclick="location.href='addform'" class="btn btn-outline-success">고객 추가</button></h2>
	</c:if>
	<table class="table table-bordered" style="width: 700px;">

		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>구입일시</th>
			<th>편집</th>
		</tr>

		<c:forEach var="dto" items="${list }" varStatus="i">

			<tr>
				<td>${i.count }</td>
				<td>${dto.name }</td>
				<td>${dto.hp }</td>
				<td>${dto.addr }</td>
				<td><fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd" /></td>
				<td>
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='update?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-outline-danger"
						onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>