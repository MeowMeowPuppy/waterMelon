<%@page import="service.PageService"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager</title>
<!-- 기능
	화원관리 (강제 탈퇴) 
	//고객센터 답글
	노래 업데이트
 -->
 <style type="text/css">
caption{
	font-size: 30px;
	padding-bottom: 10px;
	/* float: left; */
	font-weight: bold;
}
table {
	margin-top: 60px;
	/* border: 1px solid black; */
	border-collapse: collapse;
}

th {
	width: 50px;
}

td {
	padding: 0 20px 0 20px;
}

tr {
	height: 30px;
}

a {
	text-decoration: none;
	color: black;
}
.wrap2 {
	margin-left: 280px;
}

.btn-search {
	width: 120px;
	height: 31px;
    border: 1px solid rgba(0,0,0,0.14);
    border-radius: 17px;
    color: #999;
    font-size: 14px;
}
.input-search{
	height: 20px;
	width : 300px;
	border-radius: 17px;
	border: 3px solid ;
	margin: 0px 20px 0px 20px;
}
.select{
	height: 30px;
	width : 100px;
	border-radius: 5px;
}
#member_update{
	/* display: block;*/
	display: none;	
}

</style>

<link rel="stylesheet" href="https://cdnimg.melon.co.kr/services/css/myinfo-a743942740.css" type="text/css">
<script src="../js/manager.js" type="text/javascript"></script>
</head>
<body>

<aside class="side-myinfo">
	<strong class="">
		<a href="main.jsp" class="" title="WaterMelon 로고 - 홈으로 이동">
			<img src="../img/logo.png"  width="200px">
		</a>
	</strong>
	<nav class="side-menu">
		<ul class="list-lnb">
			<li class="on" >
				<a href="manager.jsp" class="link-lnb">
					<span class="txt-link">회원 정보관리</span>
				</a>
			</li>
			<li class="" >
				<a href="../view/upload.jsp" class="link-lnb">
					<span class="txt-link">음원 관리</span>
				</a>
			</li>
			<li class="" >
				<a href="../view/sales.jsp" class="link-lnb">
					<span class="txt-link">매출</span>
				</a>
			</li>
		</ul>
		<ul class="list-lnb">
			<li>
				<a href="../service/logoutService.jsp" class="link-lnb">
					<span class="txt-lnb">로그아웃</span>
				</a>
			</li>
		</ul>
	</nav>
</aside>
<%
String id = (String)session.getAttribute("id");

String cp = request.getParameter("currentPage");
int currentPage = 0;
try {
	currentPage = Integer.parseInt(cp);
} catch (Exception e) {
	currentPage = 1;
}
if (currentPage < 1){
	currentPage = 1;
}
// pageBlock, 하나의 페이지에 보여질 회원의 수 
int pageBlock = 5;


// 데이터베이스에서의 시작, 끝 정보를 begin, end에 저장하여 list메서드 전달.
int end = currentPage * pageBlock;
int begin = end + 1 - pageBlock;

//검색 값 받음
String search = request.getParameter("search");
if (search == null)
	search = "";
String select = request.getParameter("select");
if (select == null)
	select = "";
List<MemberDTO> members = null;
MemberDAO memberDao = new MemberDAO();
int totalCount = 0;

if (select == null || select == "") {//옵션이 전체인 경우
	if(search == "" || search == null){//옵션이 전체이면서 검색어가 없는 경우
// 		System.out.println("select : " + select);
		members = memberDao.list(begin, end);
		totalCount = memberDao.count();
	}
	// 옵션이 이면서 전체이면서 검색어가 있는 경우
	members = memberDao.list(begin, end, select, search);
	totalCount = memberDao.count(select, search);
}else {
	if (search == "" || search == null) {//옵션이을 아이디(이메일, 이름)로 선택하고 검색어 없은 경우
		/* System.out.println("search : " + search); */
		response.sendRedirect("manager.jsp");
		return;
	}
	//옵션이을 아이디(이메일, 이름)로 선택하고 검색어가 있는 경우
// 	System.out.println("select : " + select);
//	System.out.println("search : " + search); 
	members = memberDao.list(begin, end, select, search);
	totalCount = memberDao.count(select, search);
}

//pageControl에 필요한 정보 4가지 전달.
String url = "manager.jsp?select=" + select + "&search=" + search + "&currentPage=";
/*  select와 search 값은 URL에 계속 가져와야 한다. 안그럼 패이지이등 할때 사라짐 */
String result = PageService.getNavi(url, currentPage, pageBlock, totalCount);


memberDao.disconnection();
%>
	<div id="wrap" class="wrap2">
		<div class="search" align="center">
		<form>
		<table>
			<tr>
				<td>
				<select name="select" class="select" >
					<%
					if (select == null || select == "") {
					%>
						<option value="">전체</option>
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="email">이메일</option>
					<%
					} else if (select.equals("id")) {
					%>
						<option value="">전체</option>
						<option value="id" selected="selected">아이디</option>
						<option value="name">이름</option>
						<option value="email">이메일</option>
					<%
					} else if (select.equals("name")) {
					%>
						<option value="">전체</option>
						<option value="id">아이디</option>
						<option value="name" selected="selected">이름</option>
						<option value="email">이메일</option>
						<!-- selected="selected" 값출력 -->
					<%
					} else if (select.equals("email")) {
					%>
						<option value="">전체</option>
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="email" selected="selected">이메일</option>
						<!-- selected="selected" 값출력 -->
					<%
					}
					%>
				</select> 
				<input type=text name='search' class="input-search" value="<%=search%>" />
				<input type=submit value='검색' class="btn-search" style="width: 60px;" />
				</td>
			</tr>
		</table>
		</form>
		</div>
		<div class="member" id="member" align="center">
			<table border="1">
				<caption>회원 정보</caption>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>전화번호</th>
				</tr>
				<%
				int i=0;
					for (MemberDTO member : members) {
						i++;
						if(member.getId().equals("admin")){
							continue;
						}
				%>
				<tr>
					<td onclick="getId('<%=i%>');" id="clickId<%=i%>"><%=member.getId()%></td>
					<td ><%=member.getPw()%></td>
					<td id="clickName<%=i%>"><%=member.getName()%></td>
					<td id="clickBirth<%=i%>"><%=member.getBirth()%></td>
					<td id="clickEmail<%=i%>"><%=member.getEmail()%></td>
					<td id="clickMobile<%=i%>"><%=member.getMobile()%></td>
				</tr>
				<%}%>
			</table>
			<div id="page" align="center">
				<%=result%>
			</div>
		</div>
		<div align="center" id="member_update">
		<table border="1">
		<caption>회원 수정</caption>
		<tr>
			<td>
				<form action="../service/managerService.jsp" method="post" id="f">
					<input type="text" name="userId" id="id" value="" readonly="readonly"><br><!-- readonly="readonly" 수정불가 읽기 전용 -->
					<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
					<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm" onkeyup="pwCheck()">
					<label id="label">(*필수 체크)</label><br>
					<input type="text" name="userName" id="userName" placeholder="이름"><br>
					<input type="text" name="birth" id='birth' placeholder="생년월일" ><br>
					<input type="text" name="email" id='email' placeholder="이메일"><br>
					<input type="text" name="mobile" id='mobile' placeholder="전화번호"><br>
					<input type="button" value="회원수정" onclick="updateClick()">
					<!-- onclick="allCheck()" -->
				</form>			
			</td>
		</tr>
		
		</table>
	
	</div>
	</div>
</body>
</html>