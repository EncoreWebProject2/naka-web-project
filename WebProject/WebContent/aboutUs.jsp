<%@page import="com.naka.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  UserVO rvo = (UserVO)session.getAttribute("rvo"); %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Nakala</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

   <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/hamburgers.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
    	.slider-height3 {
		    height: 200px;
		}
		
		#about-us-img{
			display: block;
			margin-left: auto;
			margin-right: auto;
			width: 700px;
		}
		
		.section-padding {
		    padding-top: 20px !important;
		    padding-bottom: 120px;
		}
    </style>
</head>
    <!--? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/nakalaLOGO.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper d-flex align-items-center justify-content-between">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="index.jsp"><img src="assets/img/logo/nakalaLOGO.png" alt=""></a>
                        </div>
                       <div class="main-menu f-right d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                   <li><a href="ranking.jsp">Ranking</a></li>
                                   <li><a href="aboutUs.html">About Us</a></li>
                                </ul>
                            </nav>
                        </div>     
                       <div class="header-btns d-none d-lg-block f-right">
                        <%if(rvo == null) {%>
                            <a href="register.html" class="mr-40">&nbsp;&nbsp;Sign up</a>
                            <a href="login.jsp" class="mr-40"><i class="ti-user"></i> Log in</a>
                        <%}else{ %>	
							<!-- 로그인 이후 화면 -->
							<div class="main-menu f-right d-none d-lg-block">
	                            <nav>
	                                <ul id="navigation">
	                                   <li><a href="logout.do" class="mr-40"> Log out</a></li>
	                                   <li><a href="#" class="mr-40"><i class="ti-user"></i>&nbsp;&nbsp;<%= rvo.getName() %>님</a>
	                                        <ul class="submenu">
	                                            <li><a href="myPage.jsp">MyPage</a></li>
	                                            <li><a href="myScrap.jsp">Scrap</a></li> 
	                                        </ul>
	                                    </li>
	                                </ul>
	                            </nav>
                        	</div> 
						<%} %>
						</div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
     </header>
    <main>
        <!--? Hero Start -->
        <div class="slider-area2">
            <div class="slider-height3  hero-overly hero-bg4 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap2 pt-20 text-center">
                                <h2>About Us</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="myPage"> 
        <!-- 가져온 회원정보를 출력한다. -->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                            <article class="blog_item">
                                <div class="blog_details">
                                        <h1 class="blog-head" style="color: #2d2d2d;">Nakala</h1><br>
                                  		<p>큰 테크 기업에 취직을 원하는 구직자들이 채용사이트를 매번 확인하고 비교해야하는 수고로움을 덜어주기 위해 기업별 채용 공고를 직관적으로 비교할 수 있게 모아놓고 동시에 트렌드를 확인할 수 있는 웹사이트이다.</p>
                                  		<p>다른 구직 사이트들과 비교했을때 공고 간 직관적인 비교가 가능하다는 차별점을 가지고 있다. </p>
                                  		<img id="about-us-img" src="assets/img/elements/compareExample.png" alt="">
                                </div>
                            </article>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
        <!-- Blog Area End -->
        
       </div>
    
    </main>
    <footer>
        <div class="footer-wrapper pt-30">
            <!-- footer-bottom -->
            <div class="footer-bottom-area">
                <div class="container">
                    <div class="footer-border">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div class="col-xl-10 col-lg-9 ">
                                <div class="footer-copy-right">
                                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  										Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Nakala</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
      <!-- JS here -->

      <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
      <!-- Jquery, Popper, Bootstrap -->
      <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
      <script src="./assets/js/popper.min.js"></script>
      <script src="./assets/js/bootstrap.min.js"></script>
      <!-- Jquery Mobile Menu -->
      <script src="./assets/js/jquery.slicknav.min.js"></script>

      <!-- Jquery Slick , Owl-Carousel Plugins -->
      <script src="./assets/js/owl.carousel.min.js"></script>
      <script src="./assets/js/slick.min.js"></script>
      <!-- One Page, Animated-HeadLin -->
      <script src="./assets/js/wow.min.js"></script>
      <script src="./assets/js/animated.headline.js"></script>
      <script src="./assets/js/jquery.magnific-popup.js"></script>

      <!-- Date Picker -->
      <script src="./assets/js/gijgo.min.js"></script>
      <!-- Nice-select, sticky -->
      <script src="./assets/js/jquery.nice-select.min.js"></script>
      <script src="./assets/js/jquery.sticky.js"></script>
      
      <!-- counter , waypoint,Hover Direction -->
      <script src="./assets/js/jquery.counterup.min.js"></script>
      <script src="./assets/js/waypoints.min.js"></script>
      <script src="./assets/js/jquery.countdown.min.js"></script>
      <script src="./assets/js/hover-direction-snake.min.js"></script>

      <!-- contact js -->
      <script src="./assets/js/contact.js"></script>
      <script src="./assets/js/jquery.form.js"></script>
      <script src="./assets/js/jquery.validate.min.js"></script>
      <script src="./assets/js/mail-script.js"></script>
      <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
      
      <!-- Jquery Plugins, main Jquery -->	
      <script src="./assets/js/plugins.js"></script>
      <script src="./assets/js/main.js"></script>

     
    </body>
</html>