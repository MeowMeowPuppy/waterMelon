<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko" class="js">
<head>
<title>WaterMelon::음악이 필요한 순간</title>
<style>
.wrap_login_cont {
	margin-bottom: 60px;
}
#hidden_box{
	width: 20px;
	height: 20px;
	position: relative;
	float: left;
}

</style>
<link rel="stylesheet"  href="../css/login.css">
<link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/o1/12/0/fqmqfvdb0gfndkyfs.css" type="text/css">
<link rel="stylesheet" href="../css/footer.css">
<script src="../js/login.js"></script>
<script type="text/javascript">
//로그인 페이지 아이디 저장 체크박스
function checkBox(){
	saveId = document.getElementById('box_check02');
	if(saveId.classList.contains('on') == false){
		saveId.classList.add('on');
	}else{
		saveId.classList.remove('on');
	}
}
</script>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
</head>
<body>

<%String id = (String)application.getAttribute("autoId");
String loginId = (String)session.getAttribute("id");
/* System.out.println(loginId); */
/* application.removeAttribute("autoId"); */

if (id == null) {// 세션생성 안되면 null값을 반환함
	id="";
}
if (loginId != null) {
%>
	<script>alert('이미 로그인 중입니다.'); location.href='main.jsp';</script>
<%
}
%>
<div id="wrap" class="login">
<div id="hidden_box" onclick="managerLogin()"></div>
	<!-- header -->	
	<div id="member_header">
		<div id="gnb" align="center"><a href="main.jsp"><img src="../img/logo.png" width="400px" ></a></div>
	</div>

	<div id="member_cont_wrap" class="clfix">
			<div class="wrap_login_cont">
				<div class="login_input_area02 style02">
				<form action="../service/loginService.jsp" id="f">	
					<div class="wrap_login_input">
						<div class="wrap_insert">
							<input type="text" name="id" id="id" value="<%=id %>" placeholder="아이디" title="아이디 입력 편집창" class="text51" style="width:366px;">
							<input type="password" name="pw" id="pw" placeholder="비밀번호" title="비밀번호 입력 편집창" class="text51 text_password01" style="width:366px;">
							<div class="wrap_save">
							<% if(id.isEmpty()){ %>
								<div class="box_check02" id="box_check02" >
									<input type="checkbox" id="inpSaveId" class="input_check" name="chk_acc" value="auto" onclick="checkBox()">
									<label for="inpSaveId" class="label_check"><span class="icon"></span>아이디 저장</label>
								</div>
							<%} else{ %>
								<div class="box_check02 on" id="box_check02">
									<input type="checkbox" id="inpSaveId" class="input_check" name="chk_acc" value="auto" onclick="checkBox()" checked="checked">
									<label for="inpSaveId" class="label_check"><span class="icon"></span>아이디 저장</label>
								</div>
							<%} %>
								<div class="wrap_login_info">
									<a href="javascript:" onclick="location.href='../view/register.jsp';" title="회원가입" >회원가입</a>
									<span class="bar">|</span>
									<a href="javascript:" onclick="location.href='../view/findId.jsp';" title="아이디 찾기" class="first_child">아이디 찾기</a>
									<span class="bar">|</span>
									<a href="javascript:" onclick="location.href='../view/findPw.jsp';" title="비밀번호 찾기">비밀번호 찾기</a>
									<span class="bar">|</span>
								</div>
							</div>
						</div>
					</div>
					<div class="wrap_btn">
						<button type="button" title="로그인" class="btn_login03" onclick="loginCheck()">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../footer/footer.jsp"%>
</body>
</html>