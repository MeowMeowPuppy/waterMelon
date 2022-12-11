function goto(panel){
	document.getElementById('input').value = "";
	// 홈페이지로 가는 버튼을 눌렀을때 ex)로고,홈페이지 - 이때에는 매개변수를 아예 주지 않는 방식으로 해보자
	if(panel==undefined){
	document.getElementById('input').value = "";
	window.location.hash = '';
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			document.getElementById('content').innerHTML = xhr.responseText;
		} 
	}
	var url = "../view/mainPage.jsp"
	xhr.open('POST', url);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send();	
	return;
	}
	
	
	window.location.hash = '#'+panel;
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			document.getElementById('content').innerHTML = xhr.responseText;
		} 
	}
	var url = "../view/"+panel+".jsp"
	xhr.open('POST', url);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send();	
}


function hashchange(){ //hash가 변경되었을때 ex) 뒤로가기, 앞으로가기
	document.getElementById('input').value = "";
	if(!window.location.hash){ //hash가 없으면 메인화면을 출력하자
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			document.getElementById('content').innerHTML = xhr.responseText;
		} 
	}
	var url = "../view/mainPage.jsp"
	xhr.open('POST', url);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send();	
	return;
	}
	
	// hash 의 값을 변수에 받아두고 이를 기준으로 이전 페이지, 앞페이지의 hash에 따라 페이지를 출력해주자
	hash = window.location.hash;
	switch(hash){
		case "#myInfo" : goto('myInfo'); break;
		case "#mainPage" : goto('mainPage'); break;
		case "#update" : goto('update'); break;
		case "#buyVoucher" : goto('buyVoucher'); break;
		case "#updateChk" : goto('updateChk'); break;
		case "#ticket" : goto('ticket'); break;
		case "#ticketOut" : goto('ticketOut'); break;
		case "#deleteChk" : goto('deleteChk'); break;
		case "#delete" : goto('delete'); break;
		case "#login" : goto('login'); break;
		case "#search" : searchForHash(); break;
		default : goto();
	}
}

// 인터넷 검색결과로는 window가 아닌 document에 이벤트를 걸어주었는데 왜 window로 해야 작동하는 걸까?
window.addEventListener('hashchange',hashchange);
window.addEventListener('pageshow',hashchange);


//서치 아이콘 눌렀을때
function search(){
	var keywords = document.getElementById('input').value;
	if(keywords == "" || keywords == null){
		return;
	}
	sessionStorage.setItem("keywords",keywords);
	window.location.hash = "#search";
	var xhr = new XMLHttpRequest;
	xhr.open('POST','../view/searchResult.jsp')
	xhr.onreadystatechange= () =>{
		if(xhr.readyState === 4 && xhr.status === 200){
			document.getElementById('content').innerHTML = xhr.responseText;
		}
	}
	var data = "keywords=" + keywords;
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send(data);
};

// 검색창에 엔터버튼으로 검색할때
function searchEnter(){
	if(window.event.keyCode==13){
	var keywords = document.getElementById('input').value;
	if(keywords == "" || keywords == null){
		return;
	}
	sessionStorage.setItem("keywords",keywords);
	window.location.hash = "#search";
	var xhr = new XMLHttpRequest;
	xhr.open('POST','../view/searchResult.jsp')
	xhr.onreadystatechange= () =>{
		if(xhr.readyState === 4 && xhr.status === 200){
			document.getElementById('content').innerHTML = xhr.responseText;
		}
	}
	var data = "keywords=" + keywords;
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send(data);
	}
};

//hashchange 에서 사용될 코드
function searchForHash(){
	var keywords = document.getElementById('input').value;
	if(keywords == "" || keywords == null){
		keywords = sessionStorage.getItem("keywords");
	}
	document.getElementById('input').value = keywords;
	window.location.hash = "#search";
	var xhr = new XMLHttpRequest;
	xhr.open('POST','../view/searchResult.jsp')
	xhr.onreadystatechange= () =>{
		if(xhr.readyState === 4 && xhr.status === 200){
			document.getElementById('content').innerHTML = xhr.responseText;
		}
	}
	var data = "keywords=" + keywords;
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send(data);
};