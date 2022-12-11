<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPw</title>
<link rel="stylesheet" href="../css/footer.css">
<style>
body {
	background-color: #F6F6F6;
}

#content {
	margin: 0 auto;
	width: 450px;
	table-layout: fixed;
}

td, th {
	width: 100%;
	
}

th {
	text-align: left;
	padding-left: 10px !important;
	font-size : 13px !important;
}

input {
	width: 90%;
	margin: 5px;
	height: 40px !important;
}

.id_email {
	position: relative;
	top: -30px;
	left: 315px;
	color: gray
}

.logo {
	height: 300px !important;
}

a {
	
}
.number {
	width: 410px;
	height: 38px;
	margin-left: 5px;
}

button[type="button"] {
	width: 420px;
	height: 50px;
	background: #EF6161 !important;
	color: white;
	border: 1px gray;
	margin-left: 5px;
}
input[type=text], input[type=password] input[type=email], input.text {
    font-size: 13px !important;
    font-family: "Dotum","돋음","Apple Gothic",sans-serif;
}
#f {
	margin-bottom: 35px;
}


#id_msg {font-size:11px; color:red; position:relative; top:-30px; left: 10px;}
#co_msg {font-size:11px; color:red; position:relative; top:00px; left: 10px;}
#pw_msg1{font-size:14px; display: block; width: 70px;color:red; position:relative; top:-35px; left: 350px;}
#pw_msg2{font-size:11px; color:red; position:relative; top:-20px; left: 10px;}
#name_msg {font-size:11px; color:red; position:relative; top:00px; left: 10px;}
#birth_msg {font-size:11px; color:red; position:relative; top:00px; left: 10px;}
</style>
<link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/o1/12/0/fqmqfvdb0gfndkyfs.css" type="text/css">
<script src="../js/login.js"></script>
</head>
<body>
	<div id="member_header">
		<div id="gnb" align="center"><a href="main.jsp"><img src="../img/logo.png" width="400px"></a></div>
	</div>
	<form action="../service/findPwService.jsp" id="f">
		<table id="content" border="1">
			<!--  아이디 영역 -->
			<tr>
				<th>아이디</th>
			</tr>
			<tr>
				<td colspan="3">
					<input type="text" id="findPwId" name="findPwId" placeholder="아이디"> 
				</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<!--  이름 영역 -->
			<tr>
				<th>이름</th>
			</tr>
			<tr>
				<td colspan="3"><input type="text" id="findPwName" name="findPwName" placeholder="이름"></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			
			<!--  휴대전화 영역 -->
			<tr>
				<th>휴대전화</th>
			</tr>
			<tr>
				<td colspan="3"><input type="text" placeholder="숫자만 입력해주세요" name="findPwMobile" id="findPwMobile" maxlength="11" ></td>	
			</tr>
		
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td><button type="button" onclick="findPwCheck()">비밀번호 찾기</button></td>
			</tr>
		</table>
	</form>
	<%@ include file="../footer/footer.jsp"%>
</body>
</html>