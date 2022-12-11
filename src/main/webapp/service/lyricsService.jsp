<%@page import="java.io.FileReader"%>
<%@page import="DTO.MusicDTO"%>
<%@page import="DAO.MusicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		text-align: center;
		line-height: 30px;
	}
	img{
		width: 300px;
		height: 100px;
	}
	#album{
		width: 80px;
		height: 80px;
	}
	#title{
		font-size: 16px;
		font-family: "돋움";
		font-weight: bold;
	}
	#artist{
		font-size: 12px;
		font-family: "돋움";
		color: #BDBDBD;
	}
</style>
</head>
<body>
<%
MusicDAO dao = new MusicDAO();
String n = (String)request.getParameter("num");
int num = Integer.parseInt(n);

MusicDTO dto = dao.selectNum(num);

String fileName = dto.getFileName();
%>
<img alt="" src="../img/logo.png">
<br>
<img alt="" src="../img/<%=fileName%>.jpg" id='album'>
<br>
<div id="title"><label><%=dto.getTitle() %></label></div>
<div id="artist"><label><%=dto.getArtist() %></label></div>
<%

	
	FileReader reader = 
			new FileReader("C:\\javas\\jsp_workspace\\waterMelon\\src\\main\\webapp\\lyrics\\"+fileName+".txt");
	int ch;
	while ((ch = reader.read()) != -1) {
		out.print((char) ch);
	}
	reader.close();
	dao.disconnection();
%>
</body>
</html>