<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <title>회원정보</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/member.css">
  <script type="text/javascript">
  function updateM(){
	  var url = "update";
 	  url += "?id=${dto.id}";
	  
	  location.href = url;
  }
  

  function deleteM(){
		if(confirm("정말 회원을 삭제하시겠습니까?")){
	  var url = "delete";
	  url += "?id=${dto.id}";
	  url += "&oldfile=${dto.fname}";
	  location.href = url;
  }
 }

  </script>
</head>
<body>
<div class="container">

<h2 class="col-sm-offset-2 col-sm-10">${dto.mname}의 회원정보</h2>
 <table class="table table-bordered">
 <tr>
 	<td colspan="2" style="text-align: center">
 		<img src="/member/storage/${dto.fname}" 
 		width="250px" height="250px" class="img-rounded" name="fname" >
 	</td>
 </tr>
 <tr>
 	<th>아이디</th>
 	<td>${dto.id}</td>
 </tr>
 <tr>
 	<th>성명</th>
 	<td>${dto.mname}</td>
 </tr>
 <tr>
 	<th>전화번호</th>
 	<td>${dto.tel}</td>
 </tr>
 <tr>
 	<th>이메일</th>
 	<td>${dto.email}</td>
 </tr>
 <tr>
 	<th>우편번호</th>
 	<td>${dto.zipcode}</td>
 </tr>
 <tr>
 	<th>주소</th>
 	<td>${dto.address1} ${dto.address2}</td>
 </tr>
 <tr>
 </tr>
 <tr> 
 	<th>날짜</th>
 	<td>${dto.mdate}</td>
 </tr>
 
 </table>
 <div style="text-align: center">
 <br>
 <button class="cre_btn" onclick="updateM()">회원정보 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
 <button class="cre_btn" onclick="deleteM()">회원 삭제</button>
 <div>
  <br> <br>
 <button class="cre_btn2" onclick="location.href='list'">회원 목록</button>
 </div>
</div>
<br>
</body>
</html>