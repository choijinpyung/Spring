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
.memboardformbox{
	width: 100%;
	height: 75vh;
	display: flex;
	justify-content: center;
    align-items: center;
}

.memboardformbox table{
	width: 60vh;
	height: 40vh;
}

.memboardformbox img{
	width: 10vh;
}

.memboardbutton{
	width: 8vh;
	height: 5vh;
	border-radius: 5px;
	margin-right: 0.5vh;
	border: none;
	color: white;
	background-color: #346CF0;
}

.memboardform_add{
	width: 8vh;
	height: 5vh;
	border-radius: 5px;
	margin-right: 0.5vh;
	border: none;
	color: white;
	background-color: #FFA500;
}

.input_margin{
	 margin-left: 2vh;
}
</style>
<body>
<div align="center" class="memboardformbox">
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
		
			<tr>
				<td colspan="2" align="center" valign="middle"><b>댓글작성</b></td>
			</tr>
			<tr>
				<td align="center" valign="middle" style="width: 15vh;">제목</td>
				<td valign="middle">
					<input type="text" name="subject" class="form-control input_margin"
					required="required" style="width: 25vh;">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">파일업로드</td>
				<td valign="middle">
					<input type="file" name="upload" class="form-control input_margin"
					style="width: 35vh;">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">내용</td>
				<td>
				<textarea name="content" class="input_margin"
				style="width: 38.5vh; height: 20vh; resize: none;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" valign="middle">
					<button type="submit" class="memboardbutton">등록</button>
					<button type="button" class="memboardform_add"
					onclick="location.href='content'">목록</button>
				</td>
			</tr>
			
		</table>
	</form>
</div>
</body>
</html>