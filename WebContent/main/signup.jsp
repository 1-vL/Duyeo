<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#signupform { 
  max-width:420px; 
  margin:50px auto 30px;
  padding: 20px
}
.signup-input {
  font-weight: 500;
  font-size: 18px;
  border-radius: 0;
  line-height: 22px;
  background-color: transparent;
  border: 2px solid #2980b9;
  transition: all 0.3s;
  padding: 13px;
  margin-bottom: 15px;
  width: 100%;
  box-sizing: border-box;
  outline: 0;
}

.signup-input:focus { 
  border: 2px solid #2ecc71; 
}
.submit-btn {
  width: 100%;
  background: #2980b9;
  border-radius: 0;
  border: 0;
  cursor: pointer;
  font-size: 24px;
  padding-top: 10px;
  padding-bottom: 10px;
  transition: all 0.3s;
  margin-top: -4px;
  font-weight: 100;
}

.back-btn {
  width: 100%;
  background: #2ecc71;
  border-radius: 0;
  border: 0;
  cursor: pointer;
  font-size: 24px;
  padding-top: 10px;
  padding-bottom: 10px;
  transition: all 0.3s;
  margin-top: 10px;
  font-weight: 100;
}
.submit-btn:hover { 
  background:#3498db;
}

.submit-signup {
  font-size: 30px;
  text-align: center;
  display: none;
}
</style>
<script type="text/javascript">
function check() {
	
	var userid = document.getElementById("userid");
	if (userid.value == ""){
		userid.style.border = "2px solid red";
		userid.focus();
		return;
	}
	
	var exp1 = /^[A-Za-z0-9]{4,10}$/;
	if(!exp1.test(userid.value)){
		userid.style.border = "2px solid red";
		userid.focus();
		return;
	} else {
		userid.style.border = "2px solid #2ecc71";	
	}
	
	//비밀번호 체크
	var pwd = document.getElementById("pwd");
	if (pwd.value == ""){
		pwd.style.border = "2px solid red";
		pwd.focus();
		return;
	}
	var exp2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*\d).{8,12}/;
	//적어도 소문자 하나, 대문자 하나, 특수문자 하나, 숫자 하나가 포함되어있는 8~12개 사이의 문자열
	//match(정규표현식)은 규칙에 맞는 부분을 찾아 배열로 반환하며, 대응되는 문자열을 못했다면
	//null을 반환한다.
	if(!exp2.test(pwd.value)){
		pwd.style.border = "2px solid red";
		pwd.focus();
		return;
	} else {
		pwd.style.border = "2px solid #2ecc71";	
	}
	
	
	//이름 체크
	var name = document.getElementById("name");
	if (name.value == ""){
		name.style.border = "2px solid red";
		name.focus();
		return;
	}
	var exp3 = /^[가-힣]+$/;
	if (!exp3.test(name.value)) {
		name.style.border = "2px solid red";
		name.focus();
		return;
	} else {
		name.style.border = "2px solid #2ecc71";	
	}
	
	var email = document.getElementById("email");
	//{2,} 2글자 이상
	var exp4 = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	if (!exp4.test(email.value)) {
		email.style.border = "2px solid red";
		email.focus();
		return;
	} else {
		email.style.border = "2px solid #2ecc71";	
	}
	
	var phone = document.getElementById("phone");
	var exp5 = /^[0-9]+$/;
	if (!exp5.test(phone.value)) {
		phone.style.border = "2px solid red";
		phone.focus();
		return;
	} else {
		phone.style.border = "2px solid #2ecc71";	
	}
}
</script>
</head>
<%
String context = request.getContextPath();
%>
<form id="signupform">
  <input id="userid" name="userid" type="text" class="signup-input" placeholder="아이디" onchange="check()">
  <input id="pwd" name="pwd" type="password" class="signup-input" placeholder="비밀번호" onchange="check()">
  <sup>영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두 포함하는 8~12자</sup> <br>
  <input id="name" name="name" type="text" class="signup-input" placeholder="이름" onchange="check()">    
  <input id="email" name="email" type="text" class="signup-input" placeholder="Email" onchange="check()"> 
  <input id="phone" name="phone" type="text" class="signup-input" placeholder="(숫자만 입력하세요)" onchange="check()">
  <button type="button" class="submit-btn" onclick="location.href='<%=context %>/servlet/join.do';">제출</button> <br>
  <button type="button" class="back-btn" onclick="window.location=document.referrer">뒤로가기</button>  
</form>