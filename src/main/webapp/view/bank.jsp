<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html
	class="no-js win chrome chrome1 webkit webkit5 chrome105 webkit537"
	lang="ko">
<head>
<meta charset="UTF-8">
<title>환불 계좌</title>

<!-- 카드로 결제하기 클릭시 -->
<!-- http://localhost:8085/waterMelon/pay/card.jsp -->

<script src="../js/payPopup.js"></script>
<link href="../css/card.css" rel="stylesheet">
<body>
	<div class="login-box">
		<h2>환불 계좌</h2>
		<form>
			<div class="user-box">
				<select name="bank" id="bank">
					<option value="1">국민은행</option>
					<option value="2">신한은행</option>
					<option value="3">우리은행</option>
				</select><br><Br>
			</div>
			<div class="user-box">
				<input type="text" name="bankNum" id="bankNum" maxlength="16" required
					onkeyup="inputChk()"> <label>계좌번호("-"빼고 작성)</label> <span
					id="bank_msg"></span><br>
			</div>
			<div align="center">
				<label onclick="CHK()"><a>
					<span></span><span></span><span></span> <span></span> 확인
				</a></label> 
				<label onclick="window.close()"><a > <span></span>
				 <span></span><span></span><span></span>취소
				</a></label>
			</div>
		</form>
	</div>
</body>
</html>