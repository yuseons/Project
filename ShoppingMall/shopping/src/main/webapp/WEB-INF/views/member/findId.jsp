<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <title>아이디 찾기</title>
  <meta charset="utf-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/find.js" type="text/javascript"></script>
</head>
<body>
<div class="container">

<h1 class="col-sm-offset-2 col-sm-10">아이디 찾기</h1>
  <form class="form-horizontal">    
    <div class="form-group">
      <label class="control-label col-sm-2" for="mname">이름</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="mname" 
        placeholder="Enter name" name="mname" required="required">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">이메일</label>
      <div class="col-sm-4">          
        <input type="email" class="form-control" id="email" 
        placeholder="Enter email" name="email" required="required">
      </div>
    </div>
    
      <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
      <span id="msg"></span>
      </div>
      </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button"
        class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round"
        id="findId_btn">찾기</button>
        <button type="button" 
        class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round"
        onclick="location.href='/member/findPw'">패스워드 찾기</button>     
        <button type="button"
        class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round"
         onclick="location.href='agree'">회원가입</button>
         <button type="button" onclick="location.href='/member/login'" 
		class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
      </div>
    </div>

  </form>

</div>
</body>
</html>