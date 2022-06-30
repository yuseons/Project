<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <title>로그인 처리</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  	$(function(){
  		$("#btn").click(function(){
  			if($("#id").val()==''){
  				alert("아이디를 입력하세요");
  				$("#id").focus();
  				return;
  				
  			}else if($("#mname").val()==""){
  				alert("이름을 입력하세요");
  				$("#mname").focus();
  				return;
  			}
  			
  			//비동기 통신 요청 idfind() 호출
  			pwfind($("#id").val(),$("#mname").val())
  				.then(text => $("#msg").text(text))
  				.catch(console.log);
	
  		});
  	});
  	
  	//비동기 통신을 처리하는 함수 선언
   function pwfind(id,mname){
	  return fetch(`/member/pwfindex?id=\${id}&mname=\${mname}`) 
	  			.then(response => response.text())
	  			.catch(console.log);
   }
  </script>
</head>
<body>
<div class="container">

<h1 class="col-sm-offset-2 col-sm-10">비밀번호 찾기</h1>
  <form class="form-horizontal">          
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="id" 
        placeholder="Enter id" name="id" required="required">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="mname">이름</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="mname" 
        placeholder="Enter mname" name="mname" required="required">
      </div>
    </div>

        <div class="form-group">        
     <div class="col-sm-offset-2 col-sm-8"> 
     <span id="msg"></span>
     </div>
     </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round"
         id="btn">찾기</button>
        <button type="button" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round"
         onclick="location.href='agree'">회원가입</button>
         <button type="button" onclick="location.href='/member/idfind'" 
         class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">아이디 찾기</button>
        <button type="button" onclick="location.href='/member/login'" 
		class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
      </div>
    </div>

  </form>

</div>
</body>
</html>