<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="stylesheet"  href="..//css/login.css">
<link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/o1/12/0/fqmqfvdb0gfndkyfs.css" type="text/css">
<script src="../js/login.js"></script>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<style type="text/css">
h1{
	font: initial !important;
	font-size: 30px !important;
}
h2{
	font-size: 20px !important;
}
</style>
</head>
<body>

<div id="wrap" class="login">
	<!-- header -->	
	<div id="member_header">
		<div id="gnb" align="center"><a href="login.jsp"><img src="../img/logo.png" width="400px" ></a></div><br>
		<h1>관리자 로그인</h1>
	</div>

	<div id="member_cont_wrap" class="clfix">
			<div class="wrap_login_cont">
				<div class="login_input_area02 style02">
				<form action="../service/managerLoginService.jsp" id="f">	
					<div class="wrap_login_input">
						<div class="wrap_insert">
							<input type="text" name="id" id="id" placeholder="아이디" title="아이디 입력 편집창" class="text51" style="width:366px;">
							<input type="password" name="pw" id="pw" placeholder="비밀번호" title="비밀번호 입력 편집창" class="text51 text_password01" style="width:366px;">
						</div>
					</div>
					<div class="wrap_btn">
						<button type="button" title="로그인" class="btn_login03" onclick="managerLoginCheck()">로그인</button>
					</div>
				</form>
				<div align="center"><h2>계정분실시 업체로 연락해주세요</h2></div>
			</div>
		</div>
	</div>
</div>

</body>
</html>