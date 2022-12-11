<%@page import="java.util.ArrayList"%>
<%@page import="DAO.LoveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/8aec6793ef.js"
	crossorigin="anonymous"></script>
</head>

<%
String rt = "n";
%>
<body>
	<audio src="" id="player" autoplay></audio>
	<div class="music_box">
		<div class="player">
			<div class="left">
				<div id="disc">
					<img alt="" src="../img/음표.png" id="albumImg">
				</div>
				<div class="info">
					<span id="track_title">track title</span> <span id="artist_name">artist
						name</span>
				</div>
			</div>
			<div class="center">
				<div class="control">
					<div class="button">
						<i class="fa-solid fa-backward-step" id="back"></i> <i
							class="fa-solid fa-play" id="play_button"></i> <i
							class="fa-solid fa-forward-step" id="forward"></i>
					</div>
					<div class="bar">
						<input type="range" id="progress">
					</div>
					<div class="time">
						<span id="current_time">00:00</span> <span id="max_time">00:00</span>
					</div>
				</div>
			</div>

			<div class="right">
				<div class="menu">
					<div class="item">
						<input type="hidden" value="" id="select_music_number"> <input
							type="hidden" value="" id="select_music_loveChk">
						<!-- 좋아요 버튼 -->
						<span class="loveBox"> <i class="fa-regular fa-heart"
						
							id="love" onclick="addLove('<%= id %>')"></i>
						</span>
					</div>
					<div class="item">
						<!-- 볼륨 버튼 -->
						<i class="fa-solid fa-volume-high" id="volume_icon"></i>
						<div class="volume_box" id="volume_box">
							<input type="range" id="volume" min="0" max="100">
						</div>
					</div>
					<div class="item">
						<!-- 플레이리스트 버튼 -->
						<i class="fa-solid fa-bars" id="list_icon"></i>
					</div>
					<div class="item">
						<!-- 랜덤 재생 버튼 -->
					<div class="random_toggle">
						<i class="fa-solid fa-repeat" id="random_toggle_icon" random="n"></i>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 플레이 리스트 목록으로 사용할 select 박스 -->
	<select id="audio_list">
	</select>
	
	<!-- 실제 플레이 리스트 구역 -->
		<div class="playList_box" id="playList_box">
			<div class="playlist_outer_line">
			<!-- 플레이리스트 헤더 파트 -->
			<div class="playList_header">
				<label id="playList_lb">재생목록</label>
			<i class="fa-solid fa-xmark" id="playList_close"></i>
			</div>
	
			<!-- 플레이리스트 바디 파트 -->
		<div class="playList_box_background">
			<div class="playlist_body" id="playlist_body">
			</div>
		</div>
			</div>
	</div>
	<script type="text/javascript" src="../js/player.js"></script>
</body>
</html>