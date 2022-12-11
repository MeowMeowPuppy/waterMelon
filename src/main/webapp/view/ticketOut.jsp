<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해지 신청</title>
<link rel="stylesheet"
	href="https://cdnimg.melon.co.kr/static/member/resource/style/o1/12/0/fqmqfvdb0gfndkyfs.css"
	type="text/css" />

<style>
#conts_section{
	margin-top : 240px !important;
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
<script src="../js/myInfo.js">
</script>
</head>
<body>
	<%
	// 비 정상적 접근 방지
	String id = (String) session.getAttribute("id");
	if (id == null) {
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='login.jsp'</script>");
		return;
	}
	%>


	<!-- //header -->
	<div id="cont_wrap" class="clfix">
		<div id="conts_section">
			<!-- contents -->
			<div id="conts" class="mp_conts">
				<div class="wrap_tit_mem">
					<h2 class="f_tit type02">이용권 해지 신청</h2>
				</div>
				<p class="txt_info_mem">
					<strong>이용권 해지 전 안내사항을 꼭 확인해주세요.<br />해지 시 회원님의 수박 이용이
						제한되며 복구가 불가능합니다.
					</strong>
				</p>
				<div class="add_info_mem">
					<ul class="list_bullet no_bl">
						<li class="first_child">
							<p class="sub_tit">해지 후 회원님의 수박 이용권 정보가 삭제되어 복구 불가능합니다.</p> <span
							class="bl_list no_bl">
							환불 정책
							</span>
							<ul class="add_detail_info">
								<li class="first_child"><span>
									-1개월 티켓은 환불이 불가능합니다.<br>
									-스트리밍 사용중 해지시 : 남은 이용일수 6개월 이상(60,000원), 6개월 ~ 3개월(30,000원), 3개월 미만(10,000원)
								</span></li>
							</ul>
						</li>
					</ul>
				</div>

				<div class="mt14">
					<div>
					</div>
				</div>


				<div class="input_check_area mt26">
					<div id="CHK1" class="box_check d_input_check">
						<input type="checkbox" data-reason-msgcd="MSG_MO014"
							id="dataDeleteAgree" name="dataDeleteAgree" class="input_check" 
							onclick="changeClassName1()">
						<label for="dataDeleteAgree" class="label_check"><span
							class="icon"></span>해지 후 이용이 제한됩니다.</label>
					</div>

					<div id="CHK2" class="box_check mt12 d_input_check">
						<input type="checkbox" data-reason-msgcd="MSG_MO003" id="outAgree"
							name="outAgree" class="input_check" onclick="changeClassName2()"> <label
							for="outAgree" class="label_check"><span class="icon"></span>안내사항을
							모두 확인하였으며, 이에 동의합니다.</label>
					</div>
				</div>

				<div class="wrap_btn_c mt26">
					<button type="button" onclick="ticketOut()" title="해지"
						class="btn_round_full_green44">
						<span class="odd_span"><span class="even_span">해지</span></span>
					</button>
					<button type="button" onclick="canclePage()" title="해지 취소"
						class="btn_round_gray44 w120 ml8">
						<span class="odd_span"><span class="even_span">취소</span></span>
					</button>
				</div>

			</div>
			<!-- //contents -->
		</div>
	</div>
</body>
</html>