<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String mobile = (String)session.getAttribute("mobile");

String input = request.getParameter("mobile");
int randomNum = 0;

if (mobile.equals(input)) {
	boolean check = true;
	Random random = new Random();
	while (check) {
		randomNum = random.nextInt(1000000);
		if (100000 <= randomNum) {
		check = false;
		}
	}
// 	System.out.println("생성된 랜덤번호 : " + randomNum);
	session.setAttribute("randomNum", randomNum);
} else {
	out.print("<script>alert('전화번호를 확인해주세요.'); history.back();</script>");
	return;
}
%>
<script>alert("인증번호는 " +<%=randomNum%>+ " 입니다.");history.back();</script>

