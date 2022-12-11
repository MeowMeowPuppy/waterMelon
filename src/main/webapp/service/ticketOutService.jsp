<%@page import="DAO.VoucherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
// ticketOutService

// 비 정상적 접근 방지
String id = (String) session.getAttribute("id");
if (id == null) {
	out.print("<script>alert('로그인 후 이용해주세요.'); location.href='login.jsp'</script>");
	return;
}

VoucherDAO voucherDao = new VoucherDAO();
voucherDao.delete(id);
voucherDao.disconnection();
session.setAttribute("voucher", "n");
%>
<script>
	alert('이용권 해지와 환불이 정상적으로 완료되었습니다.');
	opener.location.replace('../view/main.jsp');
	window.close();
</script>
