<%@page import="DTO.MusicDTO"%>
<%@page import="DAO.MusicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>download</title>
<!-- <script src="../js/myInfo.js"></script> -->
<link rel="stylesheet" href="../css/download.css">
<script src="../js/main.js"></script>
</head>

<%
String num = request.getParameter("num");

int Num = 0;
try{
	Num = Integer.parseInt(num);
}catch(Exception e) {
	e.printStackTrace();
}
MusicDAO musicDao = new MusicDAO();
MusicDTO music = musicDao.selectNum(Num);


String title = music.getTitle();

musicDao.disconnection();

String month = request.getParameter("month");
try {
	if (month == "null" || month.equals("null")) {
		out.print("<script>location.href='../service/downloadService.jsp?fileName=" + music.getFileName() + "'; alert('다운로드 완료');</script>");
	}
} catch (Exception e) {
}
%>
<body>
	<div id="wrap">
		<div id="download_bar">
			<h4>다운로드</h4>
		</div>
		<div id="box">
			<div>
				<table>
					<tr id="top" height="50" bordercolor="black">
						<td width="500">곡 정보</td>
						<td width="100"><div align="center">금액</div></td>
					</tr>
					<tr id="mid" height="50">
						<td><%=title%></td>
						<th>1,000원</th>
					</tr>
					<tr id="bot" height="70">
						<td></td>
						<td></td>
					</tr>

				</table>

			</div>
		</div>
		<div id="button" align="center">
			<input type="button" id="purchase"
				onclick="openClose('<%=num %>')" value="결제하기">
			<input type="button" id="cancel" onclick="window.close()" value="취소">
		</div>
	</div>
</body>
</html>
