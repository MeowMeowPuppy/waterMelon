var content = document.getElementById('content');
document.getElementById('search_logo').addEventListener('click',()=>{
	var keywords = document.getElementById('input').value;
	var xhr = new XMLHttpRequest;
	xhr.open('POST','../view/searchResult.jsp')
	xhr.onreadystatechange= () =>{
		if(xhr.readyState === 4 && xhr.status === 200){
			content.innerHTML = xhr.responseText;
		}
	}
	var data = "keywords=" + keywords;
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send(data);
});