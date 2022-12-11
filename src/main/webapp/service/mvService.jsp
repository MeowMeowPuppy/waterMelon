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
	*{
	margin: 0px;
	padding: 0px;
	background-color: black;
	}
</style>
</head>
<body>
	<%
		String n = request.getParameter("num");
		int num = Integer.parseInt(n);
	 	MusicDAO dao = new MusicDAO();
		MusicDTO dto = dao.selectNum(num);
		String mv = dto.getMv();
		out.print(mv); 
		dao.disconnection();
	%>
</body>
</html>