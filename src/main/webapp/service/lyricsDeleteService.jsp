<%@page import="DAO.MusicDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%


request.setCharacterEncoding("utf-8");
String para = request.getParameter("filename");
String filename = para + ".txt";

String saveDir = "C:\\javas\\jsp_workspace\\waterMelon\\src\\main\\webapp\\lyrics\\" + filename;
File file = new File(saveDir);
if (file.exists() == true)
	file.delete();


%>
<script>
	location.href='imgDeleteService.jsp?filename=<%=para%>';
</script>