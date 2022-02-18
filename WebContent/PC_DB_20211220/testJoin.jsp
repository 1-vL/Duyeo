<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(function(){
	list();
	$("#btnSave").click(function(){
		insert();
	});
});

function insert() {
	var param="userid="+$("#userid").val()+"&passwd="+$("#passwd").val()+"&name="+$("#name").val()+"&email="+$("#email").val()+"&hp="+$("#hp").val();
	$.ajax({
		type: "post",
		url: "/portfolio/servlet/join.do",
		data: param,
		success: function() {
			list(); //회원목록 갱신
			//입력 필드 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
		}
	});
}

function list() {
	$.ajax({
		type: "post",
		url: "/portfolio/servlet/list.do",
		success: function(result){
			console.log(result);
			$("#memberList").html(result);
		}
	});
}

</script>
</head>
<body>
 <h2>회원가입(Bcrypt)</h2>
 아이디 : <input id="userid">
 비번 : <input type="password" id="passwd"> <br>
 이름 : <input id="name">
 이메일 : <input id="email"> <br>
 핸드폰 : <input id="hp">
 <button type="button" id="btnSave">회원가입</button>
 <div id="memberList"></div> 

</body>
</html>