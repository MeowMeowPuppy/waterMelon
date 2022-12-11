<%@page import="DTO.VoucherDTO"%>
<%@page import="DAO.VoucherDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginService</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String chk_acc = request.getParameter("chk_acc");
// 체크되어 있을때 auto, 체크되어 있지 않을때 null
// 체크되어 있을때 null, 체크되어 있지 않을때 auto1
/* System.out.println("나는" + chk_acc); */
if(id == "" || pw == ""){
	out.print("<script>alert('필수 정보입니다.');); history.back(</script>");
	return ;
}

//관리자(admin) 로그인 방지
if(id.equals("admin")){
	out.print("<script>alert('아이디 또는 비밀번호를 확인해주세요.'); location.href='../view/login.jsp';</script>");
	return;
}

// 아이디/비밀번호 데이터베이스 조회
MemberDAO memberDao = new MemberDAO();
MemberDTO check = memberDao.selectId(id);
/* System.out.println(application.getAttribute("autoId")); */


//이용권 유/무 데이터 베이스 조회
VoucherDAO voucherDao = new VoucherDAO();
String finish = voucherDao.getFinish(id);
/* System.out.println(finish); */

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");//yyyyMMbb로 날짜형식 초기화
Date today = new Date();//오늘 날짜

int compare = 9;

if (finish != null){//이용권 구매이력이 있을 경우
	compare = finish.compareTo(dateFormat.format(today));
}
/* System.out.println(compare); */

//로그인 성공, 실패
if(check != null && check.getPw().equals(pw)){//로그인 성공시
	session.setAttribute("id", id);
	session.setAttribute("name", check.getName());
	session.setAttribute("birth", check.getBirth());
	session.setAttribute("email", check.getEmail());
	session.setAttribute("mobile", check.getMobile());
	session.setAttribute("self", "n");
	if(compare == 1 || compare == 0 ){//이용권 기한이 오늘까지거나 더 남았을 경우
		session.setAttribute("voucher", "y");
	}else if (compare < 0 || compare == 9){//finish가 null (구매이력이 없음)이거나 이용권 기한이 지났을 경우
		if(compare < 0){//이용권 기한이 지났을 경우
			voucherDao = new VoucherDAO();
			voucherDao.delete(id);//DB voucher테이블에서 삭제
		}
		session.setAttribute("voucher", "n");
	}
// 	System.out.println(chk_acc);
	if (chk_acc == null){//아이디 저장 체크되지 않은 경우
		application.removeAttribute("autoId");
	}else if(chk_acc.equals("auto")){// 아이디 저장 체크된 경우
		application.setAttribute("autoId", id);//application으로 id 값 저장
	}
	out.print("<script>location.href='../view/main.jsp';</script>");
}else{//로그인 실패 시
	out.print("<script>alert('아이디 또는 비밀번호를 확인해주세요.'); location.href='../view/login.jsp';</script>");
}
memberDao.disconnection();
voucherDao.disconnection();
%>
</body>
</html>