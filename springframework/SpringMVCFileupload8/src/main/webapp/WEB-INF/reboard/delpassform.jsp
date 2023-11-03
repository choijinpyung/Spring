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
<div style="margin: 200px 550px;">
		<form action="deletepass" method="post">
			<input type="hidden" name="num" value="${num }">
			<input type="hidden" name="currentPage" value="${currentPage }">
			
			<div style="width: 300px; font-size: 1.3em;">
				<b>정말로 삭제하시겠습니까?</b>
				<br>
				<b style="font-size: 0.65em;">삭제 하시려면 비밀번호를 입력해주세요!</b>
				<br><br>
			</div>
			
			<div>
				<input type="password" name="pass" class="form-control"
				style="width: 200px;" required="required">
				<br>
				
				<button type="submit" style="width: 100px;">삭제하기</button>
				<button type="button" style="width: 100px;"
				onclick="history.back()">이전</button>
			</div>
		</form>
	</div>
</body>
</html>