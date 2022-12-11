<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>휴대폰 결제</title>
<!-- 휴대폰 결제으로 결제하기 클릭시 -->
<!-- http://localhost:8085/waterMelon/view/phone.jsp -->

<script src="../js/payPopup.js"></script>
<link href="../css/phone.css" rel="stylesheet">

<%
String month = request.getParameter("month");
String num = request.getParameter("num");
if(month == null)
	month = "null";
%>

<body>
<div class="login-box">
  <h2>휴대폰결제</h2>
  <form action="../service/phoneService.jsp?month=<%=month %>&num=<%=num %>" method="post" id="f">
    <div class="user-box">
      <input type="text" name="mobileNum" id="mobileNum" maxlength="14" required onblur="phoneCon();">
      <label>휴대폰번호("-"빼고 작성)</label>
      <span id="phone_msg"></span><br>
    </div>
    <div class="user-box" onclick="certificationNum();">
      <div class="button">
             <p class="btnText">인증번호 발송</p>
          <div class="btnTwo">
            <p class="btnText2">발송하기</p>
       </div>
     </div>
   </div>
<br>
     <div class="user-box" >
      <input type="password" name="connumberCK" id="connumberCK" maxlength="6" 
      required onblur="randomNumf()">
      <label>인증번호 확인</label>
      <span id="connumber_msg"></span><br>
    </div>
    <br>
    <div class="user-box">
      <input type="text" name="email2" id="email2" required  onblur="emailCon2();">
      <label>이메일(결제정보가 전송됩니다)</label>
      <span id="email2_msg"></span><br>
    </div>
    <br>
    <a href="#" onclick="return phoneEndless()">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      결제하기
    </a>
  </form>
</div>
</body>
</html>