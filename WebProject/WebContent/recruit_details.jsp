<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>DirectoryListing</title>
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
   <link rel="stylesheet" href="assets/css/slick.css">
   <link rel="stylesheet" href="assets/css/nice-select.css">
   <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
   <!--? Preloader Start -->
   <div id="preloader-active">
      <div class="preloader d-flex align-items-center justify-content-center">
          <div class="preloader-inner position-relative">
              <div class="preloader-circle"></div>
              <div class="preloader-img pere-text">
                  <img src="assets/img/logo/loder.png" alt="">
              </div>
          </div>
      </div>
   </div>
   <!-- Preloader Start -->
   <header>
      <!-- Header Start -->
      <div class="header-area header-transparent" style="background-color: #f0e9ff">
          <div class="main-header header-sticky">
              <div class="container-fluid">
                  <div class="menu-wrapper d-flex align-items-center justify-content-between">
                      <!-- Logo -->
                      <div class="logo">
                          <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                      </div>
                      <!-- Main-menu -->
                      <div class="main-menu f-right d-none d-lg-block" >
                          <nav>
                              <ul id="navigation">
                                  
                                  <li><a href="blog.html">Ranking</a>
                                      <ul class="submenu">
                                          <li><a href="blog.html">Blog</a></li>
                                          <li><a href="blog_details.html">Blog Details</a></li>
                                          <li><a href="elements.html">Elements</a></li>
                                      </ul>
                                  </li>
                                 
                              </ul>
                          </nav>
                      </div>          
                      <!-- Header-btn -->
                      <div class="header-btns d-none d-lg-block f-right">
                          <a href="#" class="mr-40"><i class="ti-user"></i> Log in</a>                          
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
      <!--? Hero Start  이미지... 여기에 공고 제목?-->
      
      <!-- Hero End -->
      <!--? Blog Area Start -->
      <section class="blog_area single-post-area section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg posts-list">
                  <div class="single-post">
                  
                     <div class="blog-author">
                     	<div class="media align-items-center">
                        	<img src="assets/img/logo/${cvo.img}" alt="">
                        	<div class="media-body">
                           		<a href="#">
                             	 <h2>회사제목 - 라인</h2>
                          		 </a>
                           		<p>${rvo.title}</p>                      
                        	</div>         
                        	
                        	<div class="col-xl-4 col-lg-4 col-md-5">
                        		 <div class="footer-social f-right sm-left">
                             		
                             		<a href="#"><i class="fa fa-heart" aria-hidden="true"></i></a>
                        		 </div>
                     		</div>
                        	            
                        	
                        	
                        	<a href="#" class="btn">지원하기</a>
                    	</div>
                  	</div> <!-- blog-author,회사 이름 -->
                      <div class="quote-wrapper">
                      <p>접수 기간 : </p>
                           <ul class="unordered-list">
								<li>직군 : ${rvo.position}</li>
								<li>기술 스택 : ${rvo.tech}</li>
								<li>채용 형태 :  ${rvo.job_type} </li>
								<li>학력  :  ${rvo.education}</li>
								
							</ul>
                        </div><!-- blog-author, 주요 회사 정보 -->
                     
                     
                     <div class="feature-img">
                        <img class="img-fluid" src="assets/img/post/${rvo.img}" alt="">
                     </div>
                     
              
            </div>
         </div>
      </section>
   
    
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
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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