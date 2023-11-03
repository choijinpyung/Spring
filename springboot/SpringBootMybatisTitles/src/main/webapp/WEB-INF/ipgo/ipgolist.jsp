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

.ipgolist_array{
	width: 90%;
	margin: 3% 0 3% 6%;
    display: flex;
    flex-wrap: wrap;
}

.ipgolist_array table{
	width: 50vh;
	height: 44vh;
	margin: 5vh 5vh;
	float: left;
}

.ipgolist_update{
	width: 8vh;
	height: 5vh;
	border-radius: 5px;
	margin-right: 0.5vh;
	border: none;
	color: white;
	background-color: #346CF0;
}

.ipgolist_delete{
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
			onclick="location.href='ipgoform'">상품추가</button>
	</div>
	
	<div class="scrolling-text-container">
		<div class="scrolling-text">총 ${totalCount } 개의 상품이 있어요!</div>
	</div>
	
	<div class="ipgolist_array">
			<c:if test="${totalCount>0 }">
				<c:forEach var="dto" items="${list }" varStatus="i">
				<table class="table table-bordered">
				
					<tr>
						<td colspan="2" align="center" style="height: 3vh;"><b>${i.count }번 상품</b></td>
					</tr>
					<tr>
						<td align="center" style="height: 6vh;">상품명</td>
						<td align="center">${dto.sangpum }</td>
					</tr>

					<tr>
						<td align="center" style="height: 6vh;">가격</td>
						<td align="center"><fmt:formatNumber value="${dto.price }"/>원
						</td>
					</tr>

					<tr>
						<td align="center" valign="middle" style="height: 10vh;">사진</td>
						<td align="center"><c:if test="${dto.photoname=='no' }">
									<img alt="" src="/image/noimage.png">
								</c:if> <c:if test="${dto.photoname!='no' }">
									<img alt="" src="../upload/${dto.photoname }">
								</c:if>
						</td>
					</tr>

					<tr>
						<td align="center" style="height: 6vh;">입고일</td>
						<td align="center"><fmt:formatDate value="${dto.ipgoday }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="button" class="ipgolist_update"
								onclick="location.href='ipgoupdateform?num=${dto.num}'">수정</button>
							<button type="button" class="ipgolist_delete"
								onclick="location.href='ipgodelete?num=${dto.num}'">삭제</button>
						</td>
					</tr>
				</table>
				</c:forEach>
			</c:if>	
	</div>
</body>
</html>