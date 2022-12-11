<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<link rel="stylesheet"
	href="https://cdnimg.melon.co.kr/static/member/resource/style/o1/12/0/fqmqfvdb0gfndkyfs.css"
	type="text/css" />

<style>
.content #cont_wrap{
   margin-top : 240px;
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
					<h2 class="f_tit type02">수박 탈퇴</h2>
				</div>
				<p class="txt_info_mem">
					<strong>수박 탈퇴 전 안내사항을 꼭 확인해주세요.<br />탈퇴 시 회원님의 수박 이용정보가
						삭제되어 복구가 불가능합니다.
					</strong>
				</p>
				<div class="add_info_mem">
					<ul class="list_bullet no_bl">
						<li class="first_child">
							<p class="sub_tit">탈퇴 후 회원님의 수박 이용정보가 삭제되어 복구 불가능합니다.</p> <span
							class="bl_list no_bl">회원정보 및 개인 이용기록은 모두 삭제되며, 삭제된 데이터는 복구
								불가능합니다.</span>
							<ul class="add_detail_info">
								<li class="first_child"><span>
								이용권, 좋아요 등 이용기록이 삭제되오니 이용권을 해지(환불) 후 진행하기 바랍니다.</span></li>
							</ul>
						</li>
					</ul>
				</div>

				<div class="mt14">
					<div>
						<span class="f13 fc_mgray">탈퇴 후에는 개인의 데이터를 복구할 수 없습니다.</span><br>
					</div>
				</div>


				<div class="input_check_area mt26">
					<div id="CHK1" class="box_check d_input_check">
						<input type="checkbox" data-reason-msgcd="MSG_MO014"
							id="dataDeleteAgree" name="dataDeleteAgree" class="input_check" 
							onclick="changeClassName1()">
						<label for="dataDeleteAgree" class="label_check"><span
							class="icon"></span>수박 탈퇴 후 개인의 데이터를 복구할 수 없습니다.</label>
					</div>

					<div id="CHK2" class="box_check mt12 d_input_check">
						<input type="checkbox" data-reason-msgcd="MSG_MO003" id="outAgree"
							name="outAgree" class="input_check" onclick="changeClassName2()"> <label
							for="outAgree" class="label_check"><span class="icon"></span>안내사항을
							모두 확인하였으며, 이에 동의합니다.</label>
					</div>
				</div>

				<div class="wrap_btn_c mt26">
					<button type="button" onclick="memberOut();" title="수박탈퇴"
						class="btn_round_full_green44">
						<span class="odd_span"><span class="even_span">수박탈퇴</span></span>
					</button>
					<button type="button" onclick="canclePage()" title="수박탈퇴 취소"
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