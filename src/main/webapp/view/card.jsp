<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js win chrome chrome1 webkit webkit5 chrome105 webkit537" lang="ko">
<head>
<meta charset="UTF-8">
<title>카드 결제</title>
<%
String month = request.getParameter("month");
String num = request.getParameter("num");
if(month == null)
	month = "null";
%>
<!-- 카드로 결제하기 클릭시 -->
<!-- http://localhost:8085/waterMelon/view/card.jsp -->

<script src="../js/payPopup.js"></script>
<link href="../css/card.css" rel="stylesheet">
<body>
<div class="login-box">
  <h2>카드결제</h2>
  <form action="../service/cardService.jsp" id="f" method="post">
    <div class="user-box">
      <input type="text" name="cardnumber" id="cardnumber" required maxlength="16" onblur="cardCon();">
      <label>카드번호("-"빼고 작성)</label><br>
      <span id="number_msg"></span><br><br>
    </div>
    <div class="user-box">
      <input type="password" name="cardpw" id="cardpw" maxlength="4" required  onblur="pwCon();">
      <label>비밀번호</label><br>
      <span id="pw_msg"></span><br><br>
    </div>
    <br>
     <div class="user-box">
      <input type="password" name="cardcvc" id="cardcvc" maxlength="3" required  onblur="cvcCon();">
      <label>CVC</label><br>
      <span id="cvc_msg"></span><br><br>
    </div>
    <br>
    <div class="user-box">
      <input type="text" name="email" id="email" required  onblur="emailCon();">
      <label>이메일(결제정보가 전송됩니다)</label><br>
      <span id="email_msg"></span><br><br>
    </div>
    <br>
    <label onclick="cardEndless('<%=month%>','<%=num%>');"><a>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      결제하기
    </a></label>
  </form>
</div>
</body>
</html>