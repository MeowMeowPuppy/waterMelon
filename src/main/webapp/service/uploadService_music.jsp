<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.MusicDTO"%>
<%@page import="DAO.MusicDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//비 정상적 접근 방지
String id = (String) session.getAttribute("id");
if (id == null) {
	out.print("<script>alert('로그인 후 이용해주세요.'); location.href='../view/managerLogin.jsp'</script>");
	return;
} else if (id.equals("admin") == false) {
	out.print("<script>alert('노래나 들으세요.'); location.href='main.jsp'</script>");
	return;
}

String saveDir_music = "C:\\javas\\jsp_workspace\\waterMelon\\src\\main\\webapp\\music";

File file_music = new File(saveDir_music);
if (file_music.exists() == false)
	file_music.mkdir();

int maxPostSize = 1024 * 1024 * 20;

MultipartRequest multi_music = new MultipartRequest(request, saveDir_music, maxPostSize, "UTF-8");

String ofnMusic = multi_music.getOriginalFileName("music");
String fileName = ofnMusic.replace(".mp3", "");

String title = multi_music.getParameter("title");
String album = multi_music.getParameter("album");
String artist = multi_music.getParameter("artist");
String mv = multi_music.getParameter("mv");
if (mv == null || mv == "null" || mv == "" || mv.equals("") || mv.isEmpty()){
	out.print("<script>location.href='../view/upload.jsp';</script>");
	return;
}


MusicDTO music = new MusicDTO();
music.setTitle(title);
music.setAlbum(album);
music.setArtist(artist);
music.setLyrics("n");
music.setMv(mv);
music.setFileName(fileName);
music.setLove(0);
music.setHit(0);

MusicDAO musicDao = new MusicDAO();
if(musicDao.prevent(music.getFileName()) == true){
	out.print("<script>alert('이미 등록된 음원입니다.');location.href='../view/upload.jsp';</script>");
	return;
}
musicDao.insert(music);
%>
<script>
	alert('업로드 완료');
	location.href = "../view/upload.jsp";
</script>