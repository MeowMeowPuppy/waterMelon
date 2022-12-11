<%@page import="service.PageService"%>
<%@page import="DTO.MusicDTO"%>
<%@page import="DAO.MusicDAO"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>music upload</title>
<style type="text/css">
#gnb {
	margin: 60px;
}

#music table {
	margin-top: 60px;
	border-collapse: collapse;
}

#music td {
	padding: 0 20px 0 20px;
}

#music tr {
	height: 30px;
}

a {
	text-decoration: none;
	color: black;
}

.login {
	margin-left: 280px;
}

#bottom{
	height: 300px;
}
div#top {
	position: absolute;
	margin-top: 50px;
	left: 25%;
}

div#mid {
	position: absolute;
	margin-top: 30px;
	left: 50%;
}

div#bot {
	position: absolute;
	margin-top: 11px;
	left: 75%;
}

#search {
	margin-top: 50px;
}

#cap {
	margin-bottom: 10px;
	font-size: 25px;
	font-weight: bold;
}

#next {
	margin-top: 10px;
}

.btn-search {
	width: 15px;
	height: 31px;
	border: 1px solid rgba(0, 0, 0, 0.14);
	border-radius: 17px;
	color: #999;
	font-size: 14px;
}

.input-search {
	height: 20px;
	width: 300px;
	border-radius: 17px;
	border: 3px solid;
	margin: 0px 20px 0px 20px;
}

.select {
	height: 30px;
	width: 100px;
	border-radius: 5px;
}

.btn-delete {
	margin-top: 7px;
	height: 15px !important;
}
</style>
<link rel="stylesheet"
	href="https://cdnimg.melon.co.kr/services/css/myinfo-a743942740.css"
	type="text/css">
<script src="../js/manager.js"></script>
</head>
<body>
	<aside class="side-myinfo">
		<strong class=""> <a href="main.jsp" class=""
			title="WaterMelon 로고 - 홈으로 이동"> <img src="../img/logo.png"
				width="200px">
		</a>
		</strong>
		<nav class="side-menu">
			<ul class="list-lnb">
				<li class=""><a href="manager.jsp" class="link-lnb"> <span
						class="txt-link">회원 정보관리</span>
				</a></li>
				<li class="on"><a href="../view/upload.jsp" class="link-lnb">
						<span class="txt-link">음원관리</span>
				</a></li>
				<li class="" id="on"><a href="../view/sales.jsp"
					class="link-lnb"> <span class="txt-link">매출</span>
				</a></li>
			</ul>
			<ul class="list-lnb">
				<li><a href="../service/logoutService.jsp" class="link-lnb">
						<span class="txt-lnb">로그아웃</span>
				</a></li>
			</ul>
		</nav>
	</aside>
	<%
	String cp = request.getParameter("currentPage");
	int currentPage = 0;

	try {
		currentPage = Integer.parseInt(cp);
	} catch (Exception e) {
		currentPage = 1;
	}
	if (currentPage < 1)
		currentPage = 1;

	// pageBlock, 하나의 페이지에 보여질 회원의 수 
	int pageBlock = 5;

	/*
	 데이터베이스에서 각 페이지별 필요한 회원정보만 조회
	 데이터베이스에서의 시작, 끝 정보를 begin, end에 저장하여 list메서드 전달.
	 currentPage = 1;
	 end = 1 * 3;
	 begin = 3 + 1 - 3;
	 
	 currentPage = 2;
	 end = 2 * 3;
	 begin = 6 + 1 - 3;
	*/
	int end = currentPage * pageBlock;
	int begin = end + 1 - pageBlock;

	String search = request.getParameter("search");
	if (search == null)
		search = "";
	String select = request.getParameter("select");
	if (select == null)
		select = "";
	List<MusicDTO> musics = null;
	MusicDAO musicDao = new MusicDAO();
	int totalCount = musicDao.count();

	if (select == null || select == "") {
		musics = musicDao.musicList(begin, end);
		totalCount = musicDao.count();
	} else {
		if (search == "" || search == null) {
			response.sendRedirect("upload.jsp");
			return;
		}
		musics = musicDao.musicList(begin, end, select, search);
		totalCount = musicDao.count(select, search);
	}
	//pageControl에 필요한 정보 4가지 전달.
	String url = "upload.jsp?select=" + select + "&search=" + search + "&currentPage=";
	String result = PageService.getNavi(url, currentPage, pageBlock, totalCount);

	musicDao.disconnection();
	%>
	<div id="wrap" class="login">
		<div id="search" align="center">
			<form>
				<table>
					<tr>
						<td><select name="select" class="select">
								<%
								if (select == null || select == "" || select.equals("all")) {
								%>
								<option value="all" selected="selected">전체</option>
								<option value="title">제목</option>
								<option value="artist">아티스트</option>
								<%
								} else if (select.equals("title")) {
								%>
								<option value="all">전체</option>
								<option value="title" selected="selected">제목</option>
								<option value="artist">아티스트</option>
								<%
								} else if (select.equals("artist")) {
								%>
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="artist" selected="selected">아티스트</option>
								<%
								}
								%>
						</select> <input type=text name='search' class="input-search"
							value="<%=search%>" /> <input type=submit value='검색'
							class="btn-search" style="width: 60px;" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div align="center" id="music">
			<form action="../service/musicDeleteService.jsp?filename="
				method="post" id="f" enctype="multipart/form-data">
				<table border="1">
					<caption id="cap">음악 리스트</caption>
					<tr>
						<th width="50">NO</th>
						<th width="350">제목</th>
						<th width="150">앨범</th>
						<th width="200">아티스트</th>
						<th width="50">가사</th>
						<th width="50">뮤비</th>
						<th width="50">좋아요</th>
						<th width="50">hit</th>
						<th width="50">삭제</th>
					</tr>
					<%
					for (MusicDTO m : musics) {
					%>
					<tr>
						<td align="center"><%=m.getNum()%></td>
						<td><%=m.getTitle()%></td>
						<td><%=m.getAlbum()%></td>
						<td><%=m.getArtist()%></td>
						<td><%=m.getLyrics()%></td>
						<td><%=m.getMv()%></td>
						<td><%=m.getLove()%></td>
						<td><%=m.getHit()%></td>
						<td><input type="button" class="btn-search btn-delete"
							onclick="musicDelete('<%=m.getFileName()%>' , '<%=m.getTitle()%>')"></td>
					</tr>
					<%
					}
					%>
				</table>
			</form>
			<div id="next">
				<%=result%>
			</div>
		</div>
		<div align="center" id="bottom">
			<div id="top">
				<form action="../service/uploadService_music.jsp" method='post'
					id="a" enctype="multipart/form-data">
					<table>
						<caption>
							<font size="5"><b>노래 등록</b></font>
						</caption>
						<tr>
							<th>노래파일</th>
							<td><input type="file" name="music" id="music" required></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title" required></td>
						</tr>
						<tr>
							<th>album</th>
							<td><input type="text" name="album" id="album" required></td>
						</tr>
						<tr>
							<th>artist</th>
							<td><input type="text" name="artist" id="artist" required></td>
						</tr>
						<tr>
							<th>MV</th>
							<td><input type="text" name="mv" id="mv" required
								placeholder="뮤비 없으면 n 입력"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								onclick="inputChk()" value="업로드"></td>
						</tr>
					</table>
				</form>
			</div>
			<br>
			<div id="mid">
				<form action="../service/uploadService_lyrics.jsp" method='post'
					id="b" enctype="multipart/form-data">
					<table>
						<caption>
							<font size="5"><b>가사 등록</b></font>
						</caption>
						<tr>
							<th>가사</th>
							<td><input type="file" name="lyrics" required></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="업로드"></td>
						</tr>
					</table>
				</form>
			</div>
			<br>
			<div id="bot">
				<form action="../service/uploadService_image.jsp" method='post'
					id="c" enctype="multipart/form-data">
					<table>
						<caption>
							<font size="5"><b>이미지 등록</b></font>
						</caption>
						<tr>
							<th>이미지</th>
							<td><input type="file" name="image" required></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="업로드"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>