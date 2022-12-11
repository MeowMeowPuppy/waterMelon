<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPwService</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String findPwId = request.getParameter("findPwId");
String findPwName = request.getParameter("findPwName");
String findPwMobile = request.getParameter("findPwMobile");
String id = (String)session.getAttribute("id");

if(findPwId == "" || findPwName == "" || findPwMobile == "" ){
	out.print("<script>alert('필수 정보입니다.'); history.back();</script>");
	return ;
}
//이름, 이메일, 전화번호로 받아 검증 있으면 아이디 반환 없으면 null
MemberDAO memberDao = new MemberDAO();
String checkPw = memberDao.selectFindPw(findPwId, findPwName, findPwMobile);

if(checkPw != null){
%>
<script type="text/javascript">
	 alert("비밀번호는 "+'<%=checkPw%>'+ "입니다.");
	 <%
	 if(id!=null){%>
	 window.close();
	 <%
	 } else{%>
	 	location.href="../view/login.jsp";
	 <%}
	 %>
</script>
<%
}else{
	out.print("<script>alert('정보를 다시 입력해주세요.'); history.back();</script>");
}
memberDao.disconnection();
%>

</body>
</html>