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
	<div style="margin: 150px 550px; width: 500px;">
		<form action="insert" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="width: 330px; height: 200px;">
				<tr>
					<th>자동차명</th>
					<td>
						<input type="text" name="carname" class="form-control" style="width: 120px;" required="required">
					</td>
				</tr>
				
				<tr>
					<th>가격</th>
					<td>
						<input type="text" name="carprice" class="form-control" style="width: 120px;" required="required">
					</td>
				</tr>
				
				<tr>
					<th>색깔</th>
					<td>
						<input type="color" name="carcolor" class="form-control" style="width: 120px;" required="required"
						value="#ff0000">
					</td>
				</tr>
				
				
				<tr>
					<th>구입일</th>
					<td>
						<input type="date" name="carguip" class="form-control" style="width: 150px;" required="required"
						value="2023-10-01">
					</td>
				</tr>
				
				<tr>
					<th>자동차사진</th>
					<td>
						<input type="file" name="carupload" class="form-control" style="width: 150px;" required="required">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-dark" style="width: 100px;">저장</button>
						<button type="button" class="btn btn-outline-dark" style="width: 100px;"
						onclick="location.href='carlist'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>