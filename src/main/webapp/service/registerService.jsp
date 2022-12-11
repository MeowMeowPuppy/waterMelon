<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@page
	import="org.apache.tomcat.websocket.server.WsRemoteEndpointImplServer"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 회원가입 정보
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String confirmPw = request.getParameter("confirmPw");
String name = request.getParameter("name");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String emailAddress = request.getParameter("emailAddress");
String mobile = request.getParameter("mobileNum");
// System.out.println(email);
// System.out.println(mobile);
// System.out.println(email + "@" + emailAddress);

String certificationNum = request.getParameter("certificationNum");
String randomNum = String.valueOf(session.getAttribute("randomNum")); // String.valueOf(Object)를 사용해서 형변환
// System.out.println("가입버튼 눌렀을때 난수 가져오는지 : " + randomNum);

if (id == "" || pw == "" || confirmPw == "" || name == "" || year == "" || month == "" || day == ""
		|| certificationNum == "" || email == "" || emailAddress == "" || mobile == "") {
	out.print("<script>alert('필수 정보를 모두 입력해주세요.'); history.back();</script>");
	return;
}
if (!pw.equals(confirmPw)) {
	out.print("<script>alert('두 패스워드가 일치하지 않습니다.'); history.back();</script>");
	return;
}
if (!certificationNum.equals(randomNum)) {
	out.print("<script>alert('인증번호가 틀렸습니다. 다시 확인해주세요.'); history.back();</script>");
	return;
}

// 아이디 중복체크, 전화번호 중복체크
MemberDAO memberDao = new MemberDAO();
// MemberDTO mobileCheck = memberDao.selectMobile(mobile);
// if (mobileCheck != null){
// 	out.print("<script>alert('전화번호를 확인해주세요.'); history.back();</script>");
// 	return;
// }
MemberDTO idCheck = memberDao.selectId(id);
// System.out.println("idcheck : "+idCheck);
if (idCheck == null) {
	MemberDTO member = new MemberDTO();
	member.setId(id);
	// 	System.out.println(member.getId()); ok
	member.setPw(pw);
	member.setName(name);
	member.setYear(year);
	member.setMonth(month);
	// 1~9는 01~09로 바꿔주는 for문
	for (int i = 1; i < 10; i++) {
		if (day.equals(Integer.toString(i))) {
	day = "0" + Integer.toString(i);
		}
	}
	member.setDay(day);
	member.setEmail(email + "@" + emailAddress);
	member.setBirth(year + month + day);
	member.setMobile(mobile);
	memberDao.insert(member);
	out.print("<script>alert('회원 가입 완료'); location.href='../view/main.jsp';</script>");
	session.invalidate(); // 인증번호(난수) session제거
	// 	System.out.println("세션 제거 됐는지 확인 :"+session.getAttribute("randomNum")); 

} else {
	out.print("<script>alert('이미 가입된 아이디입니다.'); history.back();</script>");
}
memberDao.disconnection();
%>
