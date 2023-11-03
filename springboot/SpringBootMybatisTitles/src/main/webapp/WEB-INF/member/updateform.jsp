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
.memberformbox{
	width: 100%;
	height: 85vh;
	display: flex;
	justify-content: center;
    align-items: center;
}

.memberformbox table{
	width: 60vh;
	height: 40vh;
}

.memberform_update{
	width: 8vh;
	height: 5vh;
	border-radius: 5px;
	margin-right: 0.5vh;
	border: none;
	color: white;
	background-color: #346CF0;
}

.memberform_list{
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
<div align="center" class="memberformbox">
	<form action="memberupdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${dto.num }">
		<table class="table table-bordered">
		
			<tr>
				<td colspan="2" align="center" valign="middle"><b>회원정보수정</b></td>
			</tr>
			
			<tr>
				<td align="center" valign="middle" style="width: 15vh;">이름</td>
				<td>
					<input type="text" name="name" class="form-control input_margin"
					required="required" style="width: 15vh;" value="${dto.name }">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">아이디</td>
				<td>
				<input type="text" name="id" class="form-control input_margin"
				required="required" style="width: 25vh;" value="${dto.id }">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">비밀번호</td>
				<td>
				<input type="password" name="pass" class="form-control input_margin"
				required="required" style="width: 25vh;">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">사진</td>
				<td>
				<input type="file" name="photoname" class="form-control input_margin"
					style="width: 35vh;">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle" style="height: 3.3vh">전화번호</td>
				<td>
				<input type="text" name="hp" class="form-control input_margin"
				required="required" style="width: 25vh;" value="${dto.hp }">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">주소</td>
				<td>
				<input type="text" name="addr" class="form-control input_margin"
				required="required" style="width: 25vh;" value="${dto.addr }">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">이메일</td>
				<td>
				<input type="text" name="email" class="form-control input_margin"
				required="required" style="width: 25vh;" value="${dto.email }">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" valign="middle">
					<button type="submit" class="memberform_update">저장</button>
					<button type="button" class="memberform_list"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>