
//로그인 페이지 검증
function loginCheck(){
	id = document.getElementById('id').value;
	pw = document.getElementById('pw').value;
	
	if(id == ""){
		alert('아이디는 필수 항목입니다.');
		return;
	}if(pw == ""){
		alert('비밀번호는 필수 항목입니다.');
		return;
	}
	document.getElementById('f').method = 'post';
	document.getElementById('f').submit();
}


//로그인 페이지 아이디 저장 체크박스
function checkBox(){
	saveId = document.getElementById('box_check02');
	if(saveId.classList.contains('on') == false){
		saveId.classList.add('on');
	}else{
		saveId.classList.remove('on');
	}
}

var conut =0;
//관리자 로그인하는 함수 (10번 클릭시 이동)
function managerLogin(){
	conut++
	if(conut==10){
		location.href="managerLogin.jsp";
	}
}

//아이디 찾기 페이지 검증
function findIdCheck(){
	findIdName = document.getElementById('findIdName').value;
	findIdMobile = document.getElementById('findIdMobile').value;
	
	if(findIdName == ""){
		alert('이름은 필수 항목입니다.');
		return;
	}if(findIdMobile == ""){
		alert('전화번호는 필수 항목입니다.');
		return;
	}
	document.getElementById('f').method = 'post';
	document.getElementById('f').submit();
}

//비밀번호 찾기 검증
function findPwCheck(){
	findPwId = document.getElementById('findPwId').value;
	findPwName = document.getElementById('findPwName').value;
	findPwMobile = document.getElementById('findPwMobile').value;
	
	if(findPwId == ""){
		alert('아이디는 필수 항목입니다.');
		return;
	}if(findPwName == ""){
		alert('이름은 필수 항목입니다.');
		return;
	}if(findPwMobile == ""){
		alert('전화번호는 필수 항목입니다.');
		return;
	}
	document.getElementById('f').method = 'post';
	document.getElementById('f').submit();
}

//관리자 로그인 페이지 검증
function managerLoginCheck(){
	id = document.getElementById('id').value;
	pw = document.getElementById('pw').value;
	
	if(id == ""){
		alert('아이디는 필수 항목입니다.');
		return;
	}if(pw == ""){
		alert('비밀번호는 필수 항목입니다.');
		return;
	}
	document.getElementById('f').method = 'post';
	document.getElementById('f').submit();
}

//엔터 기능
function enter(){
	if(window.event.keyCode == 13){
		console.log("되니?");
		loginCheck();
	}
}
