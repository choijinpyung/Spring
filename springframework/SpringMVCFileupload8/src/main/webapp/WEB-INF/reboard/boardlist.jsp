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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div
		style="width: 100%; height: 100px; border-bottom: 2px groove black;">
		<b>총 ${totalCount }개의 글이 있습니다</b>
	</div>

	<div style="margin: 100px 320px;">
		<table class="table table-bordered" style="width: 800px;">
			<caption align="top">

				<b>스프링 답변형 게시판</b> <span style="float: right;">
					<button type="button" onclick="location.href='writeform'">글쓰기</button>
				</span>
			</caption>

			<tr>
				<th width="100">번호</th>
				<th width="100">제목</th>
				<th width="100">작성자</th>
				<th width="100">작성일</th>
				<th width="100">조회</th>
			</tr>

			<c:if test="${totalCount==0 }">
				<tr>
					<td colspan="5" align="center"><b>등록된 게시글이 없습니다</b></td>
				</tr>
			</c:if>

			<c:if test="${totalCount>0 }">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td align="center">${no }</td>
						<c:set var="no" value="${no-1 }" />

						<!-- 제목 -->
						<td>
							<!-- relevel 만큼 공백 --> <c:forEach var="s" begin="1"
								end="${dto.relevel }">&nbsp;&nbsp;</c:forEach> <!-- 답글인 경우에만 re.png 이미지 출력 -->
							<c:if test="${dto.relevel>0 }">
								<img alt="" src="../upload/re.png">
							</c:if> <!-- 제목..여기누르면 내용보기로.. --> <a
							href="content?num=${dto.num }&currentPage=${currentPage}">${dto.subject }</a>
							
							<!-- 댓글갯수 -->
							<c:if test="${dto.acount>0 }">
								<a style="color: red; text-decoration: none;" href="content?num=${dto.num }&currentPage=${currentPage}#answer">[${dto.acount }]</a>
							</c:if>
							<!-- 사진이 있을 경우 아이콘 표시 --> <c:if test="${dto.photo !='no' }">
								<i class="bi bi-image"></i>
							</c:if>
						</td>
						<td align="center">${dto.writer }</td>
						<td><fmt:formatDate value="${dto.writeday }"
								pattern="yyyy-MM-dd" /></td>
						<td align="center">${dto.readcount }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>

		<div>
			<!-- 페이지 번호 출력 -->
			<c:if test="${totalCount>0 }">
				<div style="width: 800px; text-align: center">
					<ul class="pagination justify-content-center">
						<!-- 이전 -->
						<c:if test="${startPage>1 }">
							<li class="page-item"><a class="page-link"
								href="list?currentPage=${startPage-1 }">이전</a></li>
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