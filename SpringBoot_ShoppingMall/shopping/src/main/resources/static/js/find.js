$(function(){
$("#findId_btn").click(function(){
		//alert($("#mname").val() +" "+$("#email").val());
		findId($("#mname").val(),$("#email").val())
			.then(text => alert(text))
			.catch(console.log);
		
	});
});

function findId(mname,email){
	return fetch(`/findId?mname=${mname}&email=${email}`)
			.then(response => response.text())
			.catch(console.log)
}


$(function(){
$("#findPw_btn").click(function(){
		//alert($("#id").val() +" "+$("#mname").val());
		findPw($("#id").val(),$("#mname").val())
			.then(text => alert(text))
			.catch(console.log);
		
	});
});

function findPw(id,mname){
	return fetch(`/findPw?id=${id}&mname=${mname}`)
			.then(response => response.text())
			.catch(console.log)
}