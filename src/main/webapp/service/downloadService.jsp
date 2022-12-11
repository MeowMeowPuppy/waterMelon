<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//downloadService.jsp
request.setCharacterEncoding("utf-8");


String fileName = request.getParameter("fileName");

// 	System.out.println(fileName); //ok
	
if (fileName == null || fileName == "") {
	response.sendRedirect("../view/main.jsp");
	return;
}

String saveDir = "C:\\javas\\jsp_workspace\\waterMelon\\src\\main\\webapp\\music\\" + fileName + ".mp3";
response.setContentType("application/octet-stream");
response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName+".mp3", "UTF-8"));

File file = new File(saveDir);
FileInputStream fis = new FileInputStream(file);

out.clear();
out = pageContext.pushBody();
OutputStream os = response.getOutputStream();
byte[] b = new byte[1024];

while (true) {
	int currentSize = fis.read(b, 0, b.length);
	if (currentSize == -1)
		break;
	
	os.write(b, 0, currentSize);
}
%>
