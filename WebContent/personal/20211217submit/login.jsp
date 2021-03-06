<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="ko-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>두여 : 동호회 모임 사이트 - 로그인</title>
<link href="mainStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="script.js?version=20211208"></script>
<!-- 임포트 -->
</head>
<body id="body"> <!-- 본문영역 -->
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
    <li><a href="index.html">전체</a></li>
    <li><a href="#">파티</a></li>
    <li><a href="#">전략</a></li>
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
    <li><a href="#">영상</a></li>
    <li><a href="#">정기 모임</a></li>
    <li><a href="#">외부 링크</a></li>
   </ul>
   </li>
 </ul>
 <form action="login.jsp" method="post" target="loginframe" class="login_menu"> <!-- 우상단 로그인 메뉴 -->
  <img src="https://cdn4.iconfinder.com/data/icons/landscape-26/100/Night_mountain-512.png" width="24" height="24" id="styleside" class="stylebutton" style="cursor:pointer">
  <input type="button" id="stylebutton" class="stylebutton" name="dark" value="다크모드" style="cursor:pointer">
  <input type="button" id="signin" class="signbutton" name="signin" value="로그인" onclick="test()">
  <a href="signup.html"><input type="button" id="signup" class="signbutton" name="signup" value="회원가입" style="cursor:pointer"></a>
 </form>
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
  <span>두</span>
  <span>여</span>
  <span>에</span>
  <span>서</span>
  &nbsp;
  <span>모</span>
  <span>두</span>
  <span>모</span>
  <span>여</span>
</h1>
</header>
<main id="mainid" class="mainclass"> <!-- 메인 바디 영역 -->
<h1 id="maintitle" class="title">로그인</h1> <!-- 메인 제목 --> 
 <br>
 <div id="searchResult"></div> <!-- 검색결과창 -->
 <!-- 로그인 폼 -->
 
 
</main>
<aside id="asideid" class="asideclass" style="cursor:pointer;" onclick="window.scrollTo(0,0);"> <!-- 최상단 이동 플로팅 메뉴 -->   
   <img alt="상단이동" src="https://cdn4.iconfinder.com/data/icons/basic-user-interface-elements/700/up-top-arrow-512.png" width="24" height="24">
</aside>

<footer id="footerid" class="footerclass"> <!-- 정보 제공용 푸터 -->
 <h3>한준수</h3>
 <a href="https://github.com/1-vL" target="_blink">Github: <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/></svg> 1-vL</a> <br>
 다른거 : <br>
  
 
</footer>

</body>
</html>