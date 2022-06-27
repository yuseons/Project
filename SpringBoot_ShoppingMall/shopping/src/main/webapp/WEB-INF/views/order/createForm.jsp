<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function order(tot){
	let payment = document.querySelector(".btn-check:checked").value; //radio는 1개만 체크할수있으므로 all안씀
	let req = document.querySelector("#req");
	let reqtext = req.options[req.selectedIndex].text; //req.options : req가 갖고있는 모든 select options //[req.selectedIndex].text: 선택한 option(순서는 0부터 시작)을 text로 뽑아옴
	
	let f = document.querySelector("#oform");
	f.tot.value = tot; 
	f.payment.value = payment;
	f.reqtext.value = reqtext;
	f.action = "/order/create/${str}"; //요청 url //str : 장바구니에서의 결제인지 아닌지의 차이

	//alert(tot);
	//alert(payment);
	//alert(reqtext);

	 f.submit();
}

</script>
<style>
.orders{
	display:flex;	
	border : 1px solid black;
	padding : 10px;
	
}
.img-rounded {
	margin : 10px;
}
</style>
</head>
<body>
<div class="container">
  <h2><img src="/svg/bag-heart-fill.svg" style='width:30px'> 주문/결제</h2>
  <div class="row">
  <h3>주문 상품 갯수 : ${fn:length(list)}</h3>
  <div class="orders">
  <c:set var="tot" value="${0 }" />
<c:forEach var="dto" items="${list }" varStatus='a'> <!-- varStatus를 정해서 밑에서 a.index로 뽑을수있게 -->

 <!-- 장바구니에서 주문하기 누른 경우 : qtys -->
 <c:if test="${str == 'cart' }">
  <c:set var="qty" value='${(qtys).split(",")[a.index] }' /> <!-- qty의 배열을 split 한것 중 0부터의 순서 -->
 </c:if>
  
  <!-- 상세페이지에서 주문하기 누른경우 : qty -->
  <c:set var="tot" value="${tot+(dto.price * qty) }" />
  
  <figure>
  <img class="img-rounded" src="/contents/storage/${dto.filename }" style="width:100px" style="width:100px; height:100px">
	<figcaption style="margin-left:10px">수량 : ${qty }, 사이즈 : ${(size).split(",")[a.index] }</figcaption>
	</figure>
</c:forEach>
  </div>
  <h3>배송 정보</h3>
  <ul class="list-group">
	<li class="list-group-item">주문자 : ${mdto.mname } / ${mdto.tel }
	<li class="list-group-item">주소 : ${mdto.address1 } ${mdto.address2 } ${mdto.zipcode }
	<li class="list-group-item">배송시 요청사항 : <select id='req'>
	                                           <option>문앞에 놓아주세요</option>
	                                           <option>경비(관리)실에 맡겨주세요</option>
	                                           <option>부재시 연락주세요</option>
	                                         </select>
	


  </ul>
    <h3>결제 정보</h3>
  <ul class="list-group">
	<li class="list-group-item">결제수단 선텍: 
	<input type="radio" class="btn-check" name="payment" value="신용카드" id="btn1" checked>
		<label class="btn btn-primary" for="btn1">신용카드</label>
	<input type="radio" class="btn-check" name="payment" value="pay카드" id="btn2" checked>
		<label class="btn btn-primary" for="btn2">pay카드</label>
	<input type="radio" class="btn-check" name="payment" value="pay머니" id="btn3" checked>
		<label class="btn btn-primary" for="btn3">pay머니</label>
										<!--input id를 label for로 연결해서 label을 누르면 input이 선택되게 함 -->

	<li class="list-group-item" style="font-size:large;color: red" >
	총 상품 금액 ${tot } 원 +  배송비 3000 원 = 최종 결제금액 ${tot+3000 }원 
	
	<a href="javascript:order('${tot+3000 }')">
	<img src='/svg/wallet.svg' title="결제하기" style="width:30px;padding-left:10px">
	결제</a>
  </ul>
  </div>
</div>

<!-- order form -->
<form id="oform" method="post">
	<input type="hidden" name="cno" value="${cno }"> <!-- 장바구니에서 주문 -->
	<input type="hidden" name="contentsno" value="${contentsno }"> <!-- 상세페이지에서 바로 주문 -->
	<input type="hidden" name="qty" value="${qty }"> <!-- 장바구니에서 왔다면 배열형식으로 여러개, 상세페이지에서 왔다면 1개 -->
	<input type="hidden" name="qtys" value="${qtys }"> 
	<input type="hidden" name="size" value="${size }"> <!-- qty와 마찬가지 -->
	<input type="hidden" name="tot" value="">
	<input type="hidden" name="payment" value="">
	<input type="hidden" name="reqtext" value="">
</form>
</body>
</html>