function test() {
	alert("작동");	
}
function loadCard(){		
	// JSON 데이터 불러와서 카드 게시글 띄우기
		var date = new Date();
        $.getJSON('boardData.json',function(data){
			$("#double").html(data).trigger('create');
            console.log('success');
            $.each(data.posts,function(i, post){
            	/* json 파일 데이터 불러오기 */
				var now = date.getTime();
      			var end = new Date(parseInt(post.end));
				var left = Math.floor((parseInt(post.end) - now) / 1000 / 60 / 60);
				if(left < 0) {
				  var cardInfo = "<li class='card disabled'>";
				} else {
				  var cardInfo = "<li class='card enabled'>";					
				}
				cardInfo += "<a href='"+ post.link +"'><img src='" + post.img + "' width='80px' height='80px'>";//게시글 링크, 이미지 링크 추가
                cardInfo += "<h2>" + post.title + "</h2> <sub> by " + post.author + "</sub>";//게시글 제목 + 작성자
                cardInfo += "<span style='float: right; text-align: right; margin-left: 5%;'> ";//마감
				if (left <= - 24) {
					cardInfo = end.toLocaleDateString() + " 마감됨";
					/*alert(now);*/
				} else if(left < 0) {
					cardInfo = left + "시간 전 마감됨";
				} else if(left> 23) {
					cardInfo += end.toLocaleDateString() + " 마감";
				} else {
            		cardInfo += left + "시간 남음";//남은 시간
				}				
                cardInfo += "<br>"+ post.entered + " / " + post.max + "명</span>";//인원수		  

                cardInfo += "<span data-role='collapsible' class='ui-collapsible ui-collapsible-inset ui-corner-all ui-collapsible-themed-content ui-collapsible-collapsed'><h4 class='ui-collapsible-heading ui-collapsible-heading-collapsed'><a href='#' class='ui-collapsible-heading-toggle ui-btn ui-icon-plus'>" + post.gameName + "<span style='float: right;'>" + post.tag + "</span>"; //게임 이름(간단설명)				
				cardInfo += "<p>" + post.desc + "</p></h4></a></span></a>";//태그, 상세설명
				
                cardInfo += "<sub><span class='ui-btn ui-shadow ui-corner-all ui-icon-heart ui-btn-icon-notext'></span>&nbsp;" + post.liked + "&nbsp;&nbsp;&nbsp;";//좋아요
                cardInfo += "<span class='ui-btn ui-shadow ui-corner-all ui-icon-comment ui-btn-icon-notext'></span>&nbsp;" + post.comments + "</sub>";//댓글
                cardInfo += "</a></li>";//마감

                $("#double").prepend(cardInfo);//생성
				$('#double').listview('refresh');

		});
        });
}
loadCard();
