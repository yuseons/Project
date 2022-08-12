<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>나의 정보</title>
    <link rel="stylesheet" href="/css/member.css">
  <meta charset="utf-8">
</head>
<body>

<div class="container">
  <div class="row">
  <div class="col-sm-3">
  <h3><span class="glyphicon glyphicon-user"></span> 나의 정보</h3>
  <img class="img-rounded" src="/member/storage/${dto.fname}" style="width:280px">${dto.fname}
  <div class="caption">
  <br><br>
    아이디 : ${dto.id}
    <br><br>
    이름 : ${dto.mname}
    <br><br>
    배송지 : (${dto.zipcode }) <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ${dto.address1 }  ${dto.address2}
    <div>
    <br><br>
    <button type="button" class="agreebtn" onclick="location.href='/member/update'">회원정보 수정</button>
    </div>
  </div>
  </div>
  <div class="col-sm-6">
  <h3><span class="glyphicon glyphicon-gift"></span> 주문 내역 및 리뷰 작성</h3><br><br>
  <ul class="list-group">
   <c:choose>
    <c:when test="${empty dto.list }">주문한 상품이 없습니다.</c:when>
    
    <c:otherwise>
    <c:forEach var="order" items="${dto.list}" >
    <p class='h4'>${fn:substring(order.odate,0,10)}<p>
    <li class="list-group-item">결제금액 : ${order.total} 원, 주문상태 : ${order.ostate}
	    <c:forEach var="detail" items="${order.list}">
	    <li class="list-group-item">${detail.pname}, ${detail.quantity}개
	     <a href="review/create/${detail.contentsno}"><span class="badge">Review</span></a></li>
	    </c:forEach>
   </c:forEach>
    </c:otherwise>
    </c:choose>
  </ul>
  </div>
  </div>
</div>

</body>
</html>