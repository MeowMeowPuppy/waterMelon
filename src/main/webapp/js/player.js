let play_button = document.getElementById('play_button');
let currentTime = document.getElementById('current_time');
let maxTime = document.getElementById('max_time');
let forward = document.getElementById('forward')
let back = document.getElementById('back')
let volume = document.getElementById('volume');
var volicon = document.getElementById('volume_icon');
var volume_box = document.getElementById('volume_box');
var plOpen = document.getElementById('list_icon')
var plClose = document.getElementById('playList_close');
var plBox = document.getElementById('playList_box');
var love = document.getElementById('love');
var select_music_loveChk = document.getElementById('select_music_loveChk');
var select_music_number = document.getElementById('select_music_number');
var player = document.getElementById('player');
var progress = document.getElementById('progress');
var audio_list = document.getElementById('audio_list');
var playlist_body = document.getElementById('playlist_body');
var albumImg = document.getElementById('albumImg');
var track_title = document.getElementById('track_title');
var artist_name = document.getElementById('artist_name');

volume.value = 100;

plBox.style.display = 'none';
volume_box.style.display = 'none';

var checkVol = 1;

var volCon = function() {
	if (volume_box.style.display == 'none') {
		volume_box.style.display = 'block'
	} else {
		volume_box.style.display = 'none'
	}
}

volicon.addEventListener("click", volCon)
volicon.addEventListener('dragend',volCon)

progress.value = 0;

volume.addEventListener("change", () => {
	player.volume = (volume.value / 100);
	console.log(player.volume);
	if (volume.value == 0) {
		volicon.className = "fa-solid fa-volume-off"
	} else if(volume.value<=50){
		volicon.className = "fa-solid fa-volume-low"
	} else if(volume.value>50){
		volicon.className = "fa-solid fa-volume-high"
	}
})

plClose.addEventListener("click", () => {
	plBox.style.display = 'none';
})

plOpen.addEventListener("click", () => {
	if (plBox.style.display == 'none') {
		plBox.style.display = 'block';
	} else {
		plBox.style.display = 'none';
	}
})


var playpause = function() {
	if (player.paused) {
		player.play();
	} else {
		player.pause();
	}
}

play_button.addEventListener("click", playpause)

player.onplay = function() {
	play_button.classList.remove("fa-play")
	play_button.classList.add("fa-pause")
	var pl_play_button = document.getElementById("playlist_play_" + select_music_number.value);
	if (pl_play_button != null) {
		pl_play_button.innerHTML = "<i class='fa-solid fa-pause' id='playlist_play_button'></i>"
	}
	progress.max = player.duration;
}

player.onpause = function() {
	play_button.classList.remove("fa-pause")
	play_button.classList.add("fa-play")
	var pl_play_button = document.getElementById("playlist_play_" + select_music_number.value);
	if (pl_play_button != null) {
		pl_play_button.innerHTML = "<i class='fa-solid fa-play' id='playlist_play_button'></i>"
	}
}

player.ontimeupdate = function() {
	let ct = player.currentTime;
	let mt = player.duration;
	maxTime.innerHTML = maxFormat(mt);
	currentTime.innerHTML = timeFormat(ct);
	progress.value = player.currentTime;

	let duration = player.duration;
	prog = Math.floor((ct * 100) / duration);
}

function timeFormat(ct) {
	minutes = Math.floor(ct / 60);
	seconds = Math.floor(ct % 60);

	if (minutes < 10) {
		minutes = "0" + minutes;
	}

	if (seconds < 10) {
		seconds = "0" + seconds;
	}
	return minutes + ":" + seconds;
}

function maxFormat(mt) {
	minutes = Math.floor(mt / 60);
	seconds = Math.floor(mt % 60); // mt=8초일때에 seconds는 8

	if (minutes < 10) {
		minutes = "0" + minutes;
	}

	if (seconds < 10) { // seconds가 10보다 작으므로
		seconds = "0" + seconds;  // second는 08
	}
	return minutes + ":" + seconds; // 0:27
}

progress.addEventListener('change', () => {
	player.currentTime = progress.value;
	let mt = player.duration;
	maxTime.innerHTML = maxFormat(mt);
	progress.max = player.duration;
})


forward.addEventListener("click", () => {
	player.currentTime = player.currentTime + 5;
	progress.value = player.currentTime;
})

back.addEventListener("click", () => {
	player.currentTime = player.currentTime - 5;
	progress.value = player.currentTime;
})

//addLove 함수 시작
function addLove(id) {
	var xhr = new XMLHttpRequest();
	var love_count = document.getElementById('love_count_' + select_music_number.value);
	var playlist_track_chk = document.getElementById('playlist_track_chk_' + select_music_number.value);
	// 로그인 했는지 체크
	if (id == "null" || id == "") {
		alert('로그인 후 이용하세요')
		return;
	}

	// 좋아요 하지 않은 노래일때 하트 체워주기, 좋아요 목록에 넣어주기, 차트에서도 true로 변경
	if (select_music_loveChk.value == "false") {
		xhr.open('POST', '../service/loveService.jsp');
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4 && xhr.status === 200) {
				love_count.innerHTML = xhr.responseText;
			}
		}
		var data = "";
		data += "chk=" + select_music_loveChk.value;
		data += "&num=" + select_music_number.value;
		data += "&id=" + id;
		love.classList = "fa-solid fa-heart";
		select_music_loveChk.value = "true";
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(data);

		var love_checked = document.getElementById('love_checked_' + select_music_number.value);
		love_checked.value = true;
		select_music_loveChk.value = "true";
		playlist_track_chk.value = "true";
		return;
	}

	// 좋아요 한 노래일때 하트 비워주기, 좋아요 목록에서 빼주기
	if (select_music_loveChk.value == "true") {
		xhr.open('POST', '../service/loveService.jsp');
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4 && xhr.status === 200) {
				love_count.innerHTML = xhr.responseText;
			}
		}
		var data = "";
		data += "chk=" + select_music_loveChk.value;
		data += "&num=" + select_music_number.value;
		data += "&id=" + id;
		love.classList = "fa-regular fa-heart";
		select_music_loveChk.value = "false";
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(data);

		var love_checked = document.getElementById('love_checked_' + select_music_number.value);
		love_checked.value = false;
		select_music_loveChk.value = "false";
		playlist_track_chk.value = "false";
		return;
	}
}
//addLove() 함수 끝

// 플레이리스트에 있는 플레이 버튼.
function playlist_play(num) {
	var pl_number = document.getElementById('playlist_track_number_' + num);
	var pl_fileName = document.getElementById('playlist_track_fileName_' + num);
	var pl_title = document.getElementById('playlist_track_title_' + num);
	var pl_artist = document.getElementById('playlist_track_artist_' + num);
	var pl_chk = document.getElementById('playlist_track_chk_' + num);


	// 만약 현재 재생중인 노래와 틀고자 하는 노래가 같을때에는 일시정지/재생의 기능
	if (select_music_number.value == pl_number.value) {
		if (player.paused) {
			player.play();
		} else {
			player.pause();
		}
	}
	else {
		//현재 재생중인 노래와 틀고자 하는 노래가 다르면 노래 데이터 변경
		player.src = "../music/" + pl_fileName.value + ".mp3";
		player.play();
		progress.value = 0;
		progress.max = player.duration;
		albumImg.src = "../img/" + pl_fileName.value + ".jpg";
		track_title.innerHTML = pl_title.value;
		track_title.title = pl_title.value;
		artist_name.innerHTML = pl_artist.value;
		artist_name.title = pl_artist.value;

		//노래 플레이 바의 최대값 조정
		progress.max = player.duration;

		// 기존의 재생 트랙 하이라이트 제거
		var tmp = document.querySelector('.playlist_track_box_now');
		tmp.className = "playlist_track_box";
		//포커스된 트랙에 하이라이트 추가
		var tmp = document.getElementById('playlist_track_box_' + pl_number.value);
		tmp.classList = "playlist_track_box_now";

		// 기존 재생곡 플레이 아이콘 모양 변경
		var tmp = document.querySelectorAll('.fa-solid.fa-pause');
		var item = tmp.item(tmp.length - 1);
		if (item != null) {
			item.className = "fa-solid fa-play";
		}

		// 노래 스트리밍 수 늘리기
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '../service/hitService.jsp');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				document.getElementById('hit_num' + pl_number.value).innerHTML = xhr.responseText;
			}
		}

		var data = '';
		data += 'num=' + pl_number.value;
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(data);

		// 선택한 노래의 고유번호와 좋아요 여부를 플레이어에도 따로 저장 사용자에게는 출력x
		select_music_number.value = pl_number.value;
		select_music_loveChk.value = pl_chk.value;

		// 좋아요 목록에 있는지를 체크하고 하트의 모양을 변경
		if (select_music_loveChk.value == "true") {
			love.classList = "fa-solid fa-heart";
		} else {
			love.classList = "fa-regular fa-heart";
		}
	}
}

// 플레이리스트에서 x버튼 눌를때 함수
function remove_playlist(num) {
	//기존 재생중이던 노래의 하이라이트 제거
	var tmp = document.querySelector('.playlist_track_box_now');
	tmp.className = "playlist_track_box";
	
	// 플레이 리스트의 목록을 변수에 저장
	var tmp = document.querySelectorAll('.playlist_track_box');
	var bn; // 이전 노래의 번호를 담아둘 변수
	for(var i = 0; i <tmp.length;i++){ // 플레이 리스트의 노래 수만큼 반복
		var j = tmp.item(i).getAttribute("num"); // 변수 j에 i번째 리스트의 num 값을 저장
		if (j == select_music_number.value) { // j가 현재 재생중인 노래의 번호와 같을때,
			var beforeNumber = tmp.item(i - 1); // beforeNumber에 i-1번째의 값을 저장
			if(beforeNumber!=null){ // i-1번째의 값이 있다면
			bn =beforeNumber.getAttribute("num");} // 이전 목록 리스트의 노래 번호를 bn에 저장
				}
			}
			
		
		if (num == select_music_number.value) { // 현재 재생중인 노래를 삭제할때,
			if (tmp.length>1) { // 리스트 목록의 갯수가 2개 이상일때
				
				// 현재 플레이 하고 있는 노래가 리스트의 첫번째 노래일때
				var first = tmp.item(0).getAttribute('num'); // 첫번째 노래의 num 값을 저장
				if(num==first){
					var second = tmp.item(1).getAttribute('num');
					bn = second;
				}
				
				var nextFileName = document.getElementById('playlist_track_fileName_' + bn).value;
				var nextTitle = document.getElementById('playlist_track_title_' + bn).value;
				var nextArtist = document.getElementById('playlist_track_artist_' + bn).value;
				var nextChk = document.getElementById('playlist_track_chk_' + bn).value;

				select_music_number.value = bn;
				select_music_loveChk.value = nextChk;

				player.src = "../music/" + nextFileName + ".mp3";
				albumImg.src = "../img/" + nextFileName + ".jpg"
				track_title.innerHTML = nextTitle;
				track_title.title = nextTitle;
				artist_name.innerHTML = nextArtist;
				artist_name.title = nextArtist;

				//좋아요 체크 후 모양 변경
				if (nextChk == "true") {
					love.className = "fa-solid fa-heart";
				} else if (nextChk == "false") {
					love.className = "fa-regular fa-heart";
				}

				// 이전 재생 노래에 하이라이트 추가
				var beforeNumber = document.querySelector('#playlist_track_box_' + bn);
				beforeNumber.className = "playlist_track_box_now";

				// 기존 플레이리스트의 재생되고 있더 노래의 플레이 모양 변경
				var tmp = document.querySelectorAll('.fa-solid.fa-pause');
				for (var i = 0; i < tmp.length; i++) {
					var item = tmp.item(i);
					if (item != null) {
						item.className = "fa-solid fa-play";
					}
				}
				// 노래 스트리밍 수 늘리기
				var xhr = new XMLHttpRequest();
				xhr.open('POST', '../service/hitService.jsp');
				xhr.onreadystatechange = function() {
					if (xhr.readyState === 4 && xhr.status === 200) {
						document.getElementById('hit_num' + bn).innerHTML = xhr.responseText;
					}
				}
				var data = '';
				data += 'num=' + bn;
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send(data);


			} else { // 플레이리스트에 노래가 한곡만 남아있을때
				select_music_number.value = "";
				select_music_loveChk.value = "";

				player.src = "";
				albumImg.src = "../img/음표.png"
				track_title.innerHTML = "선택된 음악이 없습니다."
				artist_name.innerHTML = "";

				love.className = "fa-regular fa-heart";
			}
		} else{ // 현재 재생중인 노래가 아닌 노래를 삭제할때
			var tmp2 = document.querySelector('#playlist_track_box_'+select_music_number.value);
			tmp2.className = "playlist_track_box_now";

		}
	
	var ptb = document.getElementById('playlist_track_box_' + num); // 플레이리스트 안에서 지워주기
	var op = document.getElementById('play_list_number_' + num); // 노래 순서를 가지고 있는 셀렉트에서 옵션값을 지워주기
	ptb.remove();
	op.remove();
}

// 노래가 끝났을때 작동
player.addEventListener('ended', () => {
	playNext();
})

// 다음버튼 눌렀을때 남은 노래의 시간이 5초 미만이라면 다음 노래를 재생
forward.addEventListener('click', () => {
	var pd = player.duration;
	var pc = player.currentTime;

	if ((pd - pc) < 5) {
		playNext();

	}
})

// 이전 버튼 눌렀을때 남은 노래의 시간이 5초 미만이라면 이전 노래를 재생
back.addEventListener('click', () => {
	var pc = player.currentTime;
	if (pc < 5) {
		playBefore();
	}
})

// 다음 노래를 틀어주는 함수
function playNext() {
	//기존 재생중이던 노래의 하이라이트 제거
	var tmp = document.querySelector('.playlist_track_box_now');
	tmp.className = "playlist_track_box";

	var random_toggle = document.getElementById('random_toggle_icon').getAttribute("random");
	// random_toggle의 random 속성이 n 일때에는 정상적으로 재생
	if(random_toggle=='n'){
	var tmp = document.querySelectorAll('.playlist_track_box');
	for (var i = 0; i < tmp.length; i++) {
		var item = tmp.item(i);
		var j = item.getAttribute("num");
		if (j == select_music_number.value) {
			var nextMusic = tmp.item(i + 1);

			// 다음 노래 번호가 있을때
			if (nextMusic != null) {
				var nn = nextMusic.getAttribute("num");
				var nextFileName = document.getElementById('playlist_track_fileName_' + nn).value;
				var nextTitle = document.getElementById('playlist_track_title_' + nn).value;
				var nextArtist = document.getElementById('playlist_track_artist_' + nn).value;
				var nextChk = document.getElementById('playlist_track_chk_' + nn).value;

				select_music_number.value = nn;
				select_music_loveChk.value = nextChk;

				player.src = "../music/" + nextFileName + ".mp3";
				albumImg.src = "../img/" + nextFileName + ".jpg"
				track_title.innerHTML = nextTitle;
				track_title.title = nextTitle;
				artist_name.innerHTML = nextArtist;
				artist_name.title = nextArtist;

				//좋아요 체크 후 모양 변경
				if (nextChk == "true") {
					love.className = "fa-solid fa-heart";
				} else if (nextChk == "false") {
					love.className = "fa-regular fa-heart";
				}

				// 다음 재생 노래에 하이라이트 추가
				var nextMusic = document.querySelector('#playlist_track_box_' + nn);
				nextMusic.className = "playlist_track_box_now";

				// 기존 플레이리스트의 재생되고 있더 노래의 플레이 모양 변경
				var tmp = document.querySelectorAll('.fa-solid.fa-pause');
				for (var i = 0; i < tmp.length; i++) {
					var item = tmp.item(i);
					if (item != null) {
						item.className = "fa-solid fa-play";
					}
				}
				// 노래 스트리밍 수 늘리기
				var xhr = new XMLHttpRequest();
				xhr.open('POST', '../service/hitService.jsp');
				xhr.onreadystatechange = function() {
					if (xhr.readyState === 4 && xhr.status === 200) {
						document.getElementById('hit_num' + nn).innerHTML = xhr.responseText;
					}
				}
				var data = '';
				data += 'num=' + nn;
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send(data);
			} else { // 다음 노래 번호가 없을때
				var nn = tmp.item(0).getAttribute("num");
				var nextFileName = document.getElementById('playlist_track_fileName_' + nn).value;
				var nextTitle = document.getElementById('playlist_track_title_' + nn).value;
				var nextArtist = document.getElementById('playlist_track_artist_' + nn).value;
				var nextChk = document.getElementById('playlist_track_chk_' + nn).value;

				select_music_number.value = nn;
				select_music_loveChk.value = nextChk;

				player.src = "../music/" + nextFileName + ".mp3";
				albumImg.src = "../img/" + nextFileName + ".jpg"
				track_title.innerHTML = nextTitle;
				track_title.title = nextTitle;
				artist_name.innerHTML = nextArtist;
				artist_name.title = nextArtist;

				//좋아요 체크 후 모양 변경
				if (nextChk == "true") {
					love.className = "fa-solid fa-heart";
				} else if (nextChk == "false") {
					love.className = "fa-regular fa-heart";
				}

				// 다음 재생 노래에 하이라이트 추가
				var nextMusic = document.querySelector('#playlist_track_box_' + nn);
				nextMusic.className = "playlist_track_box_now";

				// 기존 플레이리스트의 재생되고 있더 노래의 플레이 모양 변경
				var tmp = document.querySelectorAll('.fa-solid.fa-pause');
				for (var i = 0; i < tmp.length; i++) {
					var item = tmp.item(i);
					if (item != null) {
						item.className = "fa-solid fa-play";
					}
				}
				player.pause();
			}
		}
	}
	} else { // random_toggle 의 toggle 속성이 'y' 일때에는 다음 노래를 리스트의 랜덤한 인덱스의 노래를 재생.
	var tmp = document.querySelectorAll('.playlist_track_box_now');
	tmp.className = "playlist_track_box";
	tmp = document.querySelectorAll('.playlist_track_box');
	var n = Math.random()*tmp.length;
	var next = Math.floor(n);
	
	var item = tmp.item(next);
	var rn = item.getAttribute("num");
	if(select_music_number.value==rn){
		while(true){
			var next = Math.floor(Math.random()*tmp.length);
			item = tmp.item(next);
			rn = item.getAttribute("num");
			console.log("rn : "+rn)
			if(select_music_number.value != rn) break;
		}
	}
	var nextFileName = document.getElementById('playlist_track_fileName_' + rn).value;
	var nextTitle = document.getElementById('playlist_track_title_' + rn).value;
	var nextArtist = document.getElementById('playlist_track_artist_' + rn).value;
	var nextChk = document.getElementById('playlist_track_chk_' + rn).value;

		select_music_number.value = rn;
		select_music_loveChk.value = nextChk;

		player.src = "../music/" + nextFileName + ".mp3";
		albumImg.src = "../img/" + nextFileName + ".jpg"
		track_title.innerHTML = nextTitle;
		track_title.title = nextTitle;
		artist_name.innerHTML = nextArtist;
		artist_name.title = nextArtist;

		//좋아요 체크 후 모양 변경
		if (nextChk == "true") {
			love.className = "fa-solid fa-heart";
		} else if (nextChk == "false") {
			love.className = "fa-regular fa-heart";
		}

		// 다음 재생 노래에 하이라이트 추가
		var nextMusic = document.querySelector('#playlist_track_box_' + rn);
		nextMusic.className = "playlist_track_box_now";

		// 기존 플레이리스트의 재생되고 있더 노래의 플레이 모양 변경
		var tmp = document.querySelectorAll('.fa-solid.fa-pause');
		for (var i = 0; i < tmp.length; i++) {
			var item = tmp.item(i);
			if (item != null) {
				item.className = "fa-solid fa-play";
			}
		}
		// 노래 스트리밍 수 늘리기
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '../service/hitService.jsp');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				document.getElementById('hit_num' + rn).innerHTML = xhr.responseText;
			}
		}
		var data = '';
		data += 'num=' + rn;
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(data);	
	

	}
}

// 이전 노래를 틀어주는 함수
function playBefore() {
	//기존 재생중이던 노래의 하이라이트 제거
	var tmp = document.querySelector('.playlist_track_box_now');
	tmp.className = "playlist_track_box";


	var tmp = document.querySelectorAll('.playlist_track_box');
	for (var i = 0; i < tmp.length; i++) {
		var item = tmp.item(i);
		var j = item.getAttribute("num");
		if (j == select_music_number.value) {
			var beforeNumber = tmp.item(i - 1);

			// 이전 노래 번호가 있을때
			if (beforeNumber != null) {
				var bn = beforeNumber.getAttribute("num");
				var nextFileName = document.getElementById('playlist_track_fileName_' + bn).value;
				var nextTitle = document.getElementById('playlist_track_title_' + bn).value;
				var nextArtist = document.getElementById('playlist_track_artist_' + bn).value;
				var nextChk = document.getElementById('playlist_track_chk_' + bn).value;

				select_music_number.value = bn;
				select_music_loveChk.value = nextChk;

				player.src = "../music/" + nextFileName + ".mp3";
				albumImg.src = "../img/" + nextFileName + ".jpg"
				track_title.innerHTML = nextTitle;
				track_title.title = nextTitle;
				artist_name.innerHTML = nextArtist;
				artist_name.title = nextArtist;

				//좋아요 체크 후 모양 변경
				if (nextChk == "true") {
					love.className = "fa-solid fa-heart";
				} else if (nextChk == "false") {
					love.className = "fa-regular fa-heart";
				}

				// 이전 재생 노래에 하이라이트 추가
				var beforeNumber = document.querySelector('#playlist_track_box_' + bn);
				beforeNumber.className = "playlist_track_box_now";

				// 기존 플레이리스트의 재생되고 있더 노래의 플레이 모양 변경
				var tmp = document.querySelectorAll('.fa-solid.fa-pause');
				for (var i = 0; i < tmp.length; i++) {
					var item = tmp.item(i);
					if (item != null) {
						item.className = "fa-solid fa-play";
					}
				}
				// 노래 스트리밍 수 늘리기
				var xhr = new XMLHttpRequest();
				xhr.open('POST', '../service/hitService.jsp');
				xhr.onreadystatechange = function() {
					if (xhr.readyState === 4 && xhr.status === 200) {
						document.getElementById('hit_num' + bn).innerHTML = xhr.responseText;
					}
				}
				var data = '';
				data += 'num=' + bn;
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send(data);


			} else {
				// 다음 노래 번호가 없을때
				var bn = tmp.item(0).getAttribute("num");
				var nextFileName = document.getElementById('playlist_track_fileName_' + bn).value;
				var nextTitle = document.getElementById('playlist_track_title_' + bn).value;
				var nextArtist = document.getElementById('playlist_track_artist_' + bn).value;
				var nextChk = document.getElementById('playlist_track_chk_' + bn).value;

				select_music_number.value = bn;
				select_music_loveChk.value = nextChk;

				player.src = "../music/" + nextFileName + ".mp3";
				albumImg.src = "../img/" + nextFileName + ".jpg"
				track_title.innerHTML = nextTitle;
				track_title.title = nextTitle;
				artist_name.innerHTML = nextArtist;
				artist_name.title = nextArtist;

				//좋아요 체크 후 모양 변경
				if (nextChk == "true") {
					love.className = "fa-solid fa-heart";
				} else if (nextChk == "false") {
					love.className = "fa-regular fa-heart";
				}

				// 다음 재생 노래에 하이라이트 추가
				var beforeNumber = document.querySelector('#playlist_track_box_' + bn);
				beforeNumber.className = "playlist_track_box_now";

				// 기존 플레이리스트의 재생되고 있더 노래의 플레이 모양 변경
				var tmp = document.querySelectorAll('.fa-solid.fa-pause');
				for (var i = 0; i < tmp.length; i++) {
					var item = tmp.item(i);
					if (item != null) {
						item.className = "fa-solid fa-play";
					}
				}
				player.currentTime = 0;
			}
		}
	}
}

document.getElementById('random_toggle_icon').addEventListener('click',()=>{
	var toggle = document.getElementById('random_toggle_icon').getAttribute("random");
	
	if(toggle == 'y'){
		toggle = 'n';
		document.getElementById('random_toggle_icon').className = "fa-solid fa-repeat";
	} else {
		toggle = 'y';
		document.getElementById('random_toggle_icon').className = "fa-solid fa-shuffle"
	}
	document.getElementById('random_toggle_icon').setAttribute('random',toggle);
});

