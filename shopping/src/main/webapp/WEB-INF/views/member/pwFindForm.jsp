<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>비밀번호 찾기</title>
  <meta charset="utf-8">
 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  
<link rel="stylesheet" href="/css/member.css">
  
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

    <div class="loginbox">
    <div class="form-block">
   
    <fieldset>
  <h1><strong>비밀번호 찾기</strong></h1>
  <p> 가입된 정보를 입력하세요.</p>

   <form>
   <label for="id">아이디</label>
   <input type="text" class="form-control" id="id" name="id"  required="required" placeholder="아이디를 입력하세요">
   <label for="mname">이름</label>
   <input type="text" class="form-control" id="mname" name="mname" required="required" placeholder="이름을 입력하세요">

    <div class="form-group">        
     <div class="message"> 
     <span id="msg"></span>
     </div>
     </div>
      <button type="button" class="btn btn-pill btn-block btn-info" id="btn" style="font-size:16px;">찾기</button>

		<div class ="find" align="center">
		<p>
			<br><br><a href="/member/idfind">아이디 찾기</a><br><br>
		</p>
		<p>
			<a href="/member/agree" style="color:#2F9D27;">회원가입</a>
		</p>	
		</div>
 	</form>
 </fieldset>
</div>
</div>
</body>
</html>