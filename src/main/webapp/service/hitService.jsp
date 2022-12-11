<%@page import="DAO.MusicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = 0;
String n = request.getParameter("num");
try{
num = Integer.parseInt(n);
} catch(Exception e){
	
}
MusicDAO dao = new MusicDAO();
out.print(dao.upHit(num));
dao.disconnection();
%>
