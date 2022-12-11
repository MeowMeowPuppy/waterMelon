<%@page import="DTO.LoveDTO"%>
<%@page import="DAO.LoveDAO"%>
<%@page import="DTO.MusicDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MusicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="../img/watermelon.png">
<meta charset="UTF-8">
<title>warterMelon</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/player.css">
<link rel="stylesheet" href="../css/header.css">
</head>
<%@ include file="../header/header.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
MusicDAO musicDao = new MusicDAO();
ArrayList<MusicDTO> lists = musicDao.selectAll();
LoveDAO loveDao = new LoveDAO();
ArrayList<Integer> loves = new ArrayList<>();
if (id != null || id != "") {
	loves = loveDao.selectId(id); // ID가 좋아요한 노래들의 번호 목록
}
%>
<div class="content" id="content">
	<div class="main">
		<h1>
			수박차트&nbsp;<label>스트리밍 기준</label>
		</h1>
		<table class="tableList">
			<colgroup>
				<col width="50px">
				<col width="100px">
				<col width="250px">
				<col width="50px">
				<col width="150px">
				<col width="100px">
				<col width="50px">
				<col width="50px">
				<col width="100px">
				<col width="100px">
			</colgroup>
			<tr class="tableHead">
				<th>순위</th>
				<th>앨범<br>이미지
				</th>
				<th>곡정보</th>
				<th>가사</th>
				<th>앨범</th>
				<th>좋아요</th>
				<th>듣기</th>
				<th>뮤비</th>
				<th>스트리밍<br>횟수
				</th>
				<th>다운로드</th>
			</tr>
			<%
			// 노래 목록에 들어갈 노래들의 정보들을 각각의 DTO에 저장하고 출력
			boolean loveChk = false;
			for (int i = 0; i < lists.size(); i++) {
				loveChk = false;
				MusicDTO list = lists.get(i);
				int num = list.getNum();
				String title = list.getTitle();
				String album = list.getAlbum();
				String artist = list.getArtist();
				String lyrics = list.getLyrics();
				String mv = list.getMv();
				int love = list.getLove();
				int hit = list.getHit();
				String fileName = list.getFileName();
				if (loves.contains(list.getNum())) {
					loveChk = true;
				}
			%>


			<tr>
				<td><%=i + 1%> <input type="hidden" id="love_checked_<%=num%>"
					value="<%=loveChk%>"></td>
				<td><img alt="" src="../img/<%=fileName%>.jpg" class="album"
					title="<%=album%>"></td>
				<td class="trackTitle_box" title="<%=title%> - <%=artist%>"><span
					class="trackTitle"> <label id="music_title"><%=title%></label>
						<br> <label><%=artist%></label>
				</span></td>
				<td><i class="fa-regular fa-file-lines"
					onclick="openLyrics('<%=num%>')"></i></td>
				<td class="album_box" title="<%=album%>"><%=album%></td>
				<td id="love_count_<%=num%>"><%=love%></td>
				<td>
					<%
					if (id == null || id == "") {
					%> <i class="fa-solid fa-play" id="no_access_play"
					onclick="none_logined_play('<%=fileName%>','<%=title%>','<%=artist%>','<%=num%>')"></i>
					<%
					} else {
					if (voucher == "y") {
					%>
					<button id="add_play_button<%=num%>" value="<%=num%>" type="button"
						onclick="playSong('<%=fileName%>','<%=title%>', '<%=artist%>','<%=num%>');
						uphit('<%=num%>'); insertPlaylist('<%=num%>','<%=id%>')
						"
						class="add_play_button">
						<i class="fa-solid fa-play"></i>
					</button> <%
 } else {
 %> <i class="fa-solid fa-play" id="no_access_play"
					onclick="none_logined_play('<%=fileName%>','<%=title%>','<%=artist%>','<%=num%>')"></i>
					<%
					}
					}
					%>
				</td>
				<td>
					<%
					if (id == null || id == "") {
					%> <i class="fa-solid fa-video-slash" id="no_access_mv"
					onclick="alert('로그인 후 사용하세요')"></i> <%
 } else if (voucher == "y") {
 if (list.getMv().equals("n")) {
 %> <span class="open_mv"> <i class="fa-solid fa-video-slash"></i>
				</span> <%
 } else {
 %> <span onclick="openMv('<%=num%>')"> <i
						class="fa-solid fa-video"></i></span> <%
 }
 } else {
 %> <i class="fa-solid fa-video-slash" id="no_access_mv"
					onclick="alert('이용권 구매후 이용해주세요')"></i> <%
 }
 %>
				</td>
				<td id="hit_num<%=num%>"><%=hit%></td>
				<td>
					<%
					if (id == null || id == "") {
					%> <i onclick="alert('로그인 후 사용하세요')" class="fa-solid fa-download"
					id="no_access_download"></i> <%
 } else {
 %>
					<button value="<%=num%>" name="download_button">
						<i class="fa-solid fa-download"></i>
					</button>
				</td>
			</tr>
			<%
			}
			}
			%>
		</table>
	</div>
</div>
<%
musicDao.disconnection();
loveDao.disconnection();
%>
<%@ include file="../footer/footer.jsp"%>
<%@ include file="../view/player.jsp"%>
<script type="text/javascript" src="../js/buyVoucher.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/ajax.js"></script>
<script type="text/javascript" src="../js/myInfo.js"></script>
<script src="../js/login.js"></script>
</html>