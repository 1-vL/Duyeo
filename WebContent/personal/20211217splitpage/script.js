/**
 * 
 */
setInterval(countdownClock,1000);
var searchResult = document.getElementById("searchResult");
function test() {
	alert("작동");	
}


//분할 영역 파일 분할 불러오기
function loadHTML(file)
{
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", file, false);
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200 || rawFile.status == 0)
            {
                var allText = rawFile.responseText;
                document.write(allText);
            }
        }
    }
    rawFile.send(null);
}

function countdownClock() { // 시계 업데이트
	var date = new Date();
	var hours = document.getElementById("hours");
	var minutes = document.getElementById("minutes");
	var seconds = document.getElementById("seconds");
	var h = date.getHours();
	var m = date.getMinutes();
	var s = date.getSeconds();
	var hh = h < 10 ? "0"+h : h;
	var mm = m < 10 ? "0"+m : m;
	var ss = s < 10 ? "0"+s : s;
	hours.innerHTML = hh;
	minutes.innerHTML = mm;
	seconds.innerHTML = ss;
} // end 시계 업데이트
function searchby() {//게시글 태그(체크 가능)으로 검색하기
	test();
} //end 게시글 태그(체크 가능)으로 검색하기

function slider() {//인원수 슬라이더 검색
	test();
} //end 인원수 슬라이더 검색

function search() {	//검색바 검색 함수
	 let keyword = $("#searchbox").val();
	 let jsonData = {"keyword":keyword}; //json타입으로 데이터 처리
	 $.ajax({
		type : "post",
		url : "search.jsp",
		data : jsonData,
		success : function(data){
			$("#searchResult").html(data);
			$("#maintitle").text("검색 결과");
		}
	 });
} //end 검색바 검색 함수
//카드 펼치기 / 접기
	var minheight = "360px";
function cardOpen(card) {	var contentheight = card.parent('div.cardContent').outerHeight();
	var thisCard = card.parent('div.cardContent').parent('div.card');
	var titleheight = thisCard.children('h3').outerHeight();
	if(thisCard.css("height") == minheight) {
		thisCard.css("height", titleheight+contentheight+80);
		thisCard.css("box-shadow", "5px 5px 5px #c0c0c0");
	}	
}
function cardClose(card) {
	var thisCard = card.parent('div.cardContent').parent('div.card');
	thisCard.css("height", minheight);
	thisCard.css("box-shadow", "");		
} 
//end 카드 펼치기 / 접기	

//리스트뷰/그리드뷰 보기방식 전환 버튼
function viewChange() {
	if ($("#reviewlist").attr("class")=="listview") {
		$("#reviewlist").attr("class", "gridview");
	} else {
		$("#reviewlist").attr("class", "listview");
	}
}

//게시글 작성 시 썸네일 이미지 변경 버튼
function imgChange() {
	var newLink = $("#newImg").val();
	$("#thumbImg").attr("src", newLink);
}

function cardFunc() {
	// 새로 생성된 카드도 펼치기 / 접기 가능하게 하기 
			$(".cardDesc").click(function(){//카드형 게시글 펼치기
				cardOpen($(this));
			});//end 카드형 게시글 펼치기	
			$(".foldCard").click(function(){//카드형 게시글 접기
				cardClose($(this));
			});	//end 카드형 게시글 접기
}

function loadCard(){		
	// JSON 데이터 불러와서 카드 게시글 띄우기
		var date = new Date();
        $.getJSON('boardData.json',function(data){
            console.log('success');
            $.each(data.posts,function(i, post){
            	/* json 파일 데이터 불러오기 */
      
            	var cardInfo = "<div class='card enabled'><div class='cardInfo'><span class='timeLeft'>";
				var now = date.getTime();
				var end = new Date(parseInt(post.end));
				var left = Math.floor((parseInt(post.end) - now) / 1000 / 60 / 60);
				if (left <= - 24) {
					cardInfo = "<div class='card disabled'><div class='cardInfo'><span class='timeLeft'>" + end.toLocaleDateString() + " 마감됨";
					/*alert(now);*/
				} else if(left < 0) {
					cardInfo = "<div class='card disabled'><div class='cardInfo'><span class='timeLeft'>" + left + "시간 전 마감됨";
				} else if(left> 23) {
					cardInfo += end.toLocaleDateString() + " 마감";
									
				} else {
            		cardInfo +=  left + "시간 남음";//남은 시간
				}
            	cardInfo += "</span><span class='ui-icon ui-icon-heart'></span><span class='liked'>좋아요 ";
            	cardInfo += post.liked;//좋아요
            	cardInfo += "</span><span class='ui-icon ui-icon-comment'></span><span class='comments'>댓글 ";
                cardInfo += post.comments;//댓글      	
                cardInfo += "</span></div><h3 class='cardName'>";
				cardInfo += "<a href='"+ post.link +"'>";
                cardInfo += post.title + "</a>";//게시글 제목
                cardInfo += "<sub class='author'> by ";
                cardInfo += post.author;//작성자
                cardInfo += "</sub></h3><div class='cardContent'><div class='cardTags'><img class='cardThumb' src='";
                cardInfo += post.img;//이미지 링크
                cardInfo += "' width='50%' height=width><br>";
				var tags = post.tag.split(',');
      				for ( var t in tags ) {
        				 cardInfo += "<a>" + tags[t] + "</a>";
      				}
                cardInfo += " </div><hr><div class='cardDesc'>게임이름 : ";
                cardInfo += post.gameName;//게임 이름
                cardInfo += "<br>모집인원 : ";
                cardInfo += post.entered + "/" + post.max + "명 <br>";//모집인원
                cardInfo += post.desc + " </div> <br>"	;//게임소개
                cardInfo += "<button type='button' class='foldCard'>접기</button></div></div>";        	
                $("#double").prepend(cardInfo);
				cardFunc();
		});
        });
}

	loadCard();

/*jQuery*/

$(function(){
	$(".stylebutton").click(function() {//다크모드/라이트모드
	   if ($("#stylebutton").val()=="다크모드") {
		$(".card.enabled").css({
			"color" : "white",
			"background-color" : "var(--color-primary)",
		});
		$("body").css("background-color", "var(--color-primary)");
		$("#double").css("backgroundColor","gray");
		$("header").css("backgroundColor","#175782");
		$("footer").css("color", "orange");
		$("#stylebutton").val("라이트모드");
		$("#styleside").attr("src", "https://cdn4.iconfinder.com/data/icons/landscape-26/100/Day-512.png");
	   } else if ($("#stylebutton").val()=="라이트모드") {
		$(".card.enabled").css({
			"color" : "black",
			"background-color" : "white",
		});
		$("body").css("background-color", "white");
		$("#double").css("backgroundColor","rgba(0, 0, 0, 0.1)");
		$("header").css("backgroundColor","#3498db");
		$("footer").css("color", "black");
		$("#stylebutton").val("다크모드");
		$("#styleside").attr("src", "https://cdn4.iconfinder.com/data/icons/landscape-26/100/Night_mountain-512.png");
	   }
	});//end 다크모드
	
	
	$(".cardDesc").click(function(){//카드형 게시글 펼치기
	cardOpen($(this));
	});//end 카드형 게시글 펼치기	
	$(".foldCard").click(function(){//카드형 게시글 접기
	cardClose($(this));
	});	//end 카드형 게시글 접기
	$(".write").click(function(){//카드 게시글 추가(샘플데이터)
		$("#double").prepend("<div class='card enabled'><div class='cardInfo'><span class='timeLeft'>1시간 남음</span><span class='ui-icon ui-icon-heart'></span><span class='liked'>좋아요 1</span><span class='ui-icon ui-icon-comment'></span><span class='comments'>댓글 10</span></div><h3 class='cardName'><a href='sampleArticle.html'>카드게임</a> <sub class='author'>by 작성자</sub></h3><div class='cardContent'><div class='cardTags'><img class='cardThumb' src='http://img.1300k.com/events/site/2021/08/210825_127757_pc.gif' width='50%' height=width><br><a>#태그</a>,&nbsp;<a>#태그</a>,&nbsp;<a>#태그</a>,&nbsp;<a>#태그</a>,&nbsp;<a>#태그</a> </div><hr><div class='cardDesc'>게임이름 : 카드게임 <br>모집인원 : 1 / 4명 <br>설명여부 : O <br>(설명 약 10분 정도 소요) <br> <br>게임소개 : 귀여운(?) 촌충을 테마로 한 밴디도와 유사한 공간활용 카드 놓기 게임으로, 가장 먼저 손패를 다 턴 플레이어가 승리하는 경쟁게임입니다. <br> <br>게임장르 : 공간활용 <br>초보참가 : O 초보자, 게임 배워보실 분들도 환영합니다. <br>게임시간 : 15분-30분 <br>난이도: 1 / 5 <br></div><br><button type='button' class='foldCard'>접기</button></div></div>");
			cardFunc();
		if($('.card').length>16) {//범위 초과한 카드 게시글 HTML 뷰에서 삭제
				$('.card').eq(16).remove();
		}
	}); // end 카드 게시글 추가
	$("#searchbutton").click(function() {// ajax 검색결과
	search();
	});//end ajax 검색결과
	$(".search").on('keypress',function(e) {// 엔터 키로 ajax 검색
    if(e.which == 13) {
		search();
    }
	});//end 엔터 키로 ajax 검색
	//json 작성 완료
});// jQuery 종료