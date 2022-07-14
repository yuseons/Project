<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html> 
<html> 
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>ShoppingMall</title>
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Simple line icons-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/css/index.css" rel="stylesheet" />
    </head>
    <body id="page-top">
    
        <!-- Navigation-->
        <a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
        <nav id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand"><a href="#page-top">DAILY</a></li>
                <li class="sidebar-nav-item"><a href="/contents/mainlist/1">TOP</a></li>
                <li class="sidebar-nav-item"><a href="/contents/mainlist/2">PANTS</a></li>
                <li class="sidebar-nav-item"><a href="/contents/mainlist/3">BAG</a></li>
                <li class="sidebar-nav-item"><a href="/contents/mainlist/4">SHOES</a></li>

    <c:choose>
    <c:when test="${empty sessionScope.id }">
                <li class="sidebar-nav-item"><a href="${root}/member/agree">JOIN</a></li>
                <li class="sidebar-nav-item"><a href="${root}/member/login">LOGIN</a></li>
	</c:when>    
    <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
                <li class="sidebar-nav-item"><a href="${root}/admin/contents/create">상품 등록</a></li>
                <li class="sidebar-nav-item"><a href="${root}/admin/contents/list">상품 목록</a></li>
                <li class="sidebar-nav-item"><a href="${root}/admin/member/list">회원 목록</a></li>
                <li class="sidebar-nav-item"><a href="${root}/admin/order/list">주문 목록</a></li>
                <li class="sidebar-nav-item"><a href="${root}/member/logout">LOGOUT</a></li>
    </c:when>
    <c:otherwise>
                <li class="sidebar-nav-item"><a href="${root}/cart/list">장바구니</a></li>
                <li class="sidebar-nav-item"><a href="${root}/member/update">회원 수정</a></li>
                <li class="sidebar-nav-item"><a href="${root}/member/logout">LOGOUT</a></li>
        </c:otherwise>
    </c:choose> 
            </ul>
        </nav>
     

        <!-- Header-->
        <header class="masthead d-flex align-items-center">
            <div class="container px-4 px-lg-5 text-center">
                <h1 class="mb-1">DAILY</h1>
                <a class="btn btn-primary btn-xl" href="/contents/mainlist/1">Shop now</a>
            </div>
        </header>

        <!-- Best-->
        <section class="content-section" id="portfolio">
            <div class="container px-4 px-lg-5">
                <div class="row gx-0">
   				 <div class="col-lg-6">
                        <a class="portfolio-item" href=/contents/mainlist/1>
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">TOP</div>
                                    <p class="mb-0">Whatever your vibe, top up your wardrobe now with our offering of women's tops.</p>
                                </div>
                            </div>
                            <img class="img-fluid" src="/img/top_main.jpg" alt="tops" />
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="/contents/mainlist/2">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">PANTS</div>
                                    <p class="mb-0">Get ready to find your perfect fit today with our range of jeans.</p>
                                </div>
                            </div>
                            <img class="img-fluid" src="/img/jeans_main.jpg" alt="jeans" />
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="/contents/mainlist/3">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">BAG</div>
                                    <p class="mb-0">Ensure you’re carrying your everyday essentials the right way this season with our on-trend collection of bags and purses for women.</p>
                                </div>
                            </div>
                            <img class="img-fluid" src="/img/bag_main.jpg" alt="bag" />
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="/contents/mainlist/4">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">SHOES</div>
                                    <p class="mb-0">Put your best foot forward and step out in style this season with our offering of the latest shoes for women to suit any occasion. </p>
                                </div>
                            </div>
                            <img class="img-fluid" src="/img/shoes_main.jpg" alt="shoes" />
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- -->
        <section class="content-section bg-primary text-white">
            <div class="container px-4 px-lg-5 text-center">
                <h2 class="mb-4">로그인 하시면 다양하고 특별한 혜택을 이용할 수 있습니다.</h2>
                <a class="btn btn-xl btn-light me-4" href="${root}/member/login">LOGIN</a>
                <a class="btn btn-xl btn-dark" href="${root}/member/agree">JOIN</a>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer text-center">
            <div class="container px-4 px-lg-5">
                <ul class="list-inline mb-5">
                    <li class="list-inline-item">
                        <a class="social-link rounded-circle text-white mr-3" href="#!"><i class="icon-social-facebook"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a class="social-link rounded-circle text-white mr-3" href="#!"><i class="icon-social-twitter"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a class="social-link rounded-circle text-white" href="#!"><i class="icon-social-github"></i></a>
                    </li>
                </ul>
                <p class="text-muted small mb-0">Copyright &copy; DAILY</p>
            </div>
        </footer>
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/index.js"></script>
    </body>
</html>
