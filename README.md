## DAILY ShoppingMall

<br>

### **🎯 Spring Boot 기반으로 구현한 쇼핑몰 웹 사이트입니다.**

<p align="center">
<img src="https://github.com/yuseons/TIL/blob/master/image/shopping_main.gif">
</p>

<br>

### ⚙️ 개발 환경

운영체제 : Windows 10
통합개발환경 : STS(Spring Tool Suite)
JDK 버전 : JDK 11
데이터 베이스 : MySQL
빌드 툴 : Gradle

<br>

### ⚒️ 기술 스택

HTML, CSS, JavaScript, Ajax, jQuery
Spring Boot, MyBatis, MySQL

<br>

### 📜 구현 기능

- 회원 (member)

  - 로그인, 로그아웃
  - 아이디, 패스워드 찾기
  - 회원가입
  - Mypage (회원정보 확인, 수정, 탈퇴, 주문내역 조회)

- 관리자 페이지 (admin)

  - 상품 목록 (등록, 조회, 수정)
  - 회원 목록 (조회, 수정, 삭제)

- 상품 (contents)

  - 상품 상세 페이지
    - 리뷰 작성, 수정, 삭제
    - 장바구니에 담기
    - 바로 주문하기

- 공지사항(notice)

  - 공지사항 목록, 조회 (회원)
  - 공지사항 등록, 수정, 삭제 (관리자)

- 장바구니 (cart)

  - 장바구니 담기
  - 장바구니 조회
  - 장바구니 삭제
  - 장바구니 상품 주문

- 주문
  - 상품 주문

<br>

#### 로그인,회원가입

<img src="https://github.com/yuseons/ShoppingMall/blob/master/img/login.jpg">
<img src="https://github.com/yuseons/ShoppingMall/blob/master/img/createMember.jpg">

#### MyPage

<img src="https://github.com/yuseons/ShoppingMall/blob/master/img/MyPage.jpg">
<img src="https://github.com/yuseons/ShoppingMall/blob/master/img/update%2CdeleteMember.jpg">

#### 상품

<img src="https://github.com/yuseons/ShoppingMall/blob/master/img/contents.jpg">
<img src="https://github.com/yuseons/ShoppingMall/blob/master/img/review.jpg">

### 📜 DB

- member : 회원 정보 테이블
- contents : 상품 정보 테이블
- review : 상품에 대한 리뷰 테이블
- orders : 회원들의 주문 목록 테이블
- order_detail : 회원들의 주문 상세 테이블
- cart : 장바구니 테이블

![shopping](https://github.com/yuseons/TIL/blob/master/image/shopping.jpg)
