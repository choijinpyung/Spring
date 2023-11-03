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
table img {
    width: 10vh;
    height: 10vh;
}

.count {
    height: 15vh;
    font-size: 1.5em;
    color: white;
}

.scrolling-text-container {
    width: 100%;
    overflow: hidden;
    position: relative;
    background-color: #346CF0;
    height: 15vh;
    font-size: 1.5em;
    border-bottom: 1px solid black;
}

.scrolling-text {
    white-space: nowrap;
    animation: scroll 30s linear infinite;
    margin-top: 5vh;
    color: white;
    font-weight: bold;
}

@keyframes scroll {
    0% {
        transform: translateX(0%);
    }
    100% {
        transform: translateX(100%);
    }
}

.fixed-button {
    position: fixed;
    z-index: 2;
    bottom: 9vh;
    right: 16.8vh;
    background-color: rgb(52, 108, 240);
    color: white;
    padding: 10px 20px;
    border: 1px solid white;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

.memberlist_array{
	width: 90%;
	margin: 3% 0 3% 6%;
    display: flex;
    flex-wrap: wrap;
}

.memberlist_array table{
	width: 50vh;
	height: 44vh;
	margin: 5vh 5vh;
	float: left;
}

.memberlist_update{
	width: 8vh;
	height: 5vh;
	border-radius: 5px;
	margin-right: 0.5vh;
	border: none;
	color: white;
	background-color: #346CF0;
}

.memberlist_delete{
	width: 8vh;
	height: 5vh;
	border-radius: 5px;
	margin-left: 0.5vh;
	border: none;
	color: white;
	background-color: deeppink;
}
</style>

<body>
	<div class="pixed">
		<button type="button" class="fixed-button"
			onclick="location.href='form'">회원가입</button>
	</div>
	<div class="scrolling-text-container">
		<div class="scrolling-text">총 ${totalCount } 명의 회원이 있어요!</div>
	</div>

	<div class="memberlist_array">
			<c:if test="${totalCount>0 }">
				<c:forEach var="dto" items="${list }" varStatus="i">
				<table class="table table-bordered">
				
					<tr>
						<td colspan="2" align="center" style="height: 3vh;"><b>${i.count }번 회원</b></td>
					</tr>
					<tr>
						<td align="center" style="height: 6vh;">이름</td>
						<td align="center">${dto.name }</td>
					</tr>
					
					<tr>
						<td align="center" style="height: 6vh;">아이디</td>
						<td align="center">${dto.id }</td>
					</tr>

					<tr>
						<td align="center" valign="middle" style="height: 10vh;">사진</td>
						<td align="center"><c:if
									test="${dto.photo=='no' }">
									<img alt="" src="/image/noimage.png">
								</c:if> <c:if test="${dto.photo!='no' }">
									<img alt="" src="../membersave/${dto.photo }">
								</c:if>
						</td>
					</tr>

					<tr>
						<td align="center" style="height: 6vh;">전화번호</td>
						<td align="center">${dto.hp }</td>
					</tr>
					
					<tr>
						<td align="center" style="height: 6vh;">주소</td>
						<td align="center">${dto.addr }</td>
					</tr>
					
					<tr>
						<td align="center" style="height: 6vh;">이메일</td>
						<td align="center">${dto.email }</td>
					</tr>
					
					<tr>
						<td align="center" style="height: 6vh;">가입일</td>
						<td align="center"><fmt:formatDate value="${dto.gaipday }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="button" class="memberlist_update"
								onclick="location.href='updateform?num=${dto.num}'">수정</button>
							<button type="button" class="memberlist_delete"
								onclick="location.href='memberdelete?num=${dto.num}'">삭제</button>
						</td>
					</tr>
				</table>
				</c:forEach>
			</c:if>	
	</div>
</body>
</html>