<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		a, button {
		    color: rgb(112, 48, 160);
		    outline: medium none;
		}
		
		.table-name{
    		width: 80px;
		}
    </style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
	var myChart = null;
	function loadData(command){
		var labels = [];
		var input_data = [];
		var types = {"tech":["bar","기술"],"position":["bar","직군"],"job_type":["doughnut","채용 유형"]}
		
		$.ajax({
			url:"ranking.do",
			type:"post",
			data:{rank_command:command},
			success:function(data){
				var jsonObject = JSON.parse(data);
				for(key in jsonObject){
					labels.push(jsonObject[key].name);
					input_data.push(jsonObject[key].value);
				}
				var ctx = document.getElementById('myChart');
				if(myChart!=null){
					myChart.destroy();
				}
				
				myChart = new Chart(ctx, {
				    type: types[command][0],
				    data: {
				        labels: labels,
				        datasets: [{
				            label: types[command][1]+'별 공고수',
				            data: input_data,
				            backgroundColor: [
				                'rgba(181, 127, 179, 0.4)',
				                'rgba(103, 58, 183, 0.4)',
				                'rgba(0, 150, 100, 0.4)',
				                'rgba(0, 188, 212, 0.4)',
				                'rgba(205, 220, 57, 0.4)',
				                'rgba(139, 195, 74, 0.4)',
				                'rgba(76, 175, 80, 0.4)',
				                'rgba(63, 81, 181, 0.4)',
				                'rgba(255, 152, 0, 0.4)',
				                'rgba(255, 193, 7, 0.4)',
				                'rgba(255, 255, 59, 0.4)',
				                'rgba(233, 30, 99, 0.4)',
				                'rgba(244, 67, 54, 0.4)',
				                'rgba(252, 71, 20, 0.4)',
				                'rgba(255, 228, 225, 0.4)',
				                'rgba(250, 128, 114, 0.4)',
				                'rgba(238, 66, 102, 0.4)',
				                'rgba(199, 21, 133, 0.4)',
				                'rgba(137, 165, 234, 0.4)',
				                'rgba(255, 203, 107, 0.4)',
				                'rgba(203, 138, 144, 0.4)'
				            ],
				            borderColor: [
				            	  'rgba(181, 127, 179, 1)',
					                'rgba(103, 58, 183, 1)',
					                'rgba(0, 150, 100,1)',
					                'rgba(0, 188, 212, 1)',
					                'rgba(205, 220, 57, 1)',
					                'rgba(139, 195, 74, 1)',
					                'rgba(76, 175, 80, 1)',
					                'rgba(63, 81, 181,1)',
					                'rgba(255, 152, 0, 1)',
					                'rgba(255, 193, 7, 1)',
					                'rgba(255, 255, 59, 1)',
					                'rgba(233, 30, 99, 1)',
					                'rgba(244, 67, 54, 1)',
					                'rgba(252, 71, 20, 1 )',
					                'rgba(255, 228, 225, 1)',
					                'rgba(250, 128, 114,1)',
					                'rgba(238, 66, 102, 1)',
					                'rgba(199, 21, 133, 1)',
					                'rgba(137, 165, 234, 1)',
					                'rgba(255, 203, 107, 1)',
					                'rgba(203, 138, 144, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        scales: {
				            y: {
				                beginAtZero: true
				            }
				        }
				    }
				});
				
			}
		});
	}
	
	
	$(function(){
		var els = $(".rank-list li")
		var values = ["tech","position","job_type"];
		loadData("tech");
		for(var i=0;i<3;i++){
			$(els[i]).data("command",values[i]);
			$(els[i]).on("click",function(e){ loadData($(this).data("command"))});
		}
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
							<a href="#" class="mr-40"><i class="ti-user"></i>&nbsp;&nbsp;</a>
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
       <div class="ranking"> 
        <!--  -->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                            <article class="blog_item">
                                <div class="blog_details">
                                    <a class="d-inline-block" href="#">
                                        <h2 class="blog-head" style="color: #2d2d2d;">Ranking</h2>
                                    </a>
                                   	<div style="width:800px">
    								<canvas id="myChart" width="400" height="400"></canvas>
									
									</div>
                                </div>
                            </article>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget post_category_widget">
                                <ul class="list cat-list rank-list">
                                    <li> 
                                        <p>현재 가장 많이 필요로 하는 기술 스택 순위</p>    
                                    </li>
                                    <li>
                                        <p>현재 가장 많이 채용중인 직군 순위</p>
                                    </li>
                                    <li>
                                       	<p>채용형태 비율</p>
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