<%@page import="DAO.AlbumDAO"%>
<%@page import="DTO.AlbumDTO"%>
<%@page import="DTO.ArtistDTO"%>
<%@page import="DAO.ArtistDAO"%>
<%@page import="DAO.LoveDAO"%>
<%@page import="DTO.MusicDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MusicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<link rel="stylesheet" href="../css/searchResult.css">
<script src="https://kit.fontawesome.com/8aec6793ef.js"
	crossorigin="anonymous"></script>
<%
String id = (String) session.getAttribute("id");
String voucher = (String) session.getAttribute("voucher");

String keywords = request.getParameter("keywords");
MusicDAO musicDao = new MusicDAO();
// 키워드가 제목, 앨범, 가수에 포함되어있다면 전부 track으로 가져오는 부분
ArrayList<MusicDTO> track = musicDao.searchTotal(keywords);

// 검색 키워드로 앨범 상세 정보 찾아오기
ArrayList<AlbumDTO> albums = new ArrayList<AlbumDTO>();
AlbumDAO albumDao = new AlbumDAO();
albums = albumDao.selectName(keywords);

// 검색 키워드로 아티스트 상세 정보 찾아오기
ArtistDAO artistDao = new ArtistDAO();
ArrayList<ArtistDTO> artists = artistDao.selectName(keywords);
ArtistDTO searchArtist = new ArtistDTO();
String team = "";
String gender = "";
ArrayList<String> teamMember = new ArrayList<>();
if (artists.size() > 0) {
	searchArtist = artists.get(0);
	team = searchArtist.getTeam();
	gender = searchArtist.getGender();
	String member = searchArtist.getMember();
}
// 로그인한 계정이 좋아요한 노래인지를 확인
LoveDAO loveDao = new LoveDAO();
ArrayList<Integer> loves = new ArrayList<>();
if (id != null || id != "") {
	loves = loveDao.selectId(id); // ID가 좋아요한 노래들의 번호 목록
}
boolean loveChk = false;
%>

<body>
	<div class="main">
		<div class="search_result_wrap">
			<h1>
				'<%=keywords%>' 검색결과
			</h1>
			<%
			if (searchArtist.getName() != null) {
			%>
			<div class="artist_info">
				<img alt="" src="../artist_profile/<%=searchArtist.getName()%>.jpg"
					id="artist_profile_img"> <span class="search_artist_name_box">
					<label id="search_artist_name"><%=searchArtist.getName()%></label>
				</span> <span class="search_artist_box"> <label
					id="search_artist_gender"><%=searchArtist.getGender()%></label> / <label
					id="search_artist_team"><%=searchArtist.getTeam()%></label>
				</span>

			</div>
			<%
			}
			%>
			<div class="result_body">
				<!-- 키워드와 관련된 곡 정보 -->
				<h2>곡 ▶</h2>
				<div class="result_from_title">
					<table>
						<colgroup>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
						</colgroup>
						<tr>
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
						if (track.size() == 0) {
						%>
						<tr>
							<td colspan="8"><label id="no_result"> 검색 결과가 없습니다.</label>
							</td>
						</tr>
						<%
						} else if (track.size() >= 1) {
						for (int i = 0; i < track.size(); i++) {
							MusicDTO list = track.get(i);
							String album = list.getAlbum();
							String artist = list.getArtist();
							String fileName = list.getFileName();
							String lyrics = list.getLyrics();
							String mv = list.getMv();
							int hit = list.getHit();
							int num = list.getNum();
							int love = list.getLove();
							String title = list.getTitle();
							if (loves.contains(list.getNum())) {
								loveChk = true;
							}
						%>
						<tr>
							<td><img alt="" src="../img/<%=fileName%>.jpg" class="album"
								title="<%=album%>"> <input type="hidden"
								id="love_checked_<%=num%>" value="<%=loveChk%>"></td>
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
								onclick="alert('로그인 후 사용하세요')"></i> <%
 } else {
 if (voucher == "y") {
 %>
								<button id="add_play_button<%=num%>" value="<%=num%>"
									type="button"
									onclick="playSong('<%=fileName%>','<%=title%>', '<%=artist%>','<%=num%>');
								uphit('<%=num%>'); insertPlaylist('<%=num%>','<%=id%>')
								"
									class="add_play_button">
									<i class="fa-solid fa-play"></i>
								</button> <%
 } else {
 %> <i class="fa-solid fa-play" id="no_access_play"
								onclick="alert('이용권 구매후 이용해주세요')"></i> <%
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
						<tr>
							<td></td>
						</tr>
						<%
						}
						%>

					</table>
				</div>

				<!-- 앨범 정보만큼 출력 -->
				<h2>앨범 ▶</h2>
				<div class="result_from_album">
					<ul>
						<%
						if (albums.size() == 0) {
						%>
						<li class="no_result_from_album"><label id="no_result">
								검색 결과가 없습니다.</label></li>
						<%
						} else if (albums.size() >= 1) {
						for (int i = 0; i < albums.size(); i++) {
							AlbumDTO item = albums.get(i);
							String tmp = albums.get(i).getName(); // 앨범 이름을 tmp에 저장
							tmp = albums.get(i).getArtist();
						%>
						<li>
							<div class="album_list_box">
								<div class="album_list_section">
									<div class="album_cover">
										<img src="../album cover/<%=item.getArtist()%>-<%=item.getName()%>.jpg" id="album_cover_img">
									</div>
									<div class="result_album_info">
										<span id="result_album_name"><%=item.getName() %></span> <br><span
											id="result_album_artist"></span> <span id="result_album_type"> <%=item.getType() %></span> / 
										<span id="result_album_genre"> <%= item.getGenre() %></span>
									</div>
								</div>
							</div>
						</li>
						<%
						if (i >= 6)
							break;
						}
						}
						%>
					</ul>
				</div>
				<h2>아티스트 ▶</h2>
				<div class="result_from_artist">
					<ul>
						<%
						if (artists.size() == 0) {
						%>
						<li class="no_result_from_artist"><label id="no_result">
								검색 결과가 없습니다.</label></li>
						<%
						} else{
							// 검색한 아티스트의 첫번째 값을 가져옴
							ArtistDTO dto = artists.get(0);
							String[] tmp = dto.getMember().split("-");// 멤버 명단을 - 을 기준으로 구분
							ArrayList<String> members = new ArrayList<>();
							for(String t : tmp){// 사용하기 쉽게 컬렉션으로 옮김
								members.add(t);
							}
							for(int i =0;i<members.size();i++){ // 멤버 인원만큼 반복
								String mn = members.get(i);
							ArtistDTO mi = artistDao.findMember(mn);
						%>
						<li>
							<div class="artist_list_box">
								<div class="artist_list_section">
									<div class="result_artist_profile">
										<img src="../artist_profile/<%=mn%>.jpg" id="result_artist_profile_img">
									</div>
									<div class="result_artist_info">
										<span class="result_artist_name"><%=mi.getName() %></span> / 
										<span class="result_artist_gender"><%=mi.getGender() %></span>
									</div>
								</div>
							</div>
						</li>
						<%
						}
						}
						%>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

<%
musicDao.disconnection();
loveDao.disconnection();
albumDao.disconeection();
artistDao.disconnection();
%>