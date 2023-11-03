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

.membermyinfo_array{
	width: 90%;
	margin: 5% 0 4% 6%;
    display: flex;
    flex-wrap: wrap;
}
.membermyinfo_array table{
	width: 50vh;
	height: 44vh;
	margin: auto;
}

.myinfo_update{
	width: 8vh;
	height: 5vh;
	border-radius: 5px;
	margin-right: 0.5vh;
	border: none;
	color: white;
	background-color: #346CF0;
}

.myinfo_delete{
	width: 8vh;
	height: 5vh;
	border-radius: 5px;
	margin-left: 0.5vh;
	border: none;
	color: white;
	background-color: deeppink;
}

.modal-dialog {
	top: 10%;
}

.modal-content {
	width: 100%;
	height: 68vh;
}

#updateInfo{
	width: 10vh;
	height: 5vh;
	border-radius: 5px;
	margin-right: 0.5vh;
	border: none;
	color: white;
	background-color: #346CF0;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $(".btnnewphoto").click(function() {
        $("#newphoto").trigger("click");
    });

    $("#newphoto").change(function() {
        var num = $(this).attr("num");
        
        var form = new FormData();
        form.append("photo", $(this)[0].files[0]);
        form.append("num", num);

        $.ajax({
            type: "post",
            dataType: "html",
            url: "updatephoto",
            processData: false,
            contentType: false,
            data: form,
            success: function() {
                location.reload();
            }
        });
    });
});
</script>
<body>
<div>
	<div align="center" class="membermyinfo_array">
		<table class="table table-bordered">
		
		<c:forEach var="dto" items="${list }">
			<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.id }">
			<tr>
				<td colspan="2" align="center" style="height: 3vh;"><b>내 정보</b></td>
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
			    <td align="center">
			        <!-- 파일 선택 버튼 -->
			        
			            <c:if test="${dto.photo=='no'}">
			                <img alt="" src="/image/noimage.png" class="btnnewphoto">
			            </c:if>
			            <c:if test="${dto.photo!='no'}">
			                <img alt="" src="../membersave/${dto.photo}" class="btnnewphoto" >
			            </c:if>
			        <input type="file" id="newphoto" num="${dto.num}" style="display:none;" />
			        
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
					<button type="button" class="myinfo_update" value="${dto.num }">수정</button>
					<button type="button" class="myinfo_delete"
						onclick="location.href='myinfodelete?num=${dto.num}'">삭제</button>
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
</div>
<!-- 모달이 나타날 부분 -->
<div class="modal fade" id="myinfoUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myinfoUpdateModalLabel" aria-hidden="true">
    <!-- 모달 내용 -->
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myinfoUpdateModalLabel">Update</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" align="center">
                <!-- 여기에 사용자 정보 업데이트 폼 또는 해당 내용 추가 -->
                <!-- 예를 들어, 폼 필드 및 업데이트 버튼 -->
                
               	이름<br><input type="text" id="newname" name="name" class="form-control"
                style="width: 25vh; height: 5vh;"><br>
                이메일<br><input type="text" id="newemail" name="email" class="form-control"
                style="width: 25vh; height: 5vh;"><br>
                전화번호<br><input type="text" id="newhp" name="hp" class="form-control"
                style="width: 25vh; height: 5vh;"><br>
              	주소<br><input type="text" id="newaddr" name="addr" class="form-control"
                style="width: 25vh; height: 5vh;">
                <br>
                <button type="button" id="updateInfo" value="${dto.num }" data-bs-dismiss="modal">Update</button>
            </div>
            <!-- 추가적인 모달 하단 버튼 등 -->
        </div>
    </div>
</div>
<script>
$('.myinfo_update').click(function () {
    $('#myinfoUpdateModal').modal('show');
    num=$('.myinfo_update').val();
    
    $.ajax({
    	
    	type: 'get',
    	url: 'myinfomodal',
    	dataType:'json',
    	data:{"num":num},
    	success:function(res) {

			$("#newname").val(res.name);
			$("#newemail").val(res.email);
			$("#newhp").val(res.hp);
			$("#newaddr").val(res.addr);
		}
    })
});

$('#updateInfo').click(function () {
	
    var newName = $('#newname').val();
    var newEmail = $('#newemail').val();
    var newHp = $('#newhp').val();
    var newAddr = $('#newaddr').val();

    $.ajax({
        type: 'post',
        url:"myinfoupdate",
        dataType:"html",
        data: {
            "num": num,
            "name": newName,
            "email": newEmail,
            "hp": newHp,
            "addr": newAddr
        },
        success: function (response) {
        	
        	location.reload();
        }
    });
});
</script>
</body>
</html>