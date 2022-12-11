function getId(i) {
	document.getElementById('member_update').style.display = "block";
	clickId = document.getElementById('clickId' + i).innerHTML;
	clickName = document.getElementById('clickName' + i).innerHTML;
	clickBirth = document.getElementById('clickBirth' + i).innerHTML;
	clickEmail = document.getElementById('clickEmail' + i).innerHTML;
	clickMobile = document.getElementById('clickMobile' + i).innerHTML;
	document.getElementById('id').value = clickId;
	document.getElementById('userName').value = clickName;
	document.getElementById('birth').value = clickBirth;
	document.getElementById('email').value = clickEmail;
	document.getElementById('mobile').value = clickMobile;

}
function pwCheck() {
	pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	if (pw.value == confirm.value) {
		document.getElementById('label').innerHTML = '일치';
	}
	else {
		document.getElementById('label').innerHTML = '불일치';
	}
}
function updateClick() {
	//	console.log("들어왔니?");
	var pw = document.getElementById('pw');
	var confirm = document.getElementById('confirm');
	var userName = document.getElementById('userName').value;
	var birth = document.getElementById('birth').value;
	var email = document.getElementById('email').value;
	var mobile = document.getElementById('mobile').value;
	
	if (pw.value == "" || confirm.value == "" || userName == "" || birth == "" || email == "" || mobile == "") {
		pw.value = '';
		confirm.value = '';
		pw.focus();
		alert('모두 입력해주세요');
		return;
	} else if (pw.value != confirm.value) {
		pw.value = '';
		confirm.value = '';
		pw.focus();
		alert('입력한 두 비밀번호가 일치하지 않습니다.');
		return;
	}
	document.getElementById('f').submit();
}


function musicDelete(fileName, title) {
	console.log(fileName);
	console.log(title);
	var result = confirm(title + "을 삭제하시겠습니까?");

	if (result) {
		location.href = "../service/musicDeleteService.jsp?filename=" + fileName + "&title=" + title;
	}
}

function inputChk() {

	var title = document.getElementById('title');
	var album = document.getElementById('album');
	var artist = document.getElementById('artist');
	var mv = document.getElementById('mv');

	//	console.log(title);	// 공백
	//	console.log(album);
	//	console.log(artist);
	//	console.log(mv);

	if (title.value == "" || album.value == "" || artist.value == "" || mv.value == "") {
		alert('모두 입력해주세요');
		return;
	}
}














