<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    <link rel="stylesheet" href="assets/css/responsive.css">
    <style>
    	.slider-height3 {
		    min-height: 50px !important;
		}
		
		.loginBox{
			text-align: center;
			height: 330px;
			width: 280px;
			border: solid #aa67ff;
			border-width: 2px;
			border-radius: 25px;
			z-index: 2;
			margin: auto;
			margin-top:40px; /* this is half the height of your div*/  
			
		}
		
		#id{
			margin-top: 30px;
		}
		#password{
			margin-top: 10px;
		}
		
		.login-signup-button{
			margin-top: 40px;
			background: #aa67ff !important;
			color: #fff !important;
			text-align: center;
			border: solid #aa67ff !important;
			font-size: 15px;
		}
		
		.login-signup-button:hover {
		    background: #fff !important;
		    cursor: pointer;
		    color: #aa67ff !important;
		    border: solid #aa67ff !important;
		    border-width: 1px;
		    font-size: 15px;
		}
		
		.signup-link{
			color: #635c5c;
			margin-top: 30px;
			font-size: 15px;
		}
    </style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	
	function loginbtn_click(){
		
		$.ajax({
			type: "post",
			url: "idcheck.do",
			data: "id=" + $('#id').val(),
			success: function(flag) {
				if(flag=="false"){
					alert("존재하지 않는 아이디 입니다.");
				}else {
					$.ajax({
						type: "post",
						url: "passcheck.do",
						data: "id="+$('#id').val()+"&password="+$('#password').val(),
						success: function(flag) {
							if(flag=="false"){
								alert("비밀번호가 일치하지 않습니다.");
							}
							else{
								$('#login-form').submit();
							}
						}
						})
					}
			}
			})
	
	};//click
	$(function () {
		$('#login-form').keypress(function(e){
			if(e.keyCode === 13){
				loginbtn_click();
			}
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
                        <!-- Main-menu -->
                                
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
        <!--? Hero Start -->
        <div class="slider-area2">
            <div>
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap2 pt-20 text-center">
                                <h2>Login</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
       <div class="loginBox">
	       	
	       	<a href="index.jsp"><img style="width: 90px; margin-top: 10px" src="assets/img/logo/nakalaLOGO.png" alt=""></a>
	    	<form action="login.do" method="post" id="login-form">
	       	<h3>LOGIN</h3>
	       	<input type="text" id="id" name="id" placeholder="id" required><br>
	       	<input type="password" id="password" name="password" placeholder="password" required>
	       	<input type="button" class="genric-btn primary-border login-signup-button" id="loginbtn" onclick="loginbtn_click();" value="login"><br>
			</form><br>
	       	<a href="register.html" class="signup-link"><u>signup</u></a>
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