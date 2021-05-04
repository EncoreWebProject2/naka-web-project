<%@page import="com.naka.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  UserVO rvo = (UserVO)session.getAttribute("rvo"); %>
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
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <style>
    	.slider-height3 {
		    min-height: 50px !important;
		}
		
		.section-padding {
		     padding-top: 0px !important; 
		     padding-bottom: 0px !important; 
		}
		
		#logoutHeader{
			color: rgb(112, 48, 160) !important;
			z-index: 2;
		}
		
		.blog_item{
			text-align: center;
		}
		
		#for-deleteAccount{
			text-align: left;
		}	
			
		a, button {
		    color: rgb(112, 48, 160);
		    outline: medium none;
		}
		
		.login-signup-button{
			margin-top:20px;
    		width: 30%;
			background: #aa67ff !important;
			color: #fff !important;
			text-align: center;
			border: solid #aa67ff !important;
			font-size: 15px;
		}
		
		.login-signup-button:hover {
		    margin-top:20px;
    		width: 30%;
		    background: #fff !important;
		    cursor: pointer;
		    color: #aa67ff !important;
		    border: solid #aa67ff !important;
		    font-size: 15px;
		}
		
    </style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){	
		$('input[name=password_check]').keyup(function() {
			
				if($(this).val() == $('input[name=password]').val()){
					$('#check_pass').html("비밀번호가 일치합니다.");
					$( "#check_pass" ).css( "color", "green" );
				}else{
					$('#check_pass').html("비밀번호가 일치하지 않습니다.");
					$( "#check_pass" ).css( "color", "red" );
				}
					
		});
		
		$("form").submit(function(){	    
	
		    $.ajax({
				type: "post",
				url: "deleteAccount.do",
				data: "id="+'<%=rvo.getU_id() %>'+"&password="+$('#password').val(),
				success: function(result) {
					alert("탈퇴가 성공적으로 완료되었습니다.");
					window.location.href = 'index.jsp'; 
					
				}
			});	
			
		});
	});
	
	</script>

</head>
<body>
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
						<div id="logoutHeader">
							<a href="logout.do" class="mr-40"> Log out</a>
							<a href="#" class="mr-40"><i class="ti-user"></i>&nbsp;&nbsp;<%= rvo.getU_id() %>님</a>
						</div>
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
            <div>
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap2 pt-20 text-center">
                                <h2></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
       <div class="myPage"> 
        <!-- 가져온 회원정보를 출력한다. -->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                            <form class="blog_item">
                                <div class="blog_details">
                                    <a class="d-inline-block" href="blog_details.html">
                                        <h2 class="blog-head" style="color: #2d2d2d;">회원 탈퇴</h2>
                                    </a>
                                <div class="mt-10" >
						           <p class="single-input" id="for-deleteAccount" ><%=rvo.getName() %></p>
						        </div>
						        <div class="mt-10">
						           <input type="password" name="password" id="password" placeholder="password"
						              onfocus="this.placeholder = ''" onblur="this.placeholder = 'password'" required
						              class="single-input">
						        </div>
						        <div class="mt-10">
						           <input type="password" name="password_check" placeholder="password check"
						              onfocus="this.placeholder = ''" onblur="this.placeholder = 'password check'" required
						              class="single-input">
						           <p id="check_pass"></p>
						        </div>
						        <div class="mt-10">
          							 <input type="submit" class="genric-btn primary-border submit_btn login-signup-button" value="탈퇴">
       						    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget post_category_widget">
                                <ul class="list cat-list">
                                    <li>
                                        <a href="myPage.jsp" class="d-flex">
                                            <p>회원 정보 보기</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="changeUserInfo.jsp" class="d-flex">
                                            <p>회원 정보 수정</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="d-flex">
                                            <p>비밀번호 수정</p>
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="deleteAccount.jsp" class="d-flex">
                                            <p>회원 탈퇴</p>
                                        </a>
                                    </li>
                                </ul>
                            </aside>
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