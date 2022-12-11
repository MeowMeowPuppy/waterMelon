<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>managerLoginService</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
if(id == "" || pw == ""){
	out.print("<script>alert('필수 정보입니다.');); history.back(</script>");
	return ;
}
MemberDAO memberDao = new MemberDAO();
MemberDTO check = memberDao.selectId(id);
if(check != null && check.getPw().equals(pw) && check.getId().equals("admin")){
	out.print("<script>location.href='../view/manager.jsp';</script>");
	session.setAttribute("id", id);
	session.setAttribute("name", check.getName());
	session.setAttribute("birth", check.getBirth());
	session.setAttribute("email", check.getEmail());
	session.setAttribute("mobile", check.getMobile());
	session.setAttribute("self", "n");
	session.setAttribute("voucher", "y");
}else{
	out.print("<script>alert('아이디 또는 비밀번호를 확인해주세요.'); location.href='../view/managerLogin.jsp';</script>");
}
memberDao.disconnection();
%>
</body>
</html>