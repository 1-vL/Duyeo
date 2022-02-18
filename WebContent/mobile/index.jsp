<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div data-role="page">
		<div data-role="header" data-position="fixed">
			<h1>두여 : 동호회 모임 사이트</h1>
			<jsp:include page="header.jsp"></jsp:include> <!-- 헤더영역 -->
		</div>
		<div data-role="content">
    	 <h2>모집 게시판</h2>
		 <div data-role="listview" style="margin:25px;">
           <ul data-role="listview" data-filter="true" data-filter-theme="a" data-divider-theme="b" id="double">
           
           <!--  -->
            <!-- 카드 시작 -->
            <li class='card enabled'>
             <a href="index.html"><img src="http://img.1300k.com/events/site/2021/08/210825_127757_pc.gif" width="80px" height="80px">
             <h2>모집글 제목</h2> <sub>by 작성자</sub>
             <span style="float: right; text-align: right; margin-left: 5%;">
             마감시간 : <br>
             게임 시작 시간 : <br>
             현재 모집인원 / 전체 모집인원</span>
              <span data-role="collapsible">
               <h4>간단설명 <span style="float: right;">게임 태그</span></h4>
		        <p>상세 설명</p>
			  </span>
             <sub><span class="ui-btn ui-shadow ui-corner-all ui-icon-heart ui-btn-icon-notext"></span>좋아요
             <span class="ui-btn ui-shadow ui-corner-all ui-icon-comment ui-btn-icon-notext"></span> 댓글</sub>
             </a><!-- 카드 끝 -->
            </li>
            <!-- 카드 시작 -->
            <li class='card enabled'>
             <a href="index.html"><img src="http://img.1300k.com/events/site/2021/08/210825_127757_pc.gif" width="80px" height="80px">
             <h2>모집글 제목</h2> <sub>by 작성자</sub>
             <span style="float: right; text-align: right; margin-left: 5%;">
             마감시간 : <br>
             게임 시작 시간 : <br>
             현재 모집인원 / 전체 모집인원</span>
              <span data-role="collapsible">
               <h4>간단설명 <span style="float: right;">게임 태그</span></h4>
		        <p>상세 설명</p>
			  </span>
             <sub><span class="ui-btn ui-shadow ui-corner-all ui-icon-heart ui-btn-icon-notext"></span>좋아요
             <span class="ui-btn ui-shadow ui-corner-all ui-icon-comment ui-btn-icon-notext"></span> 댓글</sub>
             </a><!-- 카드 끝 -->
            </li>
            <!-- 카드 시작 -->
            <li class='card enabled'>
             <a href="index.html"><img src="http://img.1300k.com/events/site/2021/08/210825_127757_pc.gif" width="80px" height="80px">
             <h2>모집글 제목</h2> <sub>by 작성자</sub>
             <span style="float: right; text-align: right; margin-left: 5%;">
             마감시간 : <br>
             게임 시작 시간 : <br>
             현재 모집인원 / 전체 모집인원</span>
              <span data-role="collapsible">
               <h4>간단설명 <span style="float: right;">게임 태그</span></h4>
		        <p>상세 설명</p>
			  </span>
             <sub><span class="ui-btn ui-shadow ui-corner-all ui-icon-heart ui-btn-icon-notext"></span>좋아요
             <span class="ui-btn ui-shadow ui-corner-all ui-icon-comment ui-btn-icon-notext"></span> 댓글</sub>
             </a><!-- 카드 끝 -->
            </li>
            <!--  -->
            
           </ul>
    	 </div>
		</div>
		<div data-role="footer">
			<h4>꼬리말(footer)영역</h4>
		</div>
	</div>
</body>
</html>