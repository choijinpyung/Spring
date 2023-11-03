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
.movieimage {
	width: 200px;
	height: 250px;
	border: 1px solid silver;
	border-radius: 20px;
	box-shadow: 3px 3px 3px black;
	margin-bottom: 10px;
}

.set {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
</style>
</head>
<body>
<div align="center" class="set">
<table style="width: 300px;">
					<tr>
						<td colspan="2" align="center">
						
						<img alt="" src="../moviephoto/${dto.mv_poster }" class="movieimage">

						</td>
					</tr>
					
					<tr>
					<td colspan="2" align="center">${dto.mv_title }</td>
					</tr>
					
					<tr>
					<td colspan="2" align="center">${dto.mv_director }</td>
					</tr>
					
					<tr>
					<td colspan="2" align="center">${dto.mv_opendate }</td>
					</tr>
				</table>
</div>
</body>
</html>