<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <meta charset="utf-8">
 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  
<link rel="stylesheet" href="/css/member.css">
  
  </head>
  <body>
  
      <input type="hidden" name="rurl" value="${param.rurl}">    
    <input type="hidden" name="contentsno" value="${param.contentsno}">       
    <input type="hidden" name="nPage" value="${param.nPage}">  
  
    <div class="loginbox">
      
         
    <div class="form-block">
   
    <fieldset>
  <h1><strong>LOGIN</strong></h1>
  <p>로그인 하시면 다양하고 특별한 혜택을 이용할 수 있습니다.</p>

         <form class="form-horizontal" 
        action="/member/login"
        method="post">
        
	<div class="info">
          <label for="id">아이디</label>
          <input type="text" id="id" required="required" name="id" 
         		 value='${c_id_val}' placeholder="아이디를 입력하세요">
         		 
           <label for="passwd">비밀번호</label>
           <input type="password" id="passwd" name="passwd" required="required" placeholder="비밀번호를 입력하세요">
	</div>
    <div class="form-group">        
      
        <div class="checkbox">
        <div>
          <label>
          <c:choose>
          <c:when test="${c_id =='Y'}">
          	<input type="checkbox" name="c_id" value="Y" checked="checked"> 아이디 저장
          </c:when>
          <c:otherwise>
            <input type="checkbox" name="c_id" value="Y" > 아이디 저장
          </c:otherwise>
          </c:choose>
          </label>
        </div>
      </div>
    </div>           
        <button type="submit" class="btn btn-pill btn-block btn-info">로그인</button>

		<div class ="find" align="center">
			<p>
				<br><br><a href="/member/idfind" class="btLink btLine">아이디찾기</a>&nbsp; &nbsp;|&nbsp;&nbsp;
					<a href="/member/pwfind" class="btLink btLine">비밀번호 찾기</a>
			</p>
			<p>
				<a href="/member/agree" style="color:#2F9D27;">회원가입</a>
			</p>	
		</div>
				
 	</form>
 </fieldset>
</div>
</div>
</form>
</div>

  </body>
</html>