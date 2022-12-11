<%@page import="DTO.VoucherDTO"%>
<%@page import="DAO.VoucherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function admin(id) {
      console.log(id);
      if(id == 'admin'){
         location.href="manager.jsp";
         return;
      }
   }
</script>
<%
String id = (String) session.getAttribute("id");
String voucher = (String) session.getAttribute("voucher");

String ticket ="";
String fireDay = "";

if(id!=null && id != ""){
VoucherDTO vc = new VoucherDTO();
if(voucher!=null||voucher!=""){
if(voucher=="y"){
VoucherDAO voucherDao = new VoucherDAO();
vc = voucherDao.getVoucher(id);
ticket = vc.getTicket();
fireDay = vc.getFinish();
fireDay = fireDay.substring(0,4)+"."+fireDay.substring(4, 6)+"."+fireDay.substring(6);
voucherDao.disconnection();
   }
}
}
%>
<script src="https://kit.fontawesome.com/8aec6793ef.js"
   crossorigin="anonymous"></script>

</head>
<body>
   <div class="header">
      <div class="header_container">
         <div class="item" onclick="admin('<%=id%>')">
            <%
            if (id == null || id == "") {
            %>
            <label>waterMelon 방문을 환영합니다</label>
            <%
            } else {
            %>
            <label><%=id%>님의 방문을 환영합니다.</label>
            <%
            if(voucher=="n"){
            %>
            <div class="no_voucher_info"><label>이용권을 구매해주세요</label></div>
            <%
            } else if(voucher=="y"){
            %>
            <div class="voucher_info">
               <label><%=ticket%>개월 스트리밍 사용중</label><br>
               <label>종료일 : <%=fireDay%></label>
            </div>
            <%
            }
            }
            %>
         </div>
         <div class="item">
            <div id="logo" onclick="goto()"></div>
         </div>
         <div class="item">
            <div class="search_box">
               <div class="input_box">
                  <input type="text" id="input" onkeyup="searchEnter()">
               <span id="search_logo"> <i
                  class="fa-solid fa-magnifying-glass" onclick="search()"></i>
               </span>
               </div>
            </div>

         </div>
         <div class="item">
            <div class="header_menu">
               <ul>
                  <li><a id="buy_voucher" onclick="goto('buyVoucher')"> 이용권 구매</a></li>
                  <%
                  if (id == null) {
                  %>
                  <li><a id="open_regist" onclick="location.href='../view/register.jsp'"> 회원가입 </a></li>
                  <li><a id="open_login" onclick="location.href='../view/login.jsp'"> 로그인 </a></li>
                  <%
                  } else {
                  %>
                  <li><a id="myInfo" onclick="goto('myInfo')"> 마이페이지 </a></li>
                  <li><a href="../service/logoutService.jsp"> 로그아웃 </a></li>
                  <%
                  }
                  %>
                  <li><a id="open_home" onclick="goto()">홈페이지</a></li>
               </ul>
               <div class="userWelcom"></div>
            </div>
         </div>
      </div>
   </div>