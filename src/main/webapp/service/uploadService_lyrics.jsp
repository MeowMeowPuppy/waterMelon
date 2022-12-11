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
	out.print("<script>alert('접근불가'); location.href='../view/main.jsp'</script>");
	return;
}

String saveDir_lyrics = "C:\\javas\\jsp_workspace\\waterMelon\\src\\main\\webapp\\lyrics";

File file_lyrics = new File(saveDir_lyrics);
if (file_lyrics.exists() == false)
	file_lyrics.mkdir();

int maxPostSize = 1024 * 1024 * 20;

MultipartRequest multi_lyrics = new MultipartRequest(request, saveDir_lyrics, maxPostSize, "UTF-8");

String ofnLyrics = multi_lyrics.getOriginalFileName("lyrics");
String fileName = ofnLyrics.replace(".txt", ""); // txt를 공백으로 치환(가사파일이랑  음악파일 이름이 txt,mp3 차이라서)

MusicDTO music = new MusicDTO();
music.setFileName(fileName);

MusicDAO musicDao = new MusicDAO();
musicDao.update(music);
%>
<script>
	alert('업로드 완료');
	location.href = "../view/upload.jsp";
</script>