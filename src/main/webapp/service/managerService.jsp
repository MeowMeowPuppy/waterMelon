<%@page import="DAO.MemberDAO"%>
<%@page import="DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%	
request.setCharacterEncoding("utf-8");

String userId = request.getParameter("userId");
String pw = request.getParameter("pw");
String userName = request.getParameter("userName");
String birth = request.getParameter("birth");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");


/* 		System.out.println("userId : "+ userId);
System.out.println("pw : "+ pw);
System.out.println("userName : "+ userName);
System.out.println("birth : "+ birth);
System.out.println("email : "+ email);
System.out.println("mobile : "+ mobile);
*/
MemberDTO member = new MemberDTO();
member.setId(userId);
member.setPw(pw);
member.setName(userName);
member.setBirth(birth);
member.setEmail(email);
member.setMobile(mobile);

MemberDAO memberDao = new MemberDAO();
memberDao.update(member);
memberDao.disconnection();

response.sendRedirect("../view/manager.jsp");
%>