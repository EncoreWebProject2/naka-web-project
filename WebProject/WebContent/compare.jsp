<%@page import="com.naka.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% UserVO rvo = (UserVO)session.getAttribute("rvo"); %>
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
    <style type="text/css">
    html {
  box-sizing: border-box;
  font-family: 'Open Sans', sans-serif;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.background {
  padding: 0 25px 25px;
  position: relative;
  width: 100%;
}

.background::after {
  content: '';
  background: #170B3B;
  background: -moz-linear-gradient(top, #170B3B 0%, #FAFAFA 100%);
  background: -webkit-linear-gradient(top, #170B3B 0%,#FAFAFA 100%);
  background: linear-gradient(to bottom, #170B3B 0%,#FAFAFA 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#170B3B', endColorstr='#FAFAFA',GradientType=0 );
  height: 350px;
  left: 0;
  position: absolute;
  top: 0;
  width: 100%;
  z-index: 1;
}

@media (min-width: 900px) {
  .background {
    padding: 0 0 25px;
  }
}

.container {
  margin: 0 auto;
  padding: 50px 0 0;
  max-width: 960px;
  width: 100%;
}

.panel {
  background-color: #fff;
  border-radius: 10px;
  padding: 15px 25px;
  position: relative;
  width: 100%;
  z-index: 5;
}

.compare-table {
  box-shadow: 0px 10px 13px -6px rgba(0, 0, 0, 0.08), 0px 20px 31px 3px rgba(0, 0, 0, 0.09), 0px 8px 20px 7px rgba(0, 0, 0, 0.02);
  display: flex;
  flex-direction: column;
}

@media (min-width: 900px) {
  .compare-table {
    flex-direction: row;
  }
}

.compare-table * {
  font-family: system-ui;
  text-align: center;
  text-transform: uppercase;
}

.compare-plan {
  border-bottom: 1px solid #e1f1ff;
  padding: 25px;
}

.compare-plan:last-child {
  border-bottom: none;
}

@media (min-width: 900px) {
  .compare-plan {
    border-bottom: none;
    border-right: 1px solid #e1f1ff;
    flex-basis: 100%;
  }

  .compare-plan:last-child {
    border-right: none;
  }
}

.compare-img {
  margin-bottom: 25px;
  max-width: 100%;
}

.compare-title {
  color: #888;
  font-weight: 600;
  height:100px;
  margin-top: 7%;
  text-align: center;
}

.compare-features {
  font-weight: 600;
  letter-spacing: 1px;
  margin: 50px 0 25px;
}

.compare-features-job_type {
  border-top: 1px solid #e1f1ff;
  font-size: 14px;
  line-height: 1.5;
  padding: 15px 0;
}

.compare-features-job_type:last-child {
  border-bottom: 1px solid #e1f1ff;
}

.compare-features-tech {
  border-top: 1px solid #e1f1ff;
  height: 100px;
  font-size: 12px;
  line-height: 1.5;
  padding: 15px 0;
}

.compare-features-position {
  border-top: 1px solid #e1f1ff;
  font-size: 14px;
  line-height: 1.5;
  padding: 15px 0;
}

.compare-features-position:last-child {
  border-bottom: 1px solid #e1f1ff;
}


.compare-exp_date {
  color: #170B3B;
  display: block;
  font-size: 15px;
  font-weight: 700;
}

.compare-button {
  border: 1px solid #BDBDBD;
  border-radius: 10px;
  background-color: #4B088A;
  color: #fff;
  display: inline-block;
  margin: 25px 0;
  padding: 15px 35px;
  text-decoration: none;
  transition: all 150ms ease-in-out;
}

.compare-button:hover,
.compare-button:active {
  background-color: #B367FF;
}

.scrap-button svg {
	width:18px; height:18px;
	object-fit: cover;
	float: left;
}


.delete svg {
	background-image: url(assets/img/elements/times-solid.svg);
	background-repeat: no-repeat;
	width:19px; height:19px;
	object-fit: cover;
	float: right;
}



.company {
	height:350px;
	margin-top: 20%;
	display: flex;           /* establish flex container */
    flex-direction: column;  /* make main axis vertical */
    justify-content: center; /* center items vertically, in this case */
    align-items: center;  
	
}
.slider-height3 {
    height: 130px !important;
}

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    
		$(function(){
			refresh();
			
			$('#compare-table').on('click', '.delete', function() {
	      		var arr = []
	            if(localStorage.getItem('compareStorage') != null){
	               var output = localStorage.getItem('compareStorage');
	               arr = JSON.parse(output);
	            }
	      		if(arr.length !=null  && arr.length > 2){
	      			var idx = $(this).attr('id');
			        for(var i=0; i<arr.length; i++){
		            	if(arr[i].r_id == idx){
		            		arr.splice(i, 1);
		            	}
		            }
		            
		            localStorage.setItem('compareStorage',JSON.stringify(arr));
				}else{
					alert("공고는 2개 이상 비교가 가능합니다.");
				}
	            
	      		refresh();
	
	            
			});
		
			$('#compare-table').on('click','.scrap-button', function() {
				
				var r_vo = '${rvo}';
				var u_id = '${rvo.u_id}';
				
				if(u_id == ""){
					alert("로그인이 필요한 서비스 입니다.");
					return;
				}
				
				var r_id = $(this).attr('id');
				var s = $('#'+ r_id + " svg").attr('id');
				if(s == "svg1"){
					$('#' + r_id +' svg').css("background-image", "url(assets/img/elements/heart-solid.svg)");
					$('#'+ r_id + " svg").attr('id','svg2');
					$.ajax({
		       			type:'post',
		       			url:'scrapadd.do',/*응답하는 데이터 타입이 객체일 때 json 이라고 지정*/
		       			data:'r_id=' + r_id+'&u_id='+u_id,
		       			success: function(result) {
		   				}//callback
		       		});//ajax
				}else{
					$('#' + r_id +' svg').css("background-image", "url(assets/img/elements/heart-regular.svg)");
					$('#'+ r_id + " svg").attr('id','svg1');
					$.ajax({
		       			type:'post',
		       			url:'scrapdelete.do?',/*응답하는 데이터 타입이 객체일 때 json 이라고 지정*/
		       			data:'r_id=' + r_id+'&u_id='+u_id,
		       			success: function(result) {
		   				}//callback
		       		});//ajax
				}
				
				
			});
		});
		

      	var scrap_list = [];
		function scrap(u_id){

			$.ajax({
       			type:'post',
       			url:'scrap.do?u_id='+u_id,/*응답하는 데이터 타입이 객체일 때 json 이라고 지정*/
       			async: false,
       			success: function(result) {
       				str = result.split(",");
       				scrap_list = str.map(i=>Number(i));
       				console.log(scrap_list);
   				}//callback
       		});//ajax
       		
       		return scrap_list;
		}
		function refresh(){
			var output = localStorage.getItem('compareStorage');
			var compare_list = JSON.parse(output);
			var str="";
			var scrapList = [];
			var r_vo = '${rvo}';
			var u_id = '${rvo.u_id}';
			
			if(u_id != ""){
				scrapList = scrap(u_id);
			}
			
			for(key in compare_list){
				var src;
				var svg;
				if(scrapList.includes(compare_list[key].r_id) == false){
					src = "url(assets/img/elements/heart-regular.svg)";
					svg = "svg1";
				}else{
					src = "url(assets/img/elements/heart-solid.svg)";
					svg = "svg2";
				}
				str += "<div class='compare-plan'>"
					       +"<a class='scrap-button' id='" +compare_list[key].r_id +"'><svg style='background-image:"+src+"' id='"+svg+"'></svg></a><div id='"+compare_list[key].r_id +"' class='delete'><svg></svg></div>"
					         +"<div class='company'><img src="+compare_list[key].img+" alt=''class='compare-img'></div>"
					           +"<h5 class='compare-title'>"+compare_list[key].title+"</h5>"
					           	 +"<ul class='compare-features'>"
					           	+"<li class='compare-features-position'>"+compare_list[key].position+"</li>"
					           	 +"<li class='compare-features-tech'>"+compare_list[key].tech+"</li>"
		                         +"<li class='compare-features-job_type'>"+compare_list[key].job_type+"</li></ul>"
		                         +"<span class='compare-exp_date'>"+compare_list[key].exp_date+"</span>"
		                         +" <a href='recruit_detail.do?id="+ compare_list[key].r_id + "'  target='_blank' class='compare-button'>공고보기</a></div>";

			}
			$("#compare-table").html(str);
		}
		
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
                        <div class="main-menu f-right d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                   <li><a href="ranking.jsp">Ranking</a></li>
                                   <li><a href="contact.html">About Us</a></li>
                                </ul>
                            </nav>
                        </div>          
               			<div class="header-btns d-none d-lg-block f-right">
                        <%if(rvo == null) {%>
                            <a href="register.html" class="mr-40">&nbsp;&nbsp;Sign up</a>
                            <a href="login.jsp" class="mr-40"><i class="ti-user"></i> Log in</a>
                        <%}else{ %>	
                        <!-- 로그인 이후 페이지 -->
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
        <!-- Table Start -->
        <div class="background">
 			 <div class="container">
    			<div class="panel compare-table" id="compare-table"> 
				<!-- compare-table-plan -->
    			</div>
  			</div>
		</div>
 		<!-- Table End -->
        
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