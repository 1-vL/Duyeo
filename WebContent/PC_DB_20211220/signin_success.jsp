<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session_success</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<%@ include file="../include/session_check.jsp" %>
<% String context=request.getContextPath(); %>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="<%=context %>/servlet/logout.do";
	});
});
</script>
</head>
<body>
 <h2><%=session.getAttribute("message") %></h2>
 접속중인 아이디는 <%=session.getAttribute("userid") %>입니다.
 <button type="button" id="btnLogout">로그아웃</button>
</body>
</html>