<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>상품 정보</title>
  <meta charset="utf-8">
</head>
<body>
<div class="container">

<h2 class="col-sm-offset-2 col-sm-10">${dto.pname}의 상품 정보</h2><br>
 <table class="table table-bordered">
 <tr>
 	<td colspan="2" style="text-align: center">
 		<img src="/contents/storage/${dto.filename}" 
 		width="250px" height="250px" class="img-rounded" >
 	</td>
 </tr>
 <tr>
 	<th>상품명</th>
 	<td>${dto.pname}</td>
 </tr>
  <tr>
 	<th>상세내용</th>
 	<td>${dto.detail}</td>
 </tr>
 <tr>
 	<th>가격</th>
 	<td>${dto.price}원</td>
 </tr>
 <tr>
 	<th>재고량</th>
 	<td>${dto.stock}개</td>
 </tr>
 </table>
 <br>
 <div style="text-align: center">
 <button class="btn btn-default" onclick="location.href='./update/${dto.contentsno }'">상품 수정</button>
 <button class="btn btn-default" onclick="location.href='./updateFile/${dto.contentsno }/${dto.filename}'">사진 수정</button>
 <button class="btn btn-default" onclick="location.href='./delete/${dto.contentsno}'">상품 삭제</button>
 <button class="btn btn-default" onclick="location.href='/contents/list'">상품 목록</button>

 </div>
 
 <br>
 
</div>
</body>
</html>