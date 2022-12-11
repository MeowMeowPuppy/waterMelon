var addList = document.getElementById('addList');
var open_mv = document.getElementById('open_mv');
var albumImg = document.getElementById('albumImg');
var track_title = document.getElementById('track_title');
var artist_name = document.getElementById('artist_name');
var love = document.getElementById('love');
var loveBox = document.getElementById('loveBox');
var select_music_number = document.getElementById('select_music_number');
var select_music_loveChk = document.getElementById('select_music_loveChk');
var audio_list = document.getElementById('audio_list');
var playlist_body = document.getElementById('playlist_body');
var progress = document.getElementById('progress');
var player = document.getElementById('player');

// 조회수 증가 함수
function uphit(num){
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '../service/hitService.jsp');
	xhr.onreadystatechange = function() {
		if(xhr.readyState === 4 && xhr.status === 200){
			document.getElementById('hit_num' + num).innerHTML = xhr.responseText;
		}
	}
	data="";
	data += 'num=' + document.getElementById('add_play_button' + num).value;
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send(data);
}

function none_logined_play(fileName, title, artist, num){
	player.src = "../music/" + fileName + '.mp3';
	player.play();
	progress.value = 0;
	progress.max = 60;
	albumImg.src = "../img/" + fileName + ".jpg";
	track_title.innerHTML = title;
	track_title.title = title;
	artist_name.innerHTML = artist;
	artist_name.title = artist;
	select_music_number.value = num;
	setTimeout(()=>{
		player.pause();
		player.currentTime = 0;
		alert('10초 재생만 이용 가능합니다. 이용권 구매 후 이용해주세요')
	},10000);
	document.getElementById('max_time').innerHTML = "00:10";
}

// 메인 페이지에서 노래 틀어주는 기능
function playSong(fileName, title, artist, num) {
	var xhr = new XMLHttpRequest();
	player.src = "../music/" + fileName + ".mp3";
	player.play();
	progress.value = 0;
	progress.max = player.duration;
	albumImg.src = "../img/" + fileName + ".jpg";
	track_title.innerHTML = title;
	track_title.title = title;
	artist_name.innerHTML = artist;
	artist_name.title = artist;
	select_music_number.value = num;
	
	var love_checked = document.getElementById('love_checked_'+num);
	select_music_loveChk.value = love_checked.value;
	
	if(select_music_loveChk.value == "true"){
		love.classList = "fa-solid fa-heart";
	}else if (select_music_loveChk.value == "false"){
		love.classList = "fa-regular fa-heart";
	}
	progress.max = player.duration;
}

// 플레이리스트에 추가
function insertPlaylist(num, id){
	// 선택한 노래의 고유번호 플레이어에도 따로 저장 사용자에게는 출력x
	select_music_number.value = num;

	// 재생하고자 하는 노래가 플레이 리스트에 있는지 체크하고 없다면 플레이리스트에 추가 //사용자에게 보이지 않는 select 박스
	if (audio_list.contains(document.getElementById('play_list_number_' + select_music_number.value))==false) {
		audio_list.innerHTML += 
		"<option id='play_list_number_" + select_music_number.value + "'name='play_list_number_"+select_music_number.value+"' value='" + select_music_number.value+"'selected='selected'"+">"+select_music_number.value+"</option>"
	
		// 기존 플레이리스트의 노래들의 하이라이트 제거
		var tmp = document.querySelectorAll('.playlist_track_box_now');
			for(var i = 0; i<tmp.length;i++){
				var item = tmp.item(i);
				if(item!=null){
					item.className = "playlist_track_box";
				}
			}
			
		// 기존 플레이리스트의 재생되고 있더 노래의 플레이 모양 변경
		var tmp = document.querySelectorAll('.fa-solid.fa-pause');
			for(var i =0;i<tmp.length;i++){
				var item = tmp.item(i);
				if(item!=null){
					item.className = "fa-solid fa-play";
				}
			}
	
		// 실제로 플레이리스트 구역에 넣어주는 부분
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '../service/addPlaylistService.jsp');
		xhr.onreadystatechange = () => {
			if(xhr.readyState === 4 && xhr.status === 200){
				document.getElementById('playlist_body').innerHTML += xhr.responseText;
			}
		}
		data="";
		data += "num="+num
		data += "&id="+id;
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(data);
	} else {
		// 기존 플레이리스트의 노래들의 하이라이트 제거
		var tmp = document.querySelectorAll('.playlist_track_box_now');
			for(var i = 0; i<tmp.length;i++){
				var item = tmp.item(i);
				if(item!=null){
					item.className = "playlist_track_box";
				}
			}
		// 재생하고자 하는 노래에 하이라이트 추가
		var tmp = document.querySelector('#playlist_track_box_'+num);
		tmp.className = "playlist_track_box_now";
		
		// 기존 플레이리스트의 재생되고 있더 노래의 플레이 모양 변경
		var tmp = document.querySelectorAll('.fa-solid.fa-pause');
			for(var i =0;i<tmp.length;i++){
				var item = tmp.item(i);
				if(item!=null){
					item.className = "fa-solid fa-play";
				}
			}
	}
}


// 뮤비 팝업 열기
function openMv(num) {
	window.open('../service/mvService.jsp?num=' + num, '_blank', 'width=1000 height=610 top=200 left=200');
}

// 가사 팝업 열기
function openLyrics(num) {
	window.open('../service/lyricsService.jsp?num=' + num, '_blank', 'width=500 height=700 top=100 left=700')
}

document.getElementById('input').addEventListener('keypress',()=>{
	
})


// 개별구매 결제하기 창 window.open,close
function openClose(num){
	console.log(num);
	window.open('payPopup.jsp?num='+num,'_blank','height=724 width=645');
	window.close();
}
