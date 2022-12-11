<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateChk</title>
<link rel="stylesheet" href="../css/myInfo.css">
<script type="text/javascript" src="../js/myInfo.js"></script>
</head>
<body>

<%
	//비 정상적 접근 방지
	String getId = (String)session.getAttribute("id");
	if(getId == null){
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='login.jsp'</script>");
		return;
	}
	MemberDAO dao = new MemberDAO();
	MemberDTO member = dao.selectId(getId);
%>
<div class="wrap">
<div class="content check_password_wrap">
  <div class="margin-wrap">
    <h1><strong class="tit_account">비밀번호 확인</strong></h1>
    <p class="info">회원님의 소중한 정보 보호를 위해, 현재 비밀번호를 확인해 주세요.

    </p>
<!--     <form action="../service/updateChkService.jsp" method="post" id="f"> -->
    <div class="form-holder">
      <div class="form-group">
        <label>아이디</label>
        <div class="email" id="loginId"><%=getId %></div>
      </div>
      <div class="form-group">
        <label class="password">비밀번호</label>
        <div><input type="password" id="password" name="pw" style="margin-top:5px;" placeholder="비밀번호"></div>
      </div>
    </div>
    <div class="btn-group">
    <input type="button" id="check_password" class="btn" class="confirmbtn" value="확인" onclick="pwChk(<%=member.getPw()%>,'update')">
    </div>
<!--     </form> -->
    <p class="center"><a href="findPw.jsp">
    비밀번호가 기억나지 않으세요?</a></p>
  </div>
</div>
      </div>
</body>
<%
dao.disconnection();
%>
</html>