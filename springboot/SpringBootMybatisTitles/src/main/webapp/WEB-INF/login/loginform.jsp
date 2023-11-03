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
.loginformbox{
	width: 100%;
	height: 60vh;
	display: flex;
	justify-content: center;
    align-items: center;
}

.loginformbox table{
	width: 60vh;
	height: 40vh;
}

.loginformbox img{
	width: 10vh;
}

.loginbutton{
	width: 10vh;
	height: 5vh;
	border-radius: 5px;
	margin-right: 0.5vh;
	border: none;
	color: white;
	background-color: #346CF0;
}

.loginform_add{
	width: 12vh;
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
<div align="center" class="loginformbox">
	<form action="loginprocess" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
		
			<tr>
				<td colspan="2" align="center" valign="middle"><b>로그인</b></td>
			</tr>
			<tr>
				<td align="center" valign="middle" style="width: 15vh;">아이디</td>
				<td valign="middle">
					<input type="text" name="id" class="form-control input_margin"
					required="required" style="width: 25vh;" value="${sessionScope.saveok==null?"":sessionScope.myid }">
				</td>
			</tr>
			
			<tr>
				<td align="center" valign="middle">비밀번호</td>
				<td valign="middle">
					<input type="password" name="pass" class="form-control input_margin"
					required="required" style="width: 25vh;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" valign="middle">
				<input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked" }> 아이디 저장
				<input type="checkbox"> 비밀번호 저장
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" valign="middle">
					<button type="submit" class="loginbutton">로그인</button>
					<button type="button" class="loginform_add"
					onclick="location.href='/member/form'">회원가입</button>
				</td>
			</tr>
			
		</table>
	</form>
</div>
</body>
</html>