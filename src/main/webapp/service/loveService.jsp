<%@page import="DAO.MusicDAO"%>
<%@page import="DAO.LoveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	LoveDAO loveDao = new LoveDAO();
	MusicDAO musicDao = new MusicDAO();
	
	String chk = request.getParameter("chk");
	String id = request.getParameter("id");
	String n = request.getParameter("num");
	
	int num = 0;
	try{
		num = Integer.parseInt(n);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(chk.equals("true")){
		loveDao.removeList(id, num);
		int result = musicDao.downLove(num, id);
		out.print(result);
		return;
	}
	
	if(chk.equals("false")){
		loveDao.addList(id, num);
		int result = musicDao.upLove(num, id);
		out.print(result);
		return;
	}
	
	loveDao.disconnection();
	musicDao.disconnection();
%>
