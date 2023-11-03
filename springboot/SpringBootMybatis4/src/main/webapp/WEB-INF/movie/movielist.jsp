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
<style>
.movieimage {
	width: 200px;
	height: 250px;
	border: 1px solid silver;
	border-radius: 20px;
	box-shadow: 3px 3px 3px black;
	margin-bottom: 10px;
}
</style>
<body>
	<div style="margin: 100px 160px 50px 160px; display: flex;">
		<c:if test="${list.size()<0 }">
			<h2>등록된 영화가 없습니다!</h2>
		</c:if>

		<c:if test="${list.size()>0 }">
			<c:forEach var="list" items="${list }">


				<table style="width: 300px;">
					<tr>
						<td colspan="2" align="center">
						<a href="detail?num=${list.mv_num }">
						<img alt="" src="../moviephoto/${list.mv_poster }" class="movieimage">
						</a>
						</td>
					</tr>
					
					<tr>
					<td colspan="2" align="center">${list.mv_title }</td>
					</tr>
					
					<tr>
					<td colspan="2" align="center">${list.mv_director }</td>
					</tr>
					
					<tr>
					<td colspan="2" align="center">${list.mv_opendate }</td>
					</tr>
				</table>
				

			</c:forEach>
		</c:if>

	</div>
	<div align="center">
		<button type="button" class="btn btn-outline-dark"
			onclick="location.href='writeform'"
			style="width: 200px; height: 100px;">영화등록</button>
	</div>
</body>
</html>