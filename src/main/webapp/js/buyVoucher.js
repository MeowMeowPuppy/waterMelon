//구매 클릭시
function buyClick(value, ticket){
	console.log(value + "   "+ ticket);
	if(ticket == "n"){
	 	window.open("payPopup.jsp?month="+value,"_blank","width=600, height=700");
	 	return;
	 }else if(ticket == "null"){
	 	alert("로그인 후 이용하여 주세요.");
	 	return;
	 }else{
		alert("이미 스트리밍을 이용중 입니다.");
	 }
}


