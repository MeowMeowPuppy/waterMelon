<%@page import="java.util.ArrayList"%>
<%@page import="DAO.LoveDAO"%>
<%@page import="DTO.MusicDTO"%>
<%@page import="DAO.MusicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	MusicDAO musicDao = new MusicDAO();
	LoveDAO loveDao = new LoveDAO();
	String n = request.getParameter("num");
	int num = Integer.parseInt(n);
	MusicDTO dto = musicDao.selectNum(num);
	
	String id = request.getParameter("id");
	String fileName = dto.getFileName();
	String title = dto.getTitle();
	String artist = dto.getArtist();
	String album = dto.getAlbum();
	
	String chk = "false";
	ArrayList<Integer> lists = loveDao.selectId(id);
	if(lists.contains(num)){
		chk = "true";
	}
%>
	<div class="playlist_track_box_now" id="playlist_track_box_<%=num%>" num="<%=num%>">
	<div class="playlist_album_img">
		<img alt="" src="../img/<%=fileName%>.jpg">
	</div>
	<div class="playlist_track_info" id="playlist_track_info_<%=num%>">
		<div class="playlist_track_title" title="<%=title%>">
			<label><%=title %>
			</label>
		</div>
		<div class="playlist_track_artist" title="<%=artist%>">
			<label><%=artist %>
			</label>
		</div>
	</div>
	<div class="playlist_play_button_box">
		<button  class="playlist_play_button" onclick="playlist_play(<%=num%>)" id="playlist_play_<%=num%>">
			<i class="fa-solid fa-pause" id="playlist_play_button"></i>
		</button>
	</div>
	<div class="playlist_remove_button_box">
		<button  class="playlist_remove_button"onclick="remove_playlist(<%=num%>)">
			<i class="fa-solid fa-xmark"></i>
		</button>
	</div>
	<input type="hidden" id="playlist_track_number_<%=num%>" value="<%=num%>">
	<input type="hidden" id="playlist_track_fileName_<%=num%>" value="<%=fileName%>">
	<input type="hidden" id="playlist_track_title_<%=num%>" value="<%=title%>">
	<input type="hidden" id="playlist_track_artist_<%=num%>" value="<%=artist%>">
	<input type="hidden" id="playlist_track_chk_<%=num%>" value="<%=chk%>">
	</div>
<%
	musicDao.disconnection();
	musicDao.disconnection();
%>