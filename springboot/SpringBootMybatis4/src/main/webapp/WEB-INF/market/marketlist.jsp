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
<style>
.image{
	width: 100px;
	height: 100px;
}
</style>
<body>
<c:if test="${totalCount==0 }">
	<div style="margin: 50px 320px;">
		<h2>저장된 상품 정보가 없습니다 </h2>
	</div>
</c:if>

<c:if test="${totalCount>0 }">
	<div style="margin: 50px 320px;">
		<h2>총 ${totalCount }개의 상품이 있습니다</h2>
		<table class="table table-bordered" style="width: 800px;">
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>사진</th>
				<th>입고일</th>
				<th>편집</th>
			</tr>
			
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.sang }</td>
				<td><fmt:formatNumber value="${dto.price }" type="currency"/></td>
				<td>
				<c:if test="${dto.photoname=='no' }">
				<img alt="" src="/no.png" class="image">
				</c:if>
				<c:if test="${dto.photoname!='no' }">
				<img alt="" src="../save/${dto.photoname }" class="image">
				</c:if>
				</td>
				<td><fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>
				<button type="button" class="btn btn-outline-dark" onclick="location.href='update?num=${dto.num}'">수정</button>
				<button type="button" class="btn btn-outline-dark" onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>	
		</table>
	</div>
</c:if>
<div style="margin: 10px 320px;" align="right">
<button type="button" class="btn btn-outline-dark" onclick="location.href='writeform'">글쓰기</button>
</div>
</body>
</html>