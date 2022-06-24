<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>


<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<meta charset="utf-8">
<script type="text/javascript">

	//장바구니가 비면 합계 금액 안뜨게 하기
	$(function(){
		if('${empty list}'=='true'){
			$("tfoot").hide();
		}else{
			$("tfoot").show();
		}
	});

	function del(cartno){
		if(confirm('상품을 삭제하겠습니까?')){
			let url = "/cart/delete/"+cartno;
			location.href = url;
		}
	}


     function read(contentsno){

    	var url = "/contents/detail/"+contentsno;
       
       location.href=url;
     }
     
     function change(check){
    	 
         if(check.checked){ //전체 체크 했을경우

        	aa = document.querySelectorAll("#ch"); //id='ch'인 것을 모두 가져옴=>상품을 장바구니에 넣으면서(for문을 돌면서) 여러개의 ch가 만들어짐 
        	for(let i=0; i<aa.length; i++){
        		aa[i].checked=true;
        	}
         }else{ //전체 체크를 해제했을 경우
        	aa = document.querySelectorAll("#ch")
        	for(let i=0; i<aa.length; i++){
        		aa[i].checked=false;
        	}
         }
        }
  
     function order(){
    	 //alert('호출');
    	 
    	 let cno = document.querySelectorAll("#ch"); //id가 ch인 모든 태그를 가져옴(배열 형식)
    	 let qty = document.querySelectorAll("#qty");
    	 let size = document.querySelectorAll("#size"); //id가 size인 모든 태그(size->span태그)
    	 
    	 let cnt = 0; //체크값을 검사하는 변수(체크가 되어질때마다 1을 증가함)
    	 let param_cno = ''; //상품번호(체크박스 안에 있는 value값)가 여러개 연결된다. //,로 연결되어있기 떄문에 cno가 숫자여도 값은 문자열로 나오므로 '' 
    	 let param_qty = ''; //수량을 여러개 연결한다
    	 let param_size = ''; //사이즈르 여러개 연결한다.
    	 
    	 for(let i=0; i<cno.length; i++){
    		 if(cno[i].checked==true){ //체크가 되어져 있다면 //(cno[i] : cno는 배열이므로)
    			 cnt++;
    		 	param_cno += cno[i].value+','; //input태그는 value속성이 있기때문에 value로 데이터를 얻어옴 //체크를 여러개 했을경우 ,로 구분해서 값을 가져옴
    		 	param_qty += qty[i].value+',';
    		 	param_size += size[i].innerText+','; //span 태그는 value 속성이 없고 text가 있으므로 innnerText로 얻어옴 
    		 }
    	 }
    	 if(cnt==0){ //체크가 안됐다면
    		 alert('상품을 선택 하세요');
    		 return; //order함수를 끝냄(상품 선택을 안했으므로 요청을 안하고 order함수를 끝냄)
    	 }else{ //체크가 됐다면 데이터를 얻어온후 url이동
    		// alert(param_cno);
    		// alert(param_qty);
    		// alert(param_size);
    		 
    		 let url = "/order/create/cart"+"/"+param_cno+"/"+param_qty+"/"+param_size; //장바구니에서 주문하기를 눌렀을경우의 url
    		 location.href=url; //location.href : get방식
    	 }
    	 
     }
     
  </script>

</head>
<body>
	<div class="container">

		<h2>
			<img src="/svg/cart4.svg" style='width: 30px'> 장바구니
		</h2>

		<table class="table table-striped">
			<thead>
				<tr>
					<th><input type='checkbox' onchange="change(this)"></th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="6">등록된 상품이 없습니다.</td>
					</c:when>
					
					<c:otherwise> 	<!--  장바구니에서 상품 1개에 해당하는 한 줄 -->
						<c:set var='tot' value='${0 }' />
						<c:forEach var="dto" items="${list }">    <!-- cartDTO를 뜻함 -->
							<c:set var='tot' value='${tot + (dto.cdto.price * dto.count) }' />
							<tr>
								<td>
								<input type='checkbox' id='ch' value="${dto.cdto.contentsno }"> <!--  value를 설정해서 체크 된 체크박스의 값을 가져올수있게 함 -->
								</td>
								
								<td>
								<img src="/contents/storage/${dto.cdto.filename }" class="img-rounded" width="100px" height="100px">
														<!-- cartDTO의 ContentsDTO의 filename -->
								</td>
																		
								<td>
								<a href="javascript:read('${dto.cdto.contentsno}')">
									${dto.cdto.pname }(size : <span id="size">${dto.size }</span>)
								</a>
								</td>
								<td><input type='number' value="${dto.count }" 
											min="1" max="10" id="qty">
								</td>
								<td>${dto.cdto.price }</td>		<!-- 가격 -->
								<td>
									<a href="javascript:del('${dto.cartno }')"> 
										<span class="glyphicon glyphicon-trash"></span>
									</a>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			
			<tfoot>
				<tr style="background-color: beige; font-size: large">
					<th colspan="6" style="padding: 30px;">
						주문금액 ${tot }원 + 배송비 3,000원 = 합계 ${tot+3000 } 
					
					<a href="javascript:order()"> 
						<img src="/svg/bag-heart-fill.svg" title="주문하기"
							 style='width: 30px; margin-left: 30px'>
					</a>
					
					<a href="/contents/mainlist/1"> 
						<img src="/svg/box2-heart.svg"
							 title="쇼핑계속" style='width: 30px; margin-left: 30px'>
					</a>
					
					</th>
				</tr>
			</tfoot>
			
		</table>
	</div>
</body>
</html>