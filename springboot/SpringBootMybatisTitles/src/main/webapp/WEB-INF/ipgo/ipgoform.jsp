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
.ipgoformbox{
	width: 100%;
	height: 60vh;
	display: flex;
	justify-content: center;
    align-items: center;
}

.ipgoformbox table{
	width: 60vh;
	height: 40vh;
}

.ipgoformbox img{
	width: 10vh;
}

.ipgoform_insert{
	width: 8vh;
	height: 5vh;
	border-radius: 5px;
	margin-right: 0.5vh;
	border: none;
	color: white;
	background-color: #346CF0;
}

.ipgoform_list{
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
<div align="center" class="ipgoformbox">
	<form action="ipgoinsert" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
		
			<tr>
				<td colspan="2" align="center" valign="middle"><b>상품등록</b></td>
			</tr>
			<tr>
				<td align="center" valign="middle" style="width: 15vh;">상품명</td>
				<td valign="middle">
					<input type="text" name="sangpum" class="form-control input_margin"
					required="required" style="width: 25vh;">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">가격</td>
				<td valign="middle">
					<input type="text" name="price" class="form-control input_margin"
					required="required" style="width: 25vh;">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">사진</td>
				<td valign="middle">
					<input type="file" name="photo" class="form-control input_margin"
					style="width: 35vh;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" valign="middle">
					<button type="submit" class="ipgoform_insert">저장</button>
					<button type="button" class="ipgoform_list"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
			
		</table>
	</form>
</div>
</body>
</html>