<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>비밀번호 찾기</title>
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
  <style>
  
  /* base - 브라우저 별로 다를 수도 있는 것을 초기화 */
*{ padding: 0; margin: 0; } /* 태그 여백 없앰 */
li{ list-style: none; } /* 기호나 번호를 제거 */
a{ text-decoration: none; } /* 링크텍스트에 밑줄없앰 */
button{ cursor: pointer; } /* 모든 버튼에 마우스손모양 처리 */

/* body설정 */
body{ background-color: #ededed; }

.loginbox{
    width: 780px; height: 550px;
    margin: 0 auto; /* 블록요소를 부모영역에서 가운데 처리 */
}
.loginbox h2{
    width: 100%; /* 부모영역을 상속 */

    /* 한줄텍스트인 경우만 height와 line-height가 같으면 세로 가운데 처리 */
    height: 100px; line-height: 100px;
    text-align: center; font-size: 20px;
    font-weight: normal;
}
.loginbox form{
    width: 100%; height: 450px;
    background-color: #fff;
    /* 패딩수치를 인사이드 처리 */
    padding: 60px; box-sizing: border-box;
}
.loginbox fieldset{
    border: none; /* 테두리 제거 */ 
}
.loginbox legend{
    /* 요소를 화면 밖으로 처리 */
    position: absolute; left: -999em;

    /* 웹접근성으로 스크린리더기가 읽어줘야 하므로 display: none;을 사용하지 말것 */
}
.loginbox label{
    display: block;
    font-size: 12px; color: #333;
    margin-bottom: 10px; /* 동위선택자와의 간격 조정 */
}
.loginbox input{
    display: block;
    width: 100%; height: 50px;
    margin-bottom: 25px; /* 동위선택자와의 간격 조정 */
    border: none; background-color: #ededed;
    padding: 0 20px; /* 앞상하 뒷좌우 */
    box-sizing: border-box; /* 패딩수치를 인사이드 처리 */
}

.loginbox ul{
    width: 100%;
    text-align: right; /* 글자를 오른쪽으로 처리 */
    margin-bottom: 60px;
}
.loginbox li{
    display: inline-block;
    height: 12px; line-height: 12px;
}
.loginbox li:last-child{
    border-left: 1px solid #333;
    padding-left: 10px; /* 테두리 안쪽 여백 */
    margin-left: 4px; /* 테두리 바깥쪽 여백 */
}
.loginbox a{
    /* 글자관련은 보통 최종태그에 줘야 적용 */
    color: #333; font-size: 12px;

    /* 현재 위치에서 상대적 이동 */
    position: relative; top: -2px;
}
.loginbox button{
    display: block;
    width: 220px; height: 50px;
    margin: 0 auto; /* 블록요소가 부모 영역에서 가운데 오기 */
    border: none;
    background-color: #1673ea;
    color: #fff; font-size: 14px; font-weight: bold;
}
  </style>
</head>
<body>




<div class="loginbox">
  <h2>로그인</h2>
  <form action="#">
   
    <fieldset>
      <legend>비밀번호 찾기</legend>
      <label for="loginid">아이디(E-mail)</label>
      <input type="text" id="loginid" placeholder="아이디(E-mail)을 입력해 주세요">
      <label for="loginpw">비밀번호</label>
      <input type="password" id="loginpw" placeholder="비밀번호를 입력해 주세요">
      <ul>
        <li><a href="#">아이디/비밀번호찾기</a></li>
        <li><a href="#">회원가입</a></li>
      </ul>
      <!--데이터를 서버로 전송-->
      <button type="submit">로그인</button>
    </fieldset>
  </form>
</div>





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
        <button type="button" class="btn btn-default" id="btn">찾기</button>
        <button type="button" class="btn btn-default"
         onclick="location.href='agree'">회원가입</button>
         <button type="button" onclick="location.href='/member/idfind'" class="btn btn-default">아이디 찾기</button>
         <button type="button" onclick="location.href='/member/login'" class="btn btn-default">취소</button>
      </div>
    </div>
    <div class="form-group">        
     <div class="col-sm-offset-2 col-sm-8"> 
     <span id="msg"></span>
     </div>
     </div>
  </form>

</div>
</body>
</html>