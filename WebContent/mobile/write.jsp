<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두여 : 동호회 모임 사이트</title>
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
	<div data-role="page">
		<div data-role="header">
			<h1>두여 : 동호회 모임 사이트</h1>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div data-role="content">
			<form>
				<ul data-role="listview" data-inset="true">
					<li class="ui-field-contain"><label for="name2">모집글 제목:</label> <input type="text" name="name2" id="name2" value=""
						data-clear-btn="true"></li>
					<li class="ui-field-contain"><label for="textarea2">본문:</label>
						<textarea cols="40" rows="20" name="textarea2" id="textarea2"></textarea>
					</li>
					<li class="ui-field-contain"><label for="flip2">자동마감:</label> <select name="flip2" id="flip2" data-role="slider">
							<option value="off">Off</option>
							<option value="on">On</option>
					</select></li>
					<li class="ui-field-contain" data-role="rangeslider">
			         <label for="range-6a" class="ui-hidden-accessible">모집인원:</label>
        	 		 <label for="range-6b">모집인원:</label>
			         <input type="range" name="range-6a" id="range-6a" min="0" max="11" value="2" width="55px">
		     	     <input type="range" name="range-6b" id="range-6b" min="0" max="11" value="4" width="55px">
					</li>
					<li class="ui-field-contain"><label for="select-choice-1"
						class="select">마감시간을 설정하세요:</label> <select
						name="select-choice-1" id="select-choice-1">
							<option value="24">1일</option>
							<option value="4" selected>4시간</option>
							<option value="2">2시간</option>
							<option value="1">1시간</option>
					</select></li>
					<li class="ui-body ui-body-b">
						<fieldset class="ui-grid-a">
							<div class="ui-block-a">
								<button type="submit" class="ui-btn ui-corner-all ui-btn-a">취소</button>
							</div>
							<div class="ui-block-b">
								<button type="submit" class="ui-btn ui-corner-all ui-btn-a">작성</button>
							</div>
						</fieldset>
					</li>
				</ul>
			</form>
		</div>
		<div data-role="footer" data-position="fixed">
			<h4>꼬리말(footer)영역</h4>
		</div>
	</div>
</body>
</html>