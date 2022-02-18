<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<script type="text/javascript">
function searchTime(period) {
	var date = new Date();
	var now = date.getTime();
	var start = document.getElementById("startTime");
	var end = document.getElementById("endTime");
	alert(now-3600000); // 1시간 제거
	var startNum = Integer.parseInt(nvl(start, now));
	var endNum = Integer.parseInt(nvl(end, startNum+1));
	var result;
}
function advancedSearch() {
	if(startNum>endNum) {
		result = "시간을 정확히 입력해 주세요!";
		alert(result);
	}
}
function nvl(a, b) {
	if(a==null) {
	   return b;
	}		   
	   return a;
}



</script>
<style type="text/css">
button, input {
	background-color: transparent;
	color: #cb7474;
	font-size: 20px;
	cursor: pointer;	
}
button {
	border: none;
}
input {
	border: 0.5px solid #cb7474;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
out.println("<h1>'" + keyword + "'에 대한 검색 결과가 존재하지 않습니다." + "</h1> <br>");
%>
검색어 : <input type="search" value=<%=keyword%>> <br>
태그 : <input type="text"> <br>
기준시간 : <input type="time"> <br>
1시간 : <button onclick="searchTime()">1시간</button> <br>
시작시간 : <input id="startTime" type="datetime-local"> <br>
종료시간 : <input id="endTime" type="datetime-local"> <br>
최대 인원수 : <input id="maxpeople" type="range" step="1" min="2" max="11" value="4" onchange="getElementById('people').value=(this).value">
<input id="people" type="text" value="4" onchange="getElementById('maxpeople').value=(this).value"> <br>
<button onclick="advancedSearch()">고급검색</button>
</body>
</html>