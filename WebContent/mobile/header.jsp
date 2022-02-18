<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 String name = (String) session.getAttribute("name");
 String userid = (String) session.getAttribute("userid");
 String user_path = "";
 if(userid==null) {
	 name = "로그인";
	 user_path = "#panel1"; %>
<% } else { 
	 user_path = "#panel2";
} %>
<a href="index.jsp" id="home_btn">홈</a>

<a href="<%=user_path %>" data-role="button" data-inline="true" id="user_btn"><%=name %></a>

<!-- 로그인 패널 -->
<div data-role="panel" id="panel1" data-display="overlay" data-theme="b">
	<%
	String context = request.getContextPath();
	%>
	<form method="post" action="<%=context%>/servlet/login.do" data-ajax="false">
		<h1>로그인 패널</h1>
		<label>아이디 :</label> <input name="userid" id="userid" value=""	data-mini="true" data-clear-btn="true"> <br>
		<label>비밀번호 :</label> <input type="password" name="passwd" id="passwd" value="" data-mini="true" data-clear-btn="true"> <br>
		<span>
		 <input type="submit" value="로그인">
		 <input type="button" value="회원가입" data-ajax="false" onclick="location.href='signup.jsp'">
		</span>
	</form>
</div>

<!-- 마이페이지 패널 -->
<div data-role="panel" id="panel2" data-display="overlay" data-theme="b">
 <ul data-role="listview">  
  <li> <a href="mypage.jsp"><img alt="프로필 이미지" src="https://i.ytimg.com/vi/ElVkO2m92Gk/maxresdefault.jpg" width="80px" height="80px"> <h2><%=name %>님의 마이페이지</h2></a> <a href="<%=context%>/servlet/logout.do" data-ajax="false"><span class="ui-btn ui-shadow ui-corner-all ui-icon-delete ui-btn-icon-notext"></span></a></li>
  <li>  </li>
  <li> <a href="#">참여중인 모집</a></li>
  <li> <a href="#">과거 모집</a></li>
  <li> <a href="#">친구추가</a></li>
  <li> <a href="mypage.jsp">회원정보 수정</a></li>
 </ul>
</div>