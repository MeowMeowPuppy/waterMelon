document.write("<script src='ajax.js'></scripit>")

function pwChk(userPw, panel) {
	console.log("panel : "+panel)
	var pw = document.getElementById("password").value;
	if (pw == "") {
		alert("비밀번호를 입력해주세요.");
		return;
	}
	if(userPw!=pw){
		alert('비밀번호가 틀렸습니다.');
		return;
	}
	switch(panel){
		case "update" : goto('update');break;
		case "delete" : goto('delete'); break;
	}
}

function inputChk() {
	var pw = document.getElementById("password").value;

	var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
	if (!isPW.test(pw)) {
		alert("비밀번호는 형식에 맞게 입력해주세요.");
		return;
	}

	var result = confirm('저장하시겠습니까?')
	if (result) {
		var pw = document.getElementById('password').value;
		var name = document.getElementById('name').value;
		var email = document.getElementById('email').value;
		
		
		var xhr = new XMLHttpRequest();
		xhr.open('POST','../service/updateService.jsp');
		xhr.onreadystatechange = () => {
			if (xhr.readyState===4 && xhr.status === 200){
				alert(xhr.responseText);
			}
		}
		data = "";
		data += "pw="+pw;
		data += "&name="+name;
		data += "&email="+email;
		
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(data);
		
		window.location.hash = "";
		window.location.reload;
	}
}

function changeClassName1() {
	if (document.getElementById("CHK1").classList.contains('on') == false) {
		document.getElementById("CHK1").classList.add('on');
	} else {
		document.getElementById("CHK1").classList.remove('on');
	}
}


function changeClassName2() {
	if (document.getElementById("CHK2").classList.contains('on') == false) {
		document.getElementById("CHK2").classList.add('on');
	} else {
		document.getElementById("CHK2").classList.remove('on');
	}
}


function memberOut() {
	if (document.getElementById("CHK1").classList.contains('on') && document.getElementById("CHK2").classList.contains('on')) {
		var result = confirm('정말 탈퇴하시겠습니까?');
		if (result) {
			var xhr = new XMLHttpRequest();
			xhr.open('POST','../service/deleteService.jsp');
			xhr.onreadystatechange = ()=>{
				if(xhr.readyState===4 && xhr.status===200){
					alert(xhr.responseText)
					location.href="../service/logoutService.jsp"
				}
			}
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send();
			return;
		}
	}
	if (document.getElementById("CHK1").classList.contains('on') == false) {
		alert('수박 탈퇴 후 개인의 데이터를 복구할 수 없음에 동의해주세요.');
		return;
	}
	if (document.getElementById("CHK2").classList.contains('on') == false) {
		alert('안내사항을 모두 확인했음에 동의해주세요.');
		return;
	}
}


function ticketOut() {
	if (document.getElementById("CHK1").classList.contains('on') 
	&& document.getElementById("CHK2").classList.contains('on')) {
		var result = confirm('정말 해지하시겠습니까?');
		if (result) {
	if (document.getElementById("CHK1").classList.contains('on') == false) {
		alert('해지 후 이용이 제한됨에 동의해주세요.');
		return;
	}
	if (document.getElementById("CHK2").classList.contains('on') == false) {
		alert('안내사항을 모두 확인했음에 동의해주세요.');
		return;
	}
	window.open('../view/bank.jsp','_blank','width=500 height=500 top=100 left=100');
		}
	}
}


function canclePage() {
	var xhr = new XMLHttpRequest();
	xhr.open('POST','../view/myInfo.jsp');
	xhr.onreadystatechange = () => {
		if (xhr.readyState===4 && xhr.status === 200){
			document.getElementById('content').innerHTML = xhr.responseText;
		}
	}
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send();
}


