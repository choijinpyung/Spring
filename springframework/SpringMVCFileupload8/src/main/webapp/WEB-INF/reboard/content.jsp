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
<script type="text/javascript">
$(document).ready(function() {
    $(".adel").click(function() {
        var idx = $(this).data("idx");
        var pass = prompt("비밀번호 입력");
        
        if (pass == null)
            return;
        
        $.ajax({
            type: "get",
            url: "adelete",
            data: { "idx": idx, "pass": pass },
            dataType: "json",
            success: function(res) {
                if (res.check == 0) {
                    alert("비밀번호가 틀립니다");
                } else {
                	alert("삭제되었습니다");
                    location.reload();
                }
            }
        });
    });
});
</script>
<body>
	<div style="margin: 70px 450px;">
		<table class="table table-bordered"
			style="width: 500px; height: 500px;">
			<caption align="top">
				<b>내용보기</b>
			</caption>

			<tr>
				<td><h2>
						<b>${dto.subject }</b>
					</h2> <span style="float: right; margin: 20px;"> 조회 :
						${dto.readcount }&nbsp;&nbsp;&nbsp; <fmt:formatDate
							value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" />
				</span> <br>
					<h5>
						<b>작성자 : ${dto.writer }</b>
					</h5></td>
			</tr>

			<tr>
				<td><pre>${dto.content }</pre> <br> <br> <!-- 이미지가 없을때 출력 -->
					<c:if test="${dto.photo!='no'}">
						<c:forTokens var="pho" items="${dto.photo }" delims=",">
							<a href="../upload/${pho }"> <img alt=""
								src="../upload/${pho }" style="width: 150px; height: 150px;"></a>
						</c:forTokens>
					</c:if></td>
			</tr>

			<!-- 댓글 -->
			<tr>
				<td>
					<div id="answer">
						<b>${acount } 개의 댓글이 있습니다</b><br> <br>

						<c:forEach var="a" items="${alist }">
						${a.nickname } : ${a.content }<br>
						작성일 : <fmt:formatDate value="${a.writeday }"
								pattern="yyyy-MM-dd HH:mm" />
							<i class="adel bi bi-trash" style="cursor: pointer;"
								data-idx="${a.idx}"></i>
							<br>
							<br>
						</c:forEach>
					</div> <br>
					<form action="ainsert" method="post" style="width: 500px;">
						<!--hidden -->
						<input type="hidden" name="num" value="${dto.num }"> <input
							type="hidden" name="currentPage" value="${currentPage }">
						<div class="d-inline-flex">
							<b>닉네임 :&nbsp;&nbsp;</b> <input type="text" name="nickname"
								class="form-control" style="width: 100px;" required="required">&nbsp;&nbsp;

							<b>비밀번호 :&nbsp;&nbsp;</b> <input type="password" name="pass"
								class="form-control" style="width: 100px;" required="required">
						</div>
						<br> <br>

						<div class="d-inline-flex">
							<input type="text" name="content" class="form-control"
								style="width: 350px;" placeholder="댓글내용을 입력해주세요">&nbsp;&nbsp;
							<button type="submit">확인</button>
						</div>
					</form>
				</td>
			</tr>



			<tr>
				<td align="right">
					<button type="button" onclick="location.href='writeform'">글쓰기</button>
					<button type="button"
						onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글</button>
					<button type="button"
						onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					<button type="button"
						onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
					<button type="button"
						onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>