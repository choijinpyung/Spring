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
<body>
<h3>ex4 예제</h3>
<br>
<h4>메뉴명을 입력 후 엔터를 누르세요</h4>
<input type="text" id="search" class="form-control" style="width: 150px;"><button type="button" id="btn4">엔터</button>
<br><br>
<h2 id="fname"></h2>
<img alt="" src="" id="photo">
<script type="text/javascript">
    $("#btn4").click(function() {
        var searchvalue = $("#search").val();

        $.ajax({
            type: "get",
            dataType: "json",
            url: "list4",
            data: { "name": searchvalue },
            success: function(res) {
                
                    $("#fname").text(res.name);
                    $("#photo").attr("src", "image/" + res.photo).css("width", "500px");               
            }
        });
    });
</script>
</body>
</html>