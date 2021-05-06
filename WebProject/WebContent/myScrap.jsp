<%@page import="com.naka.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="assets/css/slick.css">
	<link rel="stylesheet" href="assets/css/nice-select.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<style>
		.login-signup-button{
	        margin-top:20px;
	        background: #aa67ff !important;
	        color: #fff !important;
	        text-align: center;
	        border: solid #aa67ff !important;
	        font-size: 15px;
	     }
	     
	     .login-signup-button:hover {
	         margin-top:20px;
	         background: #fff !important;
	         cursor: pointer;
	         color: #aa67ff !important;
	         border: solid #aa67ff !important;
	         font-size: 15px;
	     }
		.blog-author{
			margin: 0 auto;
			margin-top:10px !important;
			width: 90%;
		}
		#supoortBtn{
			margin-left:20px;
		}
		.delete {
			background-image: url(assets/img/elements/times-solid.svg);
			background-repeat: no-repeat;
			width:19px; height:19px;
			object-fit: cover;
			position: relative;
			left: 15px;
			bottom: 60px;
		}
		.indexing{
			width: 100%;
		    padding-right: 15px;
		    padding-left: 15px;
		    margin-right: auto;
		    margin-left: auto;
			text-align: center;
		}
		.sectPad{
			padding-top: 100px;
			padding-bottom: 30px;
		}
		.pageBtn{
			padding: 0px 10px !important;
			line-height: 30px !important;
			font-size: .9em  !important;
			margin-right: 4px;
			border: solid #aa67ff !important;
			color: #aa67ff !important;
		}
		.pageBtnA{
			padding: 0px 10px !important;
			line-height: 30px !important;
			font-size: .9em  !important;
			margin-right: 4px;
			background: #aa67ff !important;
			border: solid #aa67ff !important;
			color: #fff !important;
		}
		.pageBtn:hover{
			background: #aa67ff !important;
			border: solid #aa67ff !important;
			color: #fff !important;
		}
		#supoortBtn:hover{
			color: #170B3B !important;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(function() {
			refresh(0);
			
			$('#scrap_info').on('click','.delete', function() {
				var r_id = $(this).attr('id');
				var index = $(this).attr('name');
				index = parseInt(index);
				$.ajax({
	       			type:'post',
	       			url:'scrapdelete.do?',/*응답하는 데이터 타입이 객체일 때 json 이라고 지정*/
	       			data:'r_id=' + r_id+'&u_id=${rvo.u_id}',
	       			success: function(result) {
	       				if((index % 10 == 0) && (index != 0)) refresh(clickPage-1);
	       				else refresh(clickPage);
	   				}//callback
	       		});//ajax
			});
		});

		function refresh(index) {
			clickPage = index;
			var scrapList = [];
			scrapList = scrap('${rvo.u_id}');
			if(scrap_list[0] == 0){
				$('#scrap_info').html("<p align='center'>스크랩이 존재하지 않습니다.</p>");
				$('.pageBtnA').remove();
				return;
			}
			var len = scrapList.length-1;
			pageNum = len / 10;
			pageNum++;
			pageNum = parseInt(pageNum);
			if(len % 10 == 0) pageNum--; 
			var html2 = "";
			for(var i=0;i<pageNum;i++){
				if(i == index){
					html2 += '<a href="#" class="genric-btn primary-border pageBtnA" onclick="refresh('+i+')">'+(i+1)+'</a>'
				}else{
					html2 += '<a href="#" class="genric-btn primary-border pageBtn" onclick="refresh('+i+')">'+(i+1)+'</a>'
				}
				
			}
			
			$('.indexing').html(html2);
			
			if((len-(index*10)) > 10){
				len = (index + 1) * 10;
			}
			
			html = "";
			for(var i=(index*10);i<len;i++){
				$.ajax({
	       			type:'post',
	       			url:'scrapRecruit.do?id='+scrap_list[i],
	       			async: false,
	       			success: function(result) {
	       				var json = JSON.parse(result);
	       				html += '<div class="blog-author"><div class="media align-items-center">';
	    		        html += '<img src="'+ json.logo_img +'" alt="">';
	    		        html += '<div class="media-body"><a href="recruit_detail.do?id='+json.r_id+'"><h4>'+json.title+'</h4></a>';
	    		        html += '<p>'+json.tech+'</p></div>';
	    		        html += '<a href="'+json.link+'" class="genric-btn primary login-signup-button" id="supoortBtn">지원하기</a>';
	    		        html += '<svg class="delete" id='+json.r_id+' name='+i+'></svg></div></div>'
	   				}//callback
	       		});//ajax
			}
			$('#scrap_info').html(html);
		}
		
		var scrap_list = [];
		function scrap(u_id){

			$.ajax({
       			type:'post',
       			url:'scrap.do?u_id='+u_id,/*응답하는 데이터 타입이 객체일 때 json 이라고 지정*/
       			async: false,
       			success: function(result) {
       				str = result.split(",");
       				scrap_list = str.map(i=>Number(i));
   				}//callback
       		});//ajax
       		
       		return scrap_list;
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
                              <h2>Scrap</h2>
                           </div>
                     </div>
                  </div>
               </div>
         </div>
      </div>
      <!-- ? Hero END -->
     <section class="single-post-area sectPad">
        <div class="container" id="scrap_info"></div>
	</section>
	<div class="indexing"></div>
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