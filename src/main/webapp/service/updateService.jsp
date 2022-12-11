<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//updateService
	request.setCharacterEncoding("utf-8");

	//비 정상적 접근 방지
	String id = (String)session.getAttribute("id");
	if(id == null){
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='../view/login.jsp'</script>");
		return;
	}

	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	//System.out.println(pw);
	//System.out.println(name);
	//System.out.println(email);
	// ok
	
	MemberDAO memberDao = new MemberDAO();
		
	if (pw != null && pw != ""){
		memberDao.updatePw(pw, id);
		session.setAttribute("pw", pw);
	}
	if (name != null && name != ""){
		memberDao.updateName(name, id);
		session.setAttribute("name", name);
	}
	if (email != null && email != ""){
		memberDao.updateEmail(email, id);
		session.setAttribute("email", email);
	}
	
	out.print("'저장되었습니다.'");
		
	
	memberDao.disconnection();
	
%>