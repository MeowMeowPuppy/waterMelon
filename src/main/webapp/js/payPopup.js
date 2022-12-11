// 무제한 결제하기 버튼 클릭시 나오는곳
function popInfOpen() {
	window.open("payInfPopup.jsp", "결제창", "width=600, height=700");
}

// 약관보기
function agreeGood() {
	window.open("agreeCheck.jsp", "약관보기", "width=600, height=700");
}



// 취소 버튼 클릭시
function backtothe() {
	window.close();
}



// 무제한창에서 결제하기 클릭시
function infCheck(month, num) {
	var chk_radio = document.getElementsByName('onBillMethod');
	var sel_type = null;
	//console.log(chk_radio);

	for (var i = 0; i < chk_radio.length; i++) {
		if (chk_radio[i].checked == true) {
			sel_type = chk_radio[i].value;
		}
	}
	if (sel_type == null) {
		alert("결제 수단을 선택해주세요.");
		return false;
	}

	var chk_radiobox = document.querySelector('input[name="onBillMethod"]:checked').value;

//	console.log(chk_radiobox);


	var chk_checkbox1 = document.agr.chkTerms.checked;
	var chk_checkbox2 = document.agr.chkAutoPay.checked;

	if (!chk_checkbox1) {
		alert('워터멜론 유료서비스약관에 동의해주세요.');
		return;
	}

	if (!chk_checkbox2) {
		alert('결제 서비스약관에 동의해주세요.');
		return;
	}

	if (chk_checkbox1 && chk_checkbox2 && chk_radiobox == "card") {
		window.open("card.jsp?month=" + month+"&num=" + num, "_self", "카드결제창", "width=600, height=700");
		return;
	}

	if (chk_checkbox1 && chk_checkbox2 && chk_radiobox == "phone") {
		window.open("phone.jsp?month=" + month+"&num=" + num, "_self", "핸드폰 결제창", "width=600, height=700");
		return;
	}
}





// 카드 결제창 js

// 카드 번호 정규표현식
function cardCon() {
	var card = document.getElementById("cardnumber").value;
	var msg = document.getElementById('number_msg');
	var nonchar = /^[0-9]{16}$/
	msg.style.color = "red";
	msg.style.fontSize = "11px";
	msg.style.position = "relative";
	msg.style.left = "10px";
	if (card == "") {
		msg.innerHTML = "필수 정보입니다.";
		return;
	}

	if (nonchar.test(card) == false) {
		msg.innerHTML = "옳바른 카드 번호 형식이 아닙니다";
		return;
	}

	if (card.length != 16) {
		msg.innerHTML = "222";
		return;
	}
	msg.innerHTML = "";
}

// 카드 비밀번호 정규표현식
function pwCon() {
	var pwcard = document.getElementById("cardpw").value;
	var msg2 = document.getElementById('pw_msg');
	msg2.style.color = "red";
	msg2.style.fontSize = "11px";
	msg2.style.position = "relative";
	msg2.style.left = "10px";
	var nonchar = /^[0-9]+$/;
	if (pwcard == "") {
		msg2.innerHTML = "필수 정보입니다.";
		return;
	}

	if (nonchar.test(pwcard) == false) {
		msg2.innerHTML = "옳바른 비밀번호 형식이 아닙니다";
		return;
	}
	msg2.innerHTML = "";
}

// 카드 CVC번호 정규표현식
function cvcCon() {
	var cvccard = document.getElementById("cardcvc").value;
	var msg3 = document.getElementById('cvc_msg');
	msg3.style.color = "red";
	msg3.style.fontSize = "11px";
	msg3.style.position = "relative";
	msg3.style.left = "10px";
	if (cvccard == "") {
		msg3.innerHTML = "필수 정보입니다.";
		return;
	}

	var nonchar = /^[0-9]+$/;
	if (nonchar.test(cvccard) == false) {
		msg3.innerHTML = "옳바른 CVC 형식이 아닙니다";
		return;
	}
	msg3.innerHTML = "";
}


// 이메일 정규표현식
function emailCon() {
	var email = document.getElementById("email").value;
	var msg4 = document.getElementById('email_msg');
	msg4.style.color = "red";
	msg4.style.fontSize = "11px";
	msg4.style.position = "relative";
	msg4.style.left = "10px";
	if (email == "") {
		msg4.innerHTML = "필수 정보입니다.";
		return;
	}

	var nonchar = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	if (nonchar.test(email) == false) {
		msg4.innerHTML = "옳바른 이메일 형식이 아닙니다";
		return;
	}
	msg4.innerHTML = "";
}







// 휴대폰 결제창 js

// 휴대폰 번호 정규표현식
function phoneCon() {

	var phone = document.getElementById("mobileNum").value;
	var msg1 = document.getElementById('phone_msg');
	msg1.style.color = "red";
	msg1.style.fontSize = "11px";
	msg1.style.position = "relative";
	msg1.style.left = "10px";
	if (phone == "") {
		msg1.innerHTML = "필수 정보입니다.";
		return;
	}

	var nonchar = /^[0-9]{11,13}$/
	if (nonchar.test(phone) == false) {
		msg1.innerHTML = "옳바른 휴대폰 번호가 아닙니다";
		return;
	}
	msg1.innerHTML = "";
}


// 인증번호 받기
function certificationNum() {
	var phone = document.getElementById("mobileNum").value;
	location.href = "../service/phcheckService.jsp?mobile=" + phone;
	// service에서 난수 생성함

	// randomNum = document.getElementById("randomNum").value;
	// alert("인증번호는 " + randomNum + " 입니다.")
	return;
}

// 인증번호 비교하기
function randomNumf() {
	//location.href = "../service/phcheckService.jsp?randomNum="+randomNum; 

	// 인증번호 받아온값
	var randomNumv = document.getElementById("connumberCK").value;
	// 내가 입력한 인증번호

	var msg2 = document.getElementById("connumber_msg");
	msg2.style.color = "red";
	msg2.style.fontSize = "11px";
	msg2.style.position = "relative";
	msg2.style.left = "10px";
	if (randomNumv == "" || randomNumv === null) {
		msg2.innerHTML = "인증번호를 입력해주세요.";
		return;
	}

	var nonchar = /^[0-9]+$/;
	if (nonchar.test(randomNumv) == false) {
		msg2.innerHTML = "옳바른 인증번호 형식이 아닙니다";
		return;
	}
	msg2.innerHTML = "";
}

// 이메일 정규표현식
function emailCon2() {
	var email2 = document.getElementById("email2").value;
	var msg3 = document.getElementById('email2_msg');
	msg3.style.color = "red";
	msg3.style.fontSize = "11px";
	msg3.style.position = "relative";
	msg3.style.left = "10px";
	if (email2 == "") {
		msg3.innerHTML = "필수 정보입니다.";
		return;
	}

	var nonchar = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	if (nonchar.test(email2) == false) {
		msg3.innerHTML = "옳바른 이메일 형식이 아닙니다";
		return;
	}
	msg3.innerHTML = "";
}





// 폰 결제 완료 버튼 클릭시 (확인용,메인으로 가야됌)
function phoneEndless() {

	var msg1 = document.getElementById('phone_msg');
	var msg2 = document.getElementById('connumber_msg');
	var msg3 = document.getElementById('email2_msg');

	var ck = document.getElementById('mobileNum').value;
	var ck2 = document.getElementById('connumberCK').value;
	var ck3 = document.getElementById('email2').value;

	if (ck == "" || ck2 == "" || ck3 == "") {
		alert("결제 정보를 입력해주세요");
	} else if (msg1.innerHTML == "" && msg2.innerHTML == "" && msg3.innerHTML == "") {
		document.getElementById("f").submit();
	} else {
		alert("결제 정보를 다시 확인해주세요");
	}
}


// 카드 결제 완료 버튼 클릭시 (확인용,메인으로 가야됌)
function cardEndless(month, num) {

	var msg = document.getElementById('number_msg');
	var msg2 = document.getElementById('pw_msg');
	var msg3 = document.getElementById('cvc_msg');
	var msg4 = document.getElementById('email_msg');

	var ck = document.getElementById('cardnumber').value;
	var ck2 = document.getElementById('cardpw').value;
	var ck3 = document.getElementById('cardcvc').value;
	var ck4 = document.getElementById('email').value;

	if (ck == "" || ck2 == "" || ck3 == "" || ck4 == "") {
		alert("결제 정보를 입력해주세요");
	} else if (msg.innerHTML == "" && msg2.innerHTML == "" && msg3.innerHTML == "" && msg4.innerHTML == "") {
		location.href = "../service/cardService.jsp?month=" + month+"&num="+num;
	} else {
		alert("결제 정보를 다시 확인해주세요");
	}
}

function inputChk() {
	var bankNum = document.getElementById("bankNum").value;
	var msg = document.getElementById("bank_msg");

	var isBank = /[^0-9]/gi;
	if (isBank.test(bankNum)) {
		msg.style.color = "red";
		msg.style.fontSize = "15px";
		msg.style.position = "relative";
		msg.style.top = "-20px";
		msg.innerHTML = "계좌번호 형식에 맞게 입력해주세요.";
		return;
	}

	msg.innerHTML = ""; 
}

function CHK(){
	var bankNum = document.getElementById("bankNum").value;
	if(bankNum == null || bankNum == ""){
		alert('계좌번호를 입력해주세요');
		return;
	}
	
	var result = confirm('정말 환불 하시겠습니까?');
	if(result){
		location.href="../service/ticketOutService.jsp";
	}
}
