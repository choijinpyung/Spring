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
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style>
.modal-dialog {
    position: absolute;
    top: 20%;
}

.modal-content {
    height: 30vh;
}
</style>
</head>
<style>
a:link {
	text-decoration: none;
}

.alist {
	font-size: 2vh;
}

.aupdatebtn, .adeletebtn{
	color: rgb(15, 82,252);
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
	
	//리스트 호출
	list();
	
	//버튼 이벤트 추가
    $("#btnaddanswer").click(function() {
        var num = $("#num").val();
        var content = $("#answercontent").val();

        if(content.length == 0) {
            alert("댓글을 입력하세요");
        } else {
            // 데이터 객체 생성
            var data = {
                num: num,
                content: content
            };

            $.ajax({
                type: "post",
                url: "/mbanswer/ainsert",
                data: data,
                dataType: "html",
                success: function() {
                	
                    //alert("인설트 성공");
                   	list();
                   	
                   	//입력값 초기화
                   	$("#content").val("");
                }
            });
        }
    });
});
$(document).on('click', '.aupdatebtn', function(e) {
    idx = $(this).attr("idx");

    $('#replyModal').modal('show');

    //alert(idx);
    // 기존 댓글 내용을 모달 입력창에 표시
    $.ajax({
        type: "get",
        url: "/mbanswer/updateform",
        data: { "idx": idx }, // idx 값을 전달
        dataType: "json",
        success: function(res) {
            $("#ucontent").val(res.content);
            $(".aupdatebtn").attr("idx", idx);
        }
    });
    
});


// 댓글 수정
$(document).on('click', '#btnUpdateModalAnswer', function(e) {
    var content = $("#ucontent").val();
	alert(idx)
	alert(content)
	
        $.ajax({
            type: "post",
            url: "/mbanswer/aupdate",
            data: {"idx": idx, "content": content},
            dataType: "json",
            success: function() {
            	
            	//alert("업데이트 성공");
               	list();
            }
        });
	
});


	
	//댓글 삭제
	
	$(document).on('click', '.adeletebtn', function(e) {
	    var idx = $(this).attr("idx");
	   	
		//alert(idx);
		var con=confirm("삭제하시겠습니까?");
		
		if(con)
		{
				
		
	    $.ajax({
	        type: "get",
	        url: "/mbanswer/adelete",
	        data: { "idx": idx },  // 'idx' 매개변수로 전달합니다.
	        dataType: "html",
	        success: function() {
	        
	          alert("삭제가 완료되었습니다.")
	          location.reload();
	        }
	    });
		}
		
		else
		{
		alert("취소되었습니다")
		}

	});
	
    function list() {
        var num = $("#num").val();
		
        var loginok = "${sessionScope.loginok}";
        var myid = "${sessionScope.myid}";
        
        $.ajax({
            type: "get",
            url: "/mbanswer/alist",
            data: { "num": num },
            dataType: "json",
            success: function(res) {
            	
            	$(".acount").text(res.length);
            	
            	
                var s = "";
                
                $.each(res, function(i, dto) {
                	
                	s+="<br>";
                    s+= "아이디 : "+dto.myid+"<br>";
                    s+= "이름 : "+dto.name+"<br>";
                    s+= "내용 : "+dto.content+"<br>";
                    s+= "작성일 : "+dto.writeday+"<br>";
                    s+="<br>";
                   	if(loginok=='yes' && myid==dto.myid)
                   		{
                    s+= "<b class='aupdatebtn' idx='" + dto.idx + "'>";
                    s+= "수정<i class='bi bi-pencil-square'></i>&nbsp;&nbsp;";
                    s+= "</b>";
                    
                    s += "<b class='adeletebtn' idx='" + dto.idx + "'>";
                    s+= "삭제<i class='bi bi-trash3'></i>";
                    s+= "</b>";
                   		}
                    
                    s+="<br><br>";
                    
                });

                $(".alist").html(s);
                
            }
        });
    }

</script>
<body>
	<div style="margin: 12vh 0vh;" align="center">
		<table class="table table-bordered" style="width: 65vh;">
			<tr>
				<td>
					<h4>
						제목 :&nbsp;${dto.subject } <span style="float: right;"> <fmt:formatDate
								value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" />
						</span>
					</h4> <span>작성자: ${dto.name }(${dto.myid })</span> <c:if
						test="${dto.uploadfile!='no' }">
						<span style="float: right"><a
							href="download?clip=${dto.uploadfile }"> <i
								class="bi bi-cloud-download"></i> <b>${dto.uploadfile }</b></a></span>
					</c:if>
				</td>
			</tr>

			<tr>
				<td align="center"><c:if test="${bupload==true }">
						<img src="../savefile/${dto.uploadfile }" style="width: 10vh;">
					</c:if> <br> <br> ${dto.content } <br> <br> 댓글 :&nbsp;<span
					class="acount"></span>&nbsp;&nbsp;조회 : ${dto.readcount }</td>
			</tr>

			<!-- 댓글 -->
			<tr>
				<td>
					<div class="alist" align="center"></div> <input type="hidden"
					id="num" value="${dto.num }"> <input type="hidden"
					id="name" value="${dto.name }"> <input type="hidden"
					id="myid" value="${dto.myid }"> <c:if
						test="${sessionScope.loginok!=null }">
						<div class="aform">
							<div class="d-inline-flex">
								<input type="text" class="form-control" id="answercontent"
									style="width: 55vh;" placeholder="댓글 입력"> &nbsp;&nbsp;
								<button type="button" id="btnaddanswer">등록</button>
							</div>
						</div>
					</c:if>
				</td>
			</tr>

			<tr>
				<td align="center"><c:if test="${sessionScope.loginok!=null }">

						<button type="button" onclick="location='form'">글쓰기</button>
					</c:if> <c:if
						test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
						<button type="button"
							onclick="location='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					</c:if> <c:if
						test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
						<button type="button"
							onclick="location='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
					</c:if>

					<button type="button"
						onclick="location='list?currentPage=${currentPage}'">목록</button></td>
			</tr>
		</table>
	</div>

	<!-- 모달 창 -->

	<div class="modal" id="replyModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">댓글 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 모달 내용 -->
                <input type="text" class="form-control" id="ucontent"
                    placeholder="수정할 댓글 입력">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                    data-bs-dismiss="modal">취소</button>
                <!-- 수정된 버튼 ID와 텍스트 -->
                <button type="button" id="btnUpdateModalAnswer" class="btn btn-primary" data-bs-dismiss="modal">수정</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>