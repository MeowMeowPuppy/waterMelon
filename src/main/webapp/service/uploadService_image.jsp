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

// 저장할 파일이 3개라 3개씩임(노래, 가사, 이미지)

String saveDir_img = "C:\\javas\\jsp_workspace\\waterMelon\\src\\main\\webapp\\img";

File file_img = new File(saveDir_img);
if (file_img.exists() == false)
	file_img.mkdir();

int maxPostSize = 1024 * 1024 * 20;

MultipartRequest multi_img = new MultipartRequest(request, saveDir_img, maxPostSize, "UTF-8");
%>
<script>
	alert('업로드 완료');
	location.href = "../view/upload.jsp";
</script>