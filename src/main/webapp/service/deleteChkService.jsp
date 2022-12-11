<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//deleteService.jsp

// 강제접근 방지
String id = (String) session.getAttribute("id");
if (id == null) {
	out.print("<script>alert('로그인 후 이용해주세요.'); location.href='../view/login.jsp'</script>");
	return;
}

String pw = request.getParameter("pw");
// System.out.println(pw); // ok

MemberDAO memberDao = new MemberDAO();
String chk = memberDao.confirmPw(id);
if (chk == null || chk.equals(pw) == false) {
	out.print("<script>alert('비밀번호를 확인해주세요.'); location.href='../view/updateChk.jsp'</script>");
	return;
}
if (chk.equals(pw)) {
	out.print("<script>location.href='../view/delete.jsp'</script>");
}

memberDao.disconnection();
%>