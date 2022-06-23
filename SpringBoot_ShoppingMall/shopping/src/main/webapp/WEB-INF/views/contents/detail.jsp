<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/style.css">
  <script type="text/javascript" src="/js/cart.js"></script>
  <script type="text/javascript">
  function cart(){
	  if('${sessionScope.id}' == ''){
		  alert('먼저 로그인을 하세요');
		  location.href='/member/login';
		  return;
	  }
	  //카트테이블에 등록하고 등록 확인 창 보여주기 (비동기)
	  let count = document.getElementById('qty').value;  //$('#qty').val() : jquery식 표현 (같은 뜻)
	  let select = document.querySelector('.form-select'); //form의 클래스 이름으로 select를 찾아오기
	  let i = select.selectedIndex; //선택한 select 순번 가져오기
	  
	  //사이즈 선택 안했을시 선택하라고 하기  
	  if(i==0 && !select.disabled){  //사이즈 선택 안함(i==0 : select 순번 0번을 선택함) && cateno==2일 경우(bag) 사이즈 선택 안함 : select.disabled
		  alert("사이즈를 선택하세요.");
		  select.focus();
		  return; //멈춤
	  }else if(select.disabled){
		  select[i].value=0; //선택한 사이즈(select[i])를 0으로 함(사이즈는 not null이기 떄문에 값이 있어야하기 떄문)
	  }
	  //저장할 값
	  let param = {
			  contentsno : '${dto.contentsno}',
			  count : count,
			  size : select[i].value
	  }
	  //비동기통신(fetch)
	  addCart(param)
	  .then(result => alert(result)) //alert로 result값 출력
	  .catch(console.log);
  }
  
  function order(){
	  if('${sessionScope.id}' == ''){
		  alert('먼저 로그인을 하세요');
		  location.href='/member/login';
		  return;
	  }
	  //주문서 작성으로 이동 주문생성 (비동기)
  }
  </script>
</head>
<body>
 
<div class="container">
  <div class="row">
  <div class="col-sm-3">
  <h4><img src="/svg/box2-heart.svg"> 상품 정보</h4>
  <img class="img-rounded" src="/contents/storage/${dto.filename}" style="width:250px">
  <div class="caption">
    <p>상품명:${dto.pname}</p>
    <p>${dto.detail }</p>
  </div>
  </div>
  <div class="col-sm-6">
  <h4><img src="/svg/rulers.svg"> 사이즈 및 수량</h4>
  <ul class="list-group">
    <li class="list-group-item">사이즈 :
    <c:choose>
     <c:when test="${dto.cateno==1}"> <!-- jean -->
     <select class="form-select" aria-label="Default select example">
	  <option selected>사이즈 선택</option> <!-- select 순번 : 0 (배열형식)-->
	  <option value="L">L</option>  <!-- select 순번 : 1 -->
	  <option value="M">M</option>  <!-- select 순번 : 2 -->
	  <option value="S">S</option>  <!-- select 순번 : 3 -->
	 </select>
     </c:when>
     <c:when test="${dto.cateno==2 }"> <!-- bag -->
      <select class="form-select" aria-label="Default select example" disabled="disabled">
	  <option selected>사이즈 선택</option>
	 </select>     
     </c:when>
     <c:when test="${dto.cateno==3 }"> <!-- shoes -->
     <select class="form-select" aria-label="Default select example">
	  <option selected>사이즈 선택</option>
	  <option value="220">220</option>
	  <option value="230">230</option>
	  <option value="240">240</option>
	  <option value="250">250</option>
	  <option value="260">260</option>
	 </select>
     </c:when>
    </c:choose>
    <li class="list-group-item">가격 : ${dto.price }
    <li class="list-group-item">재고 : ${dto.stock }
    <li class="list-group-item">수량 : <input type="number" name="quantity" min=0 max=20 value="1" id="qty">     
    <li class="list-group-item">
         <a href="javascript:cart()">
         <img class='btn' src="/svg/cart4.svg"/></a>
         <a href="javascript:order()">
         <img class='btn' src="/svg/bag-heart-fill.svg"/></a>
         <a href="javascript:history.back()">
         <img class='btn' src="/svg/arrow-return-left.svg"/></a>
 
  </ul>
  </div>
  </div>
  
  <!--  리뷰 목록  -->
  <div class='row'>
 
<div class="col-lg-12">
 
<!-- panel start-->
<div class="panel panel-default">
 
<div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Review
        <button id='addReviewBtn' class='btn btn-primary btn-xs pull-right'>New Review</button>
</div>

<div class="panel-body">
        <ul class="chat list-group">
                <li class="left clearfix" data-rno="12">

                </li>
        </ul>
        <!-- ul end  -->
</div>
 
<div class="panel-footer"></div>
</div>
<!-- panel end-->
</div>
<!--  col-lg-12 end -->
</div>
<!-- row end -->
 
</div>
<!-- container end -->



<!-- Modal : 새로운 창이 떠서 그 안에서 기능 수행 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"
        aria-hidden="true">&times;</button>
      <h4 class="modal-title" id="myModalLabel">REVIEW</h4>
    </div>
    <div class="modal-body">
      <div class="form-group">
        <label>내용</label> 
        <textarea cols="10" rows="3" class="form-control" name='content'>New Review!!!!</textarea> 
      </div>      
    </div>
<div class="modal-footer">
<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
</div>         
 </div>
  <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->



 <!-- 리뷰 목록 처리-->
 <!-- jstl는 internal javascript에서 사용가능 -->
 <script>
  let contentsno = "${dto.contentsno}"; 
  let sno = "${sno}";
  let eno = "${eno}";
 <!-- 댓글용 paging 로그인 id -->
  let nPage = "${nPage}";
  <!-- 댓글 id 확인 -->
  let id = "${sessionScope.id}";
 </script>
 
 
 <!-- 댓글처리 관련 Javascript 파일 추가 (static폴더의 js폴더안에 위치)-->
<script src="/js/producer.js"></script>
 
<script src="/js/consumer.js"></script>
</body> 
</html> 