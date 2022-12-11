<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WaterMelon</title>
<style>
#f {
	margin-bottom: 101px;
}
</style>
<link rel="stylesheet" href="../css/register.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet"
	href="https://cdnimg.melon.co.kr/static/member/resource/style/o1/12/0/fqmqfvdb0gfndkyfs.css"
	type="text/css">
<script src="../js/register.js"></script>
</head>
<body>
	<form action="../service/registerService.jsp" method="post" id="f">
		<div align="center" class="logo">
			<a href="main.jsp"><img src="../img/logo.png" width="400px" ></a>
		</div>
		<table id="content">
			<caption></caption>
			<!-- 아이디 영역 -->
			<tr>
				<th>아이디</th>
			</tr>
			<tr>
				<td colspan="3"><input maxlength="15" type="text" id="id"
					name="id" onblur="idCheck()"></td>
			</tr>
			<tr>
				<td><br>
				<span id="id_msg"></span></td>
			</tr>

			<!--  비밀번호 영역 -->
			<tr>
				<th>비밀번호</th>
			</tr>
			<tr>
				<td colspan="3"><input type="password" id="pw" name="pw"
					onblur="pwCheck()"></td>
			</tr>
			<tr>
				<td><span id="pw_msg1"><img id="pwImg" src=""></span><span
					id="pw_msg2"></span></td>
			</tr>

			<!--  비밀번호 재확인 영역 -->
			<tr>
				<th>비밀번호 재확인</th>
			</tr>
			<tr>
				<td colspan="3"><input type="password" id="confirmPw"
					name="confirmPw" onblur="confirmCheck()"> <br></td>
			</tr>
			<tr>
				<td><br> <span id="co_msg"></span></td>
			</tr>

			<!--  이름 영역 -->
			<tr>
				<th>이름</th>
			</tr>
			<tr>
				<td colspan="3"><input type="text" id="name" name="name"
					onblur="nameCheck()"> <br></td>
			</tr>
			<tr>
				<td><br> <span id="name_msg"></span></td>
			</tr>

			<!--  생년월일 영역 -->
			<tr>
				<th>생년월일</th>
			</tr>

			<tr id="birth">
				<td class="year"><input maxlength="4" type="text"
					placeholder="년(4자)" id="year" name="year" onblur="birth()"></td>
				<td><select id="month" name="month" onblur="birth()">
						<option value="" selected="selected">월</option>
						<option value="01">1월</option>
						<option value="02">2월</option>
						<option value="03">3월</option>
						<option value="04">4월</option>
						<option value="05">5월</option>
						<option value="06">6월</option>
						<option value="07">7월</option>
						<option value="08">8월</option>
						<option value="09">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
				</select></td>
				<td><input maxlength="2" type="text" placeholder="일" id="day"
					name="day" onblur="birth()"> <br></td>
			</tr>

			<tr>
				<td><br> <span id="birth_msg"></span></td>
			</tr>

			<!--  본인 확인 이메일 영역 -->
			<tr>
				<th>본인 확인 이메일</th>
			</tr>
			<tr id="birth">
				<td colspan="1"><input type="text" onblur="emailCheck()" id="email" name="email"></td>
				<td><span class="emailSpan">@</span></td>
				<td><select id="emailAddress" name="emailAddress" onblur="emailCheck()">
						<option value="" selected="selected">이메일 주소</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
				</select></td>
			</tr>
			<tr>
				<td><br> <span id="email_msg"></span></td>
			</tr>

			<!--  휴대전화 영역 -->
			<tr>
				<th>휴대전화</th>
			</tr>
			<tr id="mobile">
				<td colspan="2"><input id="mobileNum" name="mobileNum"
					onblur="numCheck()" type="text" placeholder="전화번호 입력(번호만 입력해주세요)"></td>
				<td colspan="1">
				<button type="button" onclick="randomNum()">인증번호받기</button></td>
			</tr>

			<tr>
				<td colspan="3"><input type="text" id="certificationNum"
					onblur="randomNumCheck()" name="certificationNum"
					placeholder="인증번호 입력하세요"></td>
			</tr>
			<tr>
				<td><br> <span id="mobile_msg"></span></td>
			</tr>
			<tr>
				<td><button type="button" onclick="regist()">가입하기</button></td>
			</tr>
		</table>
	</form>
	<%@ include file="../footer/footer.jsp"%>
</body>
</html>