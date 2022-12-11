<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

// 전화번호 중복체크
String mobile = request.getParameter("mobileNum");
// System.out.println(mobile);
MemberDAO memberDao = new MemberDAO();
MemberDTO mobileCheck = memberDao.selectMobile(mobile);
if (mobileCheck != null){
	out.print("<script>alert('전화번호를 확인해주세요.'); history.back();</script>");
	return;
}

boolean check = true;
Random	random = new Random();
int randomNum = 0;
while(check){
	randomNum = random.nextInt(10000);
	if (randomNum > 1000){
		check = false;
	}
// 	System.out.println("생성된 랜덤번호 : "+randomNum);
session.setAttribute("randomNum", randomNum);
}
memberDao.disconnection();
%>
<script>alert(<%=randomNum%>); history.back();</script>
