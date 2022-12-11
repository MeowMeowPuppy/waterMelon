<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String phone = request.getParameter("mobileNum");
String certi = request.getParameter("connumberCK");
String random = String.valueOf(session.getAttribute("randomNum"));

if(certi.equals(random)){
	out.print("<script> alert('휴대폰 결제가 완료되었습니다.'); location.href='../view/main.jsp';</script>");
} else{
	out.print("<script> alert('인증번호가 일치하지않습니다.'); history.back();</script>");
}
%>