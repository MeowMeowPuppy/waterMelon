<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyVoucher</title>
<style type="text/css">
.wrap_section02.premium #product_purchase12 {
	background-image: url(../img/Voucher.png) !important;
	border-radius: 30px !important;
}

.wrap_section02.premium #product_purchase6 {
	background-image: url(../img/Voucher2.png) !important;
	border-radius: 30px !important;
}

.wrap_section02.premium #product_purchase3 {
	background-image: url(../img/Voucher3.png) !important;
	border-radius: 30px !important;
}

.wrap_section02.premium #product_purchase1 {
	background-image: url(../img/Voucher4.png) !important;
	border-radius: 30px !important;
}

.wrap_section02 .product_purchase:after {
	position: static !important;
}

.wrap2 {
	margin-top: 200px !important;
}
</style>
<link rel="stylesheet"
	href="https://www.melon.com/resource/style/web/common/melonweb_layout.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://www.melon.com/resource/style/web/common/melonweb_comm.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://www.melon.com/resource/style/web/cm/melonweb_cm.css?tm=20201210_4"
	type="text/css">

<!-- <script src="/waterMelon/js/buyVoucher.js"></script> -->
<script src="../js/buyVoucher.js"></script>

</head>
<body>
	<%
	String ticket = (String) session.getAttribute("voucher");
	/* 	System.out.println(ticket); */
	%>
	<div id="wrap" class="wrap2">
		<div id="cont_wrap" class="clfix">
			<div id="conts_section" class="my_fold">
				<!-- contents -->
				<div id="conts">
					<div class="page_header">
						<h2 class="title">WaterMelon 이용권 구매</h2>
					</div>
					<div class="wrap_product">
						<div class="wrap_section02 premium">
							<h3>무제한 듣기</h3>
							<!-- 스트리밍 플러스 티켓 12개월 -->
							<div class="product_purchase" id="product_purchase12">
								<div class="product_titleArea">
									<h4 class="title">
										스트리밍 플러스 티켓 12개월<a href="#" data-index="0" class="btn_detail">이용권
											자세히 알기</a>
									</h4>
									<p class="text">무제한 듣기</p>
								</div>
								<div class="product_info">
									<div class="regular_payment">
										<dl>
											<dd>
												<span class="sale_price">100,000원</span>
											</dd>
										</dl>
										<div class="btn_buy_product">
											<button type="button" onclick="buyClick(12,'<%=ticket%>')"
												title="스트리밍 플러스 12개월권 구매 - 새 창">구매</button>
										</div>

									</div>

								</div>
							</div>
							<!-- 프리미엄 > 스트리밍 플러스 6개월  -->
							<div class="product_purchase" id="product_purchase6">
								<div class="product_titleArea">
									<h4 class="title">
										스트리밍 플러스 티켓 6개월<a href="#" data-index="24" class="btn_detail">이용권
											자세히 알기</a>
									</h4>
									<p class="text">무제한 듣기</p>
								</div>
								<div class="product_info">
									<div class="regular_payment">
										<dl>
											<dt></dt>
											<dd>
												<span class="sale_price">70,000원</span>
											</dd>
										</dl>
										<div class="btn_buy_product">
											<button type="button" onclick="buyClick(6,'<%=ticket%>')"
												title="스트리밍 플러스 6개월권 구매 - 새 창">구매</button>
										</div>

									</div>
								</div>
							</div>
							<!--프리미엄 > 스트리밍 플러스 3개월  -->
							<div class="product_purchase" id="product_purchase3">
								<div class="product_titleArea">
									<h4 class="title">
										스트리밍 플러스 티켓 3개월<a href="#" data-index="24" class="btn_detail">이용권
											자세히 알기</a>
									</h4>
									<p class="text">무제한 듣기</p>
								</div>
								<div class="product_info">
									<div class="regular_payment">
										<dl>
											<dt></dt>
											<dd>
												<span class="sale_price">40,000원</span>
											</dd>
										</dl>
										<div class="btn_buy_product">
											<button type="button" onclick="buyClick(3, '<%=ticket%>')"
												title="스트리밍 플러스 3개월권 구매 - 새 창">구매</button>
										</div>
									</div>
								</div>
							</div>

							<!--프리미엄 > 스트리밍 플러스 1개월  -->
							<div class="product_purchase" id="product_purchase1">
								<div class="product_titleArea">
									<h4 class="title">
										스트리밍 플러스 티켓 1개월<a href="#" data-index="24" class="btn_detail">이용권
											자세히 알기</a>
									</h4>
									<p class="text">무제한 듣기</p>
								</div>
								<div class="product_info">
									<div class="regular_payment">
										<dl>
											<dt></dt>
											<dd>
												<span class="sale_price">20,000원</span>
											</dd>
										</dl>
										<div class="btn_buy_product">
											<button type="button" onclick="buyClick(1, '<%=ticket%>')"
												title="스트리밍 플러스 1개월권 구매 - 새 창">구매</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="wrap_section02 download">
							<h3>개별곡 다운로드</h3>
							<!-- 개별곡 다운로드 -->
							<div class="product_purchase">
								<div class="product_titleArea">
									<h4 class="title">
										월정액 이용권 없이도 1곡씩<br>다운로드 가능합니다.
									</h4>
								</div>
								<div class="product_info">
									<div class="regular_payment">
										<dl>
											<dt>MP3 다운로드</dt>
											<dd>
												<span class="sale_price">1,000원</span>
											</dd>
										</dl>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- //contents -->
</body>
</html>