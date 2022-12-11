<%@page import="DTO.VoucherDTO"%>
<%@page import="DAO.VoucherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수박이용권/결제정보</title>
<link rel="stylesheet"
	href="https://member.melon.com/resource/style/web/member/melonweb_member.css?tm=20221004"
	type="text/css" />
	
<style>
.content .mp_wrap{
	margin-top:240px;
}

.btn_green_h30 span.even_span {
	background: #EF6161 !important;
	border-radius: 30px !important;
}
span.odd_span{
	background: #EF6161 !important;
	border-radius: 30px !important;
	
}
</style>
<%
//비 정상적 접근 방지
String id = (String) session.getAttribute("id");
if (id == null) {
	out.print("<script>alert('로그인 후 이용해주세요.'); location.href='login.jsp'</script>");
	return;
}
VoucherDAO voucherDao = new VoucherDAO();
VoucherDTO voucher = voucherDao.getVoucher(id);

String ticket = "";
String begin = "";
String finish = "";

if(voucher != null){
ticket = voucher.getTicket();
begin = voucher.getBegin();
finish = voucher.getFinish();

begin = begin.substring(0, 4) + "." + begin.substring(4, 6) + "." + begin.substring(6);
finish = finish.substring(0, 4) + "." + finish.substring(4, 6) + "." + finish.substring(6);
}

voucherDao.disconnection();
%>


</head>
<body>

	<div id="wrap" class="mp_wrap">

		<div id="cont_wrap" class="clfix">
			<div id="conts_section">
				<!-- contents -->
				<div id="conts" class="mp_conts">
					<h2 class="f_tit">수박 이용권/결제정보</h2>
					<div class="wrap_tab05 type">
								<div class="cntt_tab05">
									<!-- 테이블 작성 -->
									<div class="view_tb">
										<div class="wrab_list_info">
											<br>
										</div>
										<div class="tb_list02">
											<table border="1" style="width: 100%">
												<colgroup>
<!-- 													<col style="width: 40px" /> -->
													<col style="width: 322px" />
													<col style="width: 322px" />
												</colgroup>
												<thead>
													<tr>
<!-- 														<th scope="col"><div class="wrap pd_none">NO</div></th> -->
														<th scope="col"><div class="wrap">현재 이용권</div></th>
														<th scope="col"><div class="wrap">이용 가능 서비스</div></th>
														<th scope="col"><div class="wrap">해지신청</div></th>
													</tr>
												</thead>
												<%
												// finish날짜랑 오늘 날짜랑 비교하는 조건으로 바꿔줘야함
												if (voucher == null) {
												%><tbody>
													<tr>
														<td colspan="4"><div class="wrap search_wrong">
																<span id="d_search_wrong_msg">사용중인 수박 이용권이 없습니다.<br />
																	이용권을 구매해 주세요.
																</span>

																<div class="wrap_btn_c">
																	<a href="main.jsp#buyVoucher" title="수박 이용권 구매하기 "
																		class="btn btn_green_h30 btn_4type"
																		id="d_search_wrong_btn"><span class="odd_span"><span
																			class="even_span">수박 이용권 구매하기</span></span></a>
																</div>
															</div></td>
													</tr>
												</tbody>
												<%
												} else {
												%>
												<tbody>
													<tr class="row">
<!-- 														<td class="no"><div class="wrap">1</div></td> -->
														<!-- 수박이용권 -->
														<td><div class="wrap">
																<span class="cntt"> <strong class="fc_strong"
																	id="d_prodname_2022091507088051">스트리밍 플러스 티켓 <%=ticket%>개월
																</strong> <br> <label>이용중</label><br> <span
																	id="d_prodprid_2022091507088051"> <%=begin%> -
																		<%=finish%>
																</span></span>
															</div> <!-- //wrap_prod --></td>
														<!-- //멜론 이용권 -->
														<!-- 이용 가능 서비스 -->
														<td id="d_spec_2022091507088051"><div class="wrap">
																<ul class="list_srvc">
																	<li><span class="icon_srvc all">이용가능서비스:PC/Mobile</span>
																		<span class="wrap_srvc_info"> <span>음악감상
																				:</span> <span><strong class="fc_strong">무제한</strong></span>

																	</span></li>

																</ul>
															</div></td>
														<!-- //이용 가능 서비스 -->
														<!-- 다음 결제 안내 -->

														<td id="d_nextBillInfo_2022091507088051"><div
																class="wrap">

																<div class="mt5" align="center">
																	<a id="d_search_wrong_btn"
																		onclick="goto('ticketOut')"
																		class="btn btn_green_h30 btn_4type"
																		title="해지신청 - 새창"><span
																		class="odd_span"><span class="even_span">
																				해지 신청 <span class="icon"></span>
																		</span></span></a>
																</div>

															</div></td>

														<!-- //다음 결제 안내 -->
													</tr>

												</tbody>

												<%
												}
												%>
											</table>
										</div>
									</div>
									<!-- //테이블 작성 -->
								</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>