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
.titlebox{
	width: 100%;
	height: 25vh;
}
.logo{
	height: 1vh;
	width: 15vh;
	height: 7vh;
}

.logo img{
	width: 10vh;
	margin-top: 0.6vh;
}

.people{
	width: 30vh;
	height: 18vh;
}

.people img{
	width: 30vh;
	margin-top: -6vh;
}

.titlebutton{
	position: absolute;
	right: 12vh;
	top: 6vh;
	width: 30vh;
	height: 12vh;
	border-radius: 5px;
	padding-top: 1vh;
}

.titlelogin{
	width: 10vh;
	height: 4.2vh;
	border-radius: 5px;
	margin-top: 1vh;
	margin-right: 1vh;
	border: 1px solid white;
	color: white;
	background-color: #346CF0;
	font-size: 2vh;
}

.titlelogout{
	width: 10vh;
	height: 4.2vh;
	border-radius: 5px;
	margin-top: 1vh;
	margin-right: 1vh;
	border: 1px solid white;
	color: white;
	background-color: #346CF0;
	font-size: 2vh;
}

.titlemyinfo{
	width: 10vh;
	height: 4.2vh;
	border-radius: 5px;
	margin-top: 1vh;
	margin-right: 1vh;
	border: 1px solid white;
	color: white;
	background-color: #346CF0;
	font-size: 2vh;
}

.titlemodal{
	width: 12vh;
	height: 4.2vh;
	border-radius: 5px;
	margin-top: 1vh;
	margin-right: 1vh;
	border: 1px solid white;
	color: white;
	background-color: #346CF0;
	font-size: 2vh;
}

.ajaxlogin{
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

.modal-dialog {
	top: 35%;
}

.modal-content {
	width: 100%;
	height: 45vh;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const modal = new bootstrap.Modal(document.getElementById('ajaxLoginModal'), {
      keyboard: false
    });

    const titleModalBtn = document.querySelector('.titlemodal');
    titleModalBtn.addEventListener('click', function () {
      modal.show();
    });
  });
  
$(function() {
	
	$("#btnloginok").click(function() {
		
		//아이디 비밀번호 읽기
		var id=$("#loginid").val();
		var pass=$("#loginpass").val();
		
		var root='${root}';
		//console.log("root"+root);
		
		$.ajax({
			
			type:"get",
			url: "${root}/member/login",
			dataType:"json",
			data:{"id":id,"pass":pass},
			success:function(res){
				
				if(res.result=='fail')
				{
					alert("아이디나 비밀번호가 맞지 않습니다");
				}
				
				else
				{
					location.reload();
				}
			}
		})
	})
	
	//로그아웃
	<!--
	$("#btnlogout").click(function() {
	
		var root='${root}';
		$.ajax({
		
			type:"get",
			url: "${root}/member/login",
			dataType:"html",
			success:function(){
				
				location.reload();
			}		
		})
	})
	-->
})
</script>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<div align="center" class="titlebox">

<div class="logo">
	<a href="/"><img alt="" src="${root }/image/logo.png"></a>
</div>

<div class="people">
	<a href="/"><img alt="" src="${root }/image/people.png"></a>
</div>

<div class="titlebutton" align="center">
	
	<c:if test="${sessionScope.loginok==null }">
		<br>
		<button type="button" class="titlelogin" onclick="location.href='/login/form'">Login</button>
		<button type="button" class="titlemodal" id="btnlogin">Ajax Login</button>
	</c:if>
	
	<c:if test="${sessionScope.loginok!=null }">
		${myname }님 환영합니다<br>
		<style>
		.titlebutton{
			border: 3px solid #346CF0;
		}
		</style>
		<button type="button" class="titlemyinfo" onclick="location.href='/member/myinfo'">내 정보</button>
		<button type="button" class="titlelogout" onclick="location.href='/login/logoutprocess'">Logout</button>
	</c:if>
	
	<!-- 모달이 나타날 부분 -->
	<div class="modal fade" id="ajaxLoginModal" tabindex="-1" role="dialog" aria-labelledby="ajaxLoginModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="ajaxLoginModalLabel">Login</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <!-- 모달 내용 -->
	        <div>
	        아이디<br><input type="text" class="form-control" id="loginid" style="width: 25vh; height: 5vh;"><br>
	        비밀번호<br><input type="password" class="form-control" id="loginpass" style="width: 25vh; height: 5vh;"><br>
	        <button type="button" class="ajaxlogin" id="btnloginok" onclick="location.href=''">로그인</button>
	        <button type="button" class="loginform_add"
					onclick="location.href='/member/form'">회원가입</button>
	        </div>
	        <!-- 여기에 로그인 폼 또는 해당 내용 추가 -->
	      </div>
	      <!-- 추가적인 모달 하단 버튼 등 -->
	    </div>
	  </div>
	</div>
</div>
</div>
</body>
</html>