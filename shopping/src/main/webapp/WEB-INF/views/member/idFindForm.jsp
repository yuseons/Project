<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>아이디 찾기</title>
  <meta charset="utf-8">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/login/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/login/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/login/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="/login/css/style.css">

    <script src="/login/js/jquery-3.3.1.min.js"></script>
    <script src="/login/js/popper.min.js"></script>
    <script src="/login/js/bootstrap.min.js"></script>
    <script src="/login/js/main.js"></script>
    
      <script type="text/javascript">
  	$(function(){
  		$("#btn").click(function(){
  			if($("#mname").val()==''){
  				alert("이름을 입력하세요");
  				$("#mname").focus();
  				return;
  				
  			}else if($("#email").val()==""){
  				alert("이메일을 입력하세요");
  				$("#email").focus();
  				return;
  			}
  			
  			//비동기 통신 요청 idfind() 호출
  			idfind($("#mname").val(),$("#email").val())
  				.then(text => $("#msg").text(text))
  				.catch(console.log);
	
  		});
  	});
  	
  	//비동기 통신을 처리하는 함수 선언
   function idfind(mname,email){
	  return fetch(`/member/idfindex?mname=\${mname}&email=\${email}`) 
	  			.then(response => response.text())
	  			.catch(console.log);
   }
  </script>

  </head>
  <body>
    
  <div class="content">     
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-12">
              <div class="form-block">
                  <div class="mb-4">
                  <h3><strong>아이디 찾기</strong></h3>
                   <p class="mb-4">가입된 정보를 입력하세요.</p>
                   </div>

                  <div class="form-group first">
                    <label for="mname">이름</label>
                    <input type="text" class="form-control" id="mname" required="required" name="mname">
                  </div>
                  <div class="form-group last mb-4">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" required="required">
                  </div>

    <div class="message">        
     <div class="col-sm-offset-2 col-sm-8"> 
     <span id="msg"></span><br><br>
     </div>
     </div>
                  
                <button type="button" class="btn btn-pill btn-block btn-info" id="btn" style="font-size:16px;">찾기</button>

				<div class ="find" align="center">
					<p>
						<br><br><a href="/member/pwfind" class="btLink btLine">비밀번호 찾기</a><br><br>
					</p>
					<p>
						<a href="/member/agree" class="btLink btLine colPur">회원가입</a>
					</p>	
				</div>
         
              </div>
            </div>
          </div>
        </div>       
      </div>   
    </div>
 </form>
  </div>
  </body>
</html>