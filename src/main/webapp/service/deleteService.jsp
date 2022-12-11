<%@page import="DAO.VoucherDAO"%>
<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

//비 정상적 접근 방지
String id = (String) session.getAttribute("id");
if (id == null) {
String r = "로그인 후 이용해주세요.";
String result = r.replaceAll("\\s", "");
out.print(result);
return;
}
String r = "정상적으로 탈퇴되었습니다. 그동안 이용해 주셔서 감사합니다.";
String result = r.replaceAll("\\s", "");
out.print(result);
%>
<%
// wmember DB에서 삭제
MemberDAO memberDao = new MemberDAO();
memberDao.delete(id);
memberDao.disconnection();
// voucher DB에서 삭제
VoucherDAO voucherDao = new VoucherDAO();
voucherDao.delete(id);
voucherDao.disconnection();
%>
