//아이디 찾기

$(function(){
$("#findId_btn").click(function(){
	//alert($("#mname").val() +","+$("#email").val());

	if($("#mname").val()==''){
		alert("이름을 입력하세요");
		$("#mname").focus();
		return;
		
	}else if ($("#email").val()==""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return;
	}
		

	//비동기 통신 요청 findId() 호출
		findId($("#mname").val(),$("#email").val())
			.then(text => $("#msg").text(text))
			.catch(console.log);
		
	});
});

//비동기 통신을 처리하는 함수 선언
function findId(mname,email){
	return fetch(`/member/findIdex?mname=${mname}&email=${email}`)
			.then(response => response.text())
			.catch(console.log)
}


//패스워드 찾기

$(function(){
$("#findPw_btn").click(function(){
		//alert($("#id").val() +" "+$("#mname").val());
		
		if($("#mname").val()==''){
		alert("이름을 입력하세요");
		$("#mname").focus();
		return;
		
	}else if ($("#email").val()==""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return;
	}
	
	
			//비동기 통신 요청 findId() 호출
		findPw($("#id").val(),$("#mname").val())
			.then(text => alert(text))
			.catch(console.log);
		
	});
});

//비동기 통신을 처리하는 함수 선언
function findPw(id,mname){
	return fetch(`/member/findPwex?id=${id}&mname=${mname}`)
			.then(response => response.text())
			.catch(console.log)
}