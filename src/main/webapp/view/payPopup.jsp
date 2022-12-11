<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
<meta charset="UTF-8">
<title>결제창</title>
<script src="../js/payPopup.js?"></script>
<link href="../css/payPopup.css" rel="stylesheet">

<!-- 멜론 기간제 이용권 구매 클릭시 나오는 결제 수단 팝업 -->
<!-- http://localhost:8085/waterMelon/pay/payUnionPopup.jsp -->
<%
	String month = request.getParameter("month");
	String num = request.getParameter("num");
	String filename = request.getParameter("fileName");
	
	String ticket = "";
	String money = "";
	if (month == null){
		ticket = "개별 구매";
		money = "1,000";
	}else if(month.equals("12")){
	 	ticket = "스트리밍 플러스 티켓 12개월";
		money = "100,000";
	}else if(month.equals("6")){
		ticket = "스트리밍 플러스 티켓 6개월";
		money = "70,000";
	      
	}else if(month.equals("3")){
		ticket = "스트리밍 플러스 티켓 3개월";
		money = "40,000";
	}else if(month.equals("1")){
		ticket = "스트리밍 플러스 티켓 1개월";
		money = "20,000";
	}
	
%>
</head>
	<title> Melon::음악이 필요한 순간, 멜론 </title>
		</head><body class="scroll_dis"><div style="display:none !important;" data-logging="https://log.melon.com/pv?log=@CR2@%5E@CR3@%5E@CR4@%5E%5E1000000629%5E@CR1@%5E@CR5@%5E%5E400116%5E%5E%5E%5E%5E%5E%5E%5E" menu-id="1000000629"></div>
	
 
    <div class="popup_billing w597">
        
<div class="wrap_popup_title">
    <!-- buyUseType별로 definition을 구분하자. -->
     
            <!-- 상품 및 오퍼 구매-->
            
	  <div class="popup_title">

   <div class="txt_title" style="max-width: none;">
      <h1><%=ticket%></h1>
      <ul>
         <li>개별 및 정기권 구매</li>
      </ul>
   </div>
   <div class="payment_info">
               
            <strong>결제 하기</strong>
					
		
	</div>
</div>
     
</div>
        <div class="popup_cntt box_scroll" style="height:595px;">
		<div class="tbl_style">
            <form>
			<table border="1" style="width:100%" class="board_style02">
				<caption>이 표는 멜론 이용권 결제 리스트로 특가 할인, 결제방법에 관한 내용을 포함하고 있습니다.</caption>
				<colgroup>
					<col style="width:119px;">
					<col>
				</colgroup>
				<tbody>
					
					<tr>
						<td colspan="2" class="wrap_tbl_payment">
							<div class="tbl_payment">
								<ul>
									<li>
										판매금액
										<span><strong><%=money%></strong> 원</span>
									</li>
									<li class="discount_price">
										할인적용
										<span><strong id="totDcAmt">0</strong> 원</span>
									</li>
									<li class="last_child">
										최종결제금액 (VAT 별도)
										<span><strong id="totPrice"><%=money%></strong> 원</span>
									</li>
								</ul>
							</div>
						</td>
					</tr>
                    
                           <tr>
                                <th id="mainBillMethodGroup" scope="col" rowspan="5"><p id="payPlanTitle">
                                결제 방법</p></th>                     
                            </tr>                                             
                            <tr>                               
                                <td id="KI0504_mainBillMethod">
                                    <input type="radio" id="how" value="card" name="onBillMethod">
                                    <label for="card" class="">신용카드</label>
                                    <!--KI0504_payment-->
                                </td>
                            </tr>                                               
                            <tr>                                    
                                <td id="KI0508_mainBillMethod">
                                    <input type="radio" id="how2" value="phone" name="onBillMethod">
                                    <label for="phone" class="">휴대폰결제</label>
                                    <!--KI0508_payment_companion-->
                                </td>
                            </tr>                 
				</tbody>
			</table>
            </form>
			<form name="agr">
			<div class="agreement_check_mt13">				
				<div class="mt10">
					<input type="checkbox" id="chkTerms" name="chkTerms" value="chkTerms">
					<label for="chkTerms">워터멜론유료서비스약관 및 하단 유의사항에 동의합니다.</label>
					<div id="viewTerms" value="viewTerms" class="btn btn_text arrow_r">
						<span class="text" onclick="agreeGood();">약관확인</span>
						<span class="icon" onclick="agreeGood();"></span>
					</div>
				</div>				
					<div class="mt10">
						<input type="checkbox" id="chkAutoPay"  name="chkAutoPay" value="chkAutoPay">
						<label for="chkAutoPay">결제약관에 동의합니다.</label>
					</div>				
			</div>
			</form>			
		</div>	
		<div class="t_center mt22">
			<button type="button" id="mainBillMethod" name="mainBillMethod" value="mainBillMethod" 
			class="btn_green_h30" title="결제하기 버튼" onclick="infCheck('<%=month%>','<%=num%>')">
			<span class="odd_span"><span class="even_span">결제하기</span></span></button>
			<button type="button" id="close" value="close" class="btn_base_h30" name="close"
			title="이용권 취소 버튼" onclick="backtothe();">
			<span class="odd_span"><span class="even_span">취소</span></span></button>
		</div>	
		
		<div class="tbl_style mt24">
			<table border="1" style="width:100%" class="board_style02">
				<caption>이 표는 워터멜론 이용권 결제에 관한 유의사항 내용을 포함하고 있습니다.</caption>
				<colgroup>
					<col style="width:119px;">
					<col>
				</colgroup>
				<tbody>							
					<!-- 이용권 상세 설명 -->              	
<tr>				
					<th scope="col">이용권 유의사항</th>							
			<td>
				<ul class="list_bullet">
				<li><span class="fc_point02">PC, 안드로이드폰, 아이폰, 태블릿, 모든 MP3 Player 등</span>에서 이용 가능합니다.</li> 
<li>이용권 사용기간 내에 다운로드하지 않을 경우, <span class="fc_point02">잔여 곡/어학은 다음 달로 이월되지 않습니다.</span></li>
<li>신용카드 결제 시 추가 할인 및 포인트 적립을 받을 수 있습니다. <a href="#" target="_blank">자세히보기</a></li>

<li>결제 후 7일 내 서비스 이용 이력이 없는 경우 결제 취소가 가능하며, 고객센터(1566-7727)나 1:1문의로 신청바랍니다.</li>
<li>결제 후 7일 경과 또는 서비스 이용 시에는 중도 해지 및 이에 따른 환불이 가능합니다.</li>
<li>미성년자가 구매하는 경우, 법정대리인이 동의하지 않으면 미성년자 또는 법정대리인이 구매를 취소할 수 있습니다.</li>
<li>음원권리권자와의 계약 또는 요청에 따라 일부음원의 서비스가 제한될 수 있습니다.</li>
<li><strong>결제 수단의 정지/한도초과/정보변경 등의 사유로 결제상태가 변경될 경우 결제 및 서비스가 일시 정지되며, 정상으로 전환되거나 직접 일시 정지 해제를 하시면 다시 결제 및 서비스가 시작됩니다.</strong></li>
				</ul>
			</td>		
		</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>