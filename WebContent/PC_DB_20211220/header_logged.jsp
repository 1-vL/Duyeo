<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 모든 페이지에 동일하게 적용되는 헤더영역입니다. -->
<nav id="navid" class="navclass"> <!-- 상단 네비게이션 바 -->
 <ul id="mainnav" class="navclass"> <!-- 메뉴 바 -->
  <li><a href="#">참여중인 모집</a>
   <ul id="subnav1" class="subnav">
    <li><a href="#">동적 추가(예정, 미구현)</a></li>
    <li><a href="#">계정 연동(예정, 미구현)</a></li>
    <li><a href="#">시간 만료(예정, 미구현)</a></li>
   </ul>
  </li>
  <li><a href="index.html">모집 참여</a>
   <ul id="subnav1" class="subnav">
    <!-- <li><a href="index.html">전체</a></li>
    <li><a href="#">파티(향후 태그 검색 추가 예정)</a></li>
    <li><a href="#">전략(전체와 동일한 레이아웃)</a></li> -->
   </ul>
   </li>
  <li><a href="notice.html">안내</a>
   <ul id="subnav1" class="subnav">
    <li><a href="notice.html">공지사항</a></li>
    <li><a href="tip.html">꿀팁</a></li>
   </ul>
   </li>
  <li><a href="review.html">커뮤니티</a>
   <ul id="subnav1" class="subnav">
    <li><a href="review.html">후기</a></li>
    <li><a href="video.html">영상</a></li>
    <li><a href="gallery.html">갤러리</a></li>
   </ul>
   </li>
 </ul>
<%
String context = request.getContextPath();
%>
 
 <form method="post" action="<%=context %>/servlet/login.do" class="login_menu"> <!-- 우상단 로그인 메뉴 -->
  <img src="https://cdn4.iconfinder.com/data/icons/landscape-26/100/Night_mountain-512.png" width="24" height="24" id="styleside" class="stylebutton" style="cursor:pointer">
  <input type="button" id="stylebutton" class="stylebutton" name="dark" value="다크모드" style="cursor:pointer">  
  <script type="text/javascript">
  <%
   if(session.getAttribute("userid") == null) { %>
		alert("로그인 X");
  <%} else { %>

	alert("로그인 " + <%= session.getAttribute("userid") %>);
  <%} %>
  </script>
		  <input type="text" id="signinId" name="userid" placeholder="ID"> <!-- 로그인 ID -->
		  <input type="password" id="signinPwd" name="passwd" placeholder="비밀번호"> <!-- 로그인 PWD -->
		  <input type="submit" id="signin" class="signbutton" name="signin" value="로그인">
		  <a href="signup.html"><input type="button" id="signup" class="signbutton" name="signup" value="회원가입" style="cursor:pointer"></a>
 </form>
 
 <!-- 로그인 실패, 로그아웃 할 때 메세지를 출력 -->
<%
 String message=request.getParameter("message");
 if(message != null) {%>
	<span style="color: red;"><%=message %></span>
 <% } %>
 
 <div class="search"> 
  <input type="text" id="searchbox" class="search" name="keyword"> <!-- 검색 도구 -->
  <input type="image" id="searchbutton" class="search" src="https://cdn0.iconfinder.com/data/icons/very-basic-2-android-l-lollipop-icon-pack/24/search-512.png">
 </div>
 </nav>
<header id="headerid" class="headerclass"> <!-- 전체 제목 -->
<div id="clock" class="navclass" style="font-family: 'LED Digital 7';"> <!-- 디지털 시계 -->
 <span id="hours"></span><span>:</span><span id="minutes"></span><span>:</span><span id="seconds"></span>
</div>
 <h1>
  <span class="highlighted" style="color: orange;">두</span>
  <span class="highlighted" style="color: orange;">여</span>
  <span>에</span>
  <span>서</span>
  &nbsp;
  <span>모</span>
  <span class="highlighted" style="color: orange;">두</span>
  <span>모</span>
  <span class="highlighted" style="color: orange;">여</span>
</h1>
</header>