<%@page import="DAO.MusicDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%


request.setCharacterEncoding("utf-8");
String para = request.getParameter("filename");
String filename = para + ".jpg";

String saveDir = "C:\\javas\\jsp_workspace\\waterMelon\\src\\main\\webapp\\img\\" + filename;
File file = new File(saveDir);
if (file.exists() == true)
	file.delete();


%>
<script>
	alert('음원이 삭제되었습니다.');
	location.href='../view/upload.jsp';
</script>