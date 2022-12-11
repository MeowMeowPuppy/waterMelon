<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdService</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String findIdName = request.getParameter("findIdName");
String findIdMobile = request.getParameter("findIdMobile");



if(findIdName == "" || findIdMobile == ""){
	out.print("<script>alert('필수 정보입니다.'); history.back();</script>");
	return ;
}


// 이름, 이메일, 전화번호로 받아 검증 있으면 아이디 반환 없으면 null
MemberDAO memberDao = new MemberDAO();
String checkId = memberDao.selectFindId(findIdName, findIdMobile);


if(checkId != null){
 %>
 <script type="text/javascript">
 	alert("아이디는 "+'<%=checkId%>'+ "입니다.");
 	location.href='../view/login.jsp';
 </script>
<%
}else{
	out.print("<script>alert('정보를 다시 입력해주세요.'); history.back();</script>");
}
memberDao.disconnection();
%>
</body>
</html>