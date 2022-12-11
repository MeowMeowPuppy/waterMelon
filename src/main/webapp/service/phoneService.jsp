<%@page import="DTO.VoucherDTO"%>
<%@page import="DAO.VoucherDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
request.setCharacterEncoding("utf-8");

String phone = request.getParameter("mobileNum");
String certi = request.getParameter("connumberCK");
String random = String.valueOf(session.getAttribute("randomNum"));
// System.out.print(certi +"   "+ random );
if(certi == null){
	out.print("<script>history.back();</script>");
	return;
}


if(certi.equals(random)){	

	String month = request.getParameter("month");
	String num = request.getParameter("num");
	
	if (month == "null" ||  month == null || month.equals("null")) {
		%>
		<script> window.open('../view/download.jsp?month=null&num=<%=num%>' ,'_blank','height=261 width=516'); window.close();</script>
		<%
		return;
	}
	
	String id = (String) session.getAttribute("id");
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	Date today = new Date();
	int ticket = 0;
	try {
		ticket = Integer.parseInt(month);
	} catch (NumberFormatException ex) {
		ex.printStackTrace();
	}
	
	Calendar cal1 = Calendar.getInstance();
	
	cal1.add(Calendar.MONTH, ticket); // 월 연산
	
	Date finishDate = new Date(cal1.getTimeInMillis());
	// 결과값
	
	// System.out.println("현재시간 : " + dateFormat.format(today));
	// System.out.println("연산시간 : " + dateFormat.format(finishDate));
	
	String begin = dateFormat.format(today);
	String finish = dateFormat.format(finishDate);
	
	// 서버 측 입력 값 검증(공백, 길이, 문자열형식을 체크)
	
	VoucherDAO voucherDAO = new VoucherDAO();
	VoucherDTO voucher = new VoucherDTO();
	voucher.setId(id);
	voucher.setTicket(month);
	voucher.setBegin(begin);
	voucher.setFinish(finish);
	voucherDAO.insert(voucher);
	session.setAttribute("voucher", "y");
	
	out.print("<script> alert('핸드폰 결제가 완료되었습니다.'); </script>");
	out.print("<script> opener.location.replace('../view/main.jsp'); </script>");
	out.print("<script> window.close(); </script>");
	
}else {
	session.removeAttribute("randomNum");
	out.print("<script> alert('인증번호가 일치하지않습니다.'); history.back();</script>");
}
%>
<script>alert("휴대폰 결제가 완료되었습니다.");opener.location.replace('../view/main.jsp');window.close();</script>