<%@page import="DAO.MusicDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
request.setCharacterEncoding("utf-8");

String title = request.getParameter("title");
String para = request.getParameter("filename");
String filename = para + ".mp3";
// System.out.println(filename);
String saveDir = "C:\\javas\\jsp_workspace\\waterMelon\\src\\main\\webapp\\music\\" + filename;
File file = new File(saveDir);
if (file.exists() == true)
	file.delete();



MusicDAO musicDao = new MusicDAO();
musicDao.delete(title);
musicDao.disconnection();
%>
<script>
	console.log('<%=para%>');
	location.href='lyricsDeleteService.jsp?filename=<%=para%>';
</script>