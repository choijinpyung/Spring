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
a:link {
	text-decoration: none;
}

.memlistbox table {
	width: 150vh;
	border: 1px solid black;
}

.memlistbox {
	width: 73.7%;
	margin-top: 10vh;
}

.memlistbuttonbox {
	width: 73.7%;
	height: 4.5vh;
	margin: 2vh 0vh;
}

.memlistaddbtn {
	width: 9vh;
	height: 4.2vh;
	font-size: 2vh;
	border-radius: 5px;
	margin-left: 0.5vh;
	border: none;
	color: white;
	background-color: deeppink;
}

.pagingbox {
	width: 12%;
	height: 6vh;
	text-align: center;
	margin-bottom: 7vh;
}

</style>
<body>
	<div align="center">

		<div class="memlistbox">

			<table class="table table-bordered">
				<tr>
					<td width="50" align="center">번호</td>
					<td width="80" align="center">작성자</td>
					<td width="100" align="center">제목</td>
					<td width="50" align="center">조회</td>
					<td width="100" align="center">등록일</td>
				</tr>

				<c:if test="${totalCount==0 }">
					<tr>
						<td colspan="5" align="center"><b>등록된 글이 없습니다</b></td>
					</tr>
				</c:if>

				<c:if test="${totalCount>0 }">
					<c:forEach var="dto" items="${list }" varStatus="i">
						<tr>
							<td width="50" align="center">${dto.num}</td>
							<td width="80" align="center">${dto.name }</td>
							
							<td width="100" align="center"><a href="content?num=${dto.num }">${dto.subject }</a></td>
							
							<td width="50" align="center">${dto.readcount }</td>
							<td width="100" align="center"><fmt:formatDate
									value="${dto.writeday }" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>

		</div>
		<div class="memlistbuttonbox" align="right">
			<c:if test="${sessionScope.loginok!=null }">
				<button type="button" class="memlistaddbtn"
					onclick="location.href='form'">글쓰기</button>
			</c:if>
		</div>
		<div>
			<!-- 페이징 -->
			<c:if test="${totalCount>0 }">
				<div class="pagingbox">
					<ul class="pagination justify-content-center">
					
						<!-- 이전 -->
						<c:if test="${startPage>1 }">
							<li><a href="list?currentPage=${startPage-1 }">이전</a></li>
						</c:if>

						<c:forEach var="pp" begin="${startPage }" end="${endPage }">
							<c:if test="${currentPage==pp }">
								<li class="page-item active"><a class="page-link"
									href="list?currentPage=${pp }">${pp }</a></li>
							</c:if>

							<c:if test="${currentPage!=pp }">
								<li class="page-item"><a class="page-link"
									href="list?currentPage=${pp }">${pp }</a></li>
							</c:if>
						</c:forEach>

						<!-- 다음 -->
						<c:if test="${endPage<totalPage }">
							<li class="page-item"><a class="page-link"
								href="list?currentPage=${endPage+1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>