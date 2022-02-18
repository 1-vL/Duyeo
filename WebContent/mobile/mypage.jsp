<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="duyeo.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두여 : 동호회 모임 사이트</title>
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet" href="mobile.css" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="mobile.js?version=20211223"></script>
<%
Cookie[] cookies  =request.getCookies();
for (int i=0; i<cookies.length; i++) {
	if(cookies[i].getName() == "id") {
		String id = cookies[i].getValue();
	}
}
%>
</head>
<body>
	<div data-role="page">
		<div data-role="header" data-position="fixed">
			<h1>두여 : 동호회 모임 사이트</h1>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div data-role="content">
    	 <h2>My Page</h2>
		 <div data-role="listview" style="margin:25px;">
		 아이디 : <input id="id" name="id" value="<%= %>"> <br>
		 비밀번호 : <input id="pwd" name="pwd"> <br>
		 아이디 : <input id="id" name="id"> <br>
		 비밀번호 : <input id="pwd" name="pwd"> <br>
		 아이디 : <input id="id" name="id"> <br>
		 비밀번호 : <input id="pwd" name="pwd"> <br>
		 
    	 </div>
		</div>
		<div data-role="footer">
			<h4>꼬리말(footer)영역</h4>
		</div>
	</div>
</body>
</html>