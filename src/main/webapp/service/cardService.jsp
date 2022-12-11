<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="DTO.VoucherDTO"%>
<%@page import="DAO.VoucherDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String month = request.getParameter("month");
	String num = request.getParameter("num");
	
	if(month == "null" ||  month == null || month.equals("null")){
		%>
		<script> window.open('../view/download.jsp?month=null&num=<%=num%>' ,'_blank','height=261 width=516'); window.close();</script>
		<%
		return;
	}
	
	String id = (String)session.getAttribute("id");
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	Date today = new Date();
	int ticket=0; 
	 try{
	     ticket = Integer.parseInt(month);	         
	     }
	 catch (NumberFormatException ex){
		 ex.printStackTrace();
		 }
	
	Calendar cal1 = Calendar.getInstance();

	cal1.add(Calendar.MONTH,ticket); // 월 연산

	      
	Date finishDate = new Date(cal1.getTimeInMillis());
	// 결과값

	// System.out.println("현재시간 : " + dateFormat.format(today));
	// System.out.println("연산시간 : " + dateFormat.format(finishDate));
		
	String begin = dateFormat.format(today);
	String finish =  dateFormat.format(finishDate);
	
	// 서버 측 입력 값 검증(공백, 길이, 문자열형식을 체크)

	VoucherDAO voucherDao = new VoucherDAO();
	VoucherDTO voucher = new VoucherDTO();
	voucher.setId(id);
	voucher.setTicket(month);
	voucher.setBegin(begin);
	voucher.setFinish(finish);	
	voucherDao.insert(voucher);
	session.setAttribute("voucher", "y");

%>

<script>alert("카드 결제가 완료되었습니다.");opener.location.replace('../view/main.jsp');window.close();</script>