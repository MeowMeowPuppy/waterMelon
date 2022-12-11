<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateChk</title>
<link rel="stylesheet" href="../css/myInfo.css">

<style>
.content .wrap{
	margin-top:240px;
}
#box {
	display: flex;
	max-width: 840px;
	margin-left: 25%;
}

#box1 {
	margin-right: 5%;
}

#mobileNum {
	position: relative;
	top: 13px;
}
</style>
<script type="text/javascript" src="../js/myInfo.js"></script>
</head>
<body>
	<%
	// 비 정상적 접근 방지
	String getId = (String) session.getAttribute("id");
	if (getId == null) {
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='login.jsp'</script>");
		return;
	}

	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String email = (String) session.getAttribute("email");
	String birth = (String) session.getAttribute("birth");
	String mobile = (String) session.getAttribute("mobile");

	birth = birth.substring(0, 4) + "년 " + birth.substring(4, 6) + "월 " + birth.substring(6, 8) + "일";
	mobile = mobile.substring(0, 3) + " - " + mobile.substring(3, 7) + " - " + mobile.substring(7);

	// session 없애는건 로그아웃할 때 해주면됨
	// 		session.invalidate(); // 병합 전 임시
	%>


	<div class="wrap">
		<div class="content check_password_wrap">
<!-- 			<form action="../service/updateService.jsp" method="post" id="f"> -->
				<div class="margin-wrap">
					<h1>
						<strong class="tit_account">정보 수정</strong>
					</h1>
					<div class="form-holder">
						<div class="form-group">
							<label>아이디</label>
							<div class="email" id="loginId"><%=id%></div>
						</div>
						<div class="form-group">
							<label class="password">비밀번호</label>
							<div>
								<input type="password" id="password" name="pw"
									style="margin-top: 5px;"
									placeholder="(8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.)">
							</div>
						</div>
						<div class="form-group">
							<label class="password">이름</label>
							<div>
								<input type="text" id="name" name="name"
									style="margin-top: 5px;" placeholder="<%=name%>">
							</div>
						</div>
						<div class="form-group">
							<label class="password">이메일</label>
							<div>
								<input type="text" id="email" name="email"
									style="margin-top: 5px;" placeholder="<%=email%>">
							</div>
						</div>
						<div class="form-group">
							<label class="password">생년월일</label>
							<div class="email" id="mobileNum"><%=birth%></div>
						</div>
						<div class="form-group">
							<label class="password">핸드폰 번호</label>
							<div class="email" id="mobileNum"><%=mobile%></div>
						</div>
					</div>
					<div id="box" align="center">
						<div class="btn-group" id="box1">
							<input type="button" id="check_password" class="btn"
								class="confirmbtn" value="저장" onclick="inputChk(); goto()">
						</div>
						<div class="btn-group" id="box2">
							<input type="button" id="check_password" class="btn"
								class="confirmbtn" value="이전"
								onclick="goto('myInfo')">
						</div>
					</div>
				</div>
<!-- 			</form> -->
		</div>

	</div>
</body>
</html>