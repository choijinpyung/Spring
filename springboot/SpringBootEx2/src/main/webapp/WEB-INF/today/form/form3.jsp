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
<h2>폼 데이터 MAP 읽기</h2>

	<form action="myread" method="post">
	
		<table class="table table-bordered" style="width: 300px;">
		
			<tr>
				<th>이름</th>
				
				<td>
					<input type="text" name="name" class="form-control">
				</td>
			</tr>
			
			<tr>
				<th>혈액형</th>
				
				<td>
					<input type="text" name="blood" class="form-control">
				</td>
			</tr>
			
			<tr>
				<th>나이</th>
				
				<td>
					<input type="text" name="age" class="form-control">
				</td>
			</tr>
		
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-outline-warning">
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>