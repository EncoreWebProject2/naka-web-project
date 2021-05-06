<%@page import="com.naka.vo.RecruitVO"%>
<%@page import="com.naka.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  UserVO vo = (UserVO)session.getAttribute("rvo"); %>
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
   <style type="text/css">

	.scrap-button svg {
		width:18px; height:18px;
		object-fit: cover;
		float: left;
		
	}
	.scrap-button{
		margin-right:10px;
		border:none;
		background-color: transparent !important;
	}
   </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script type="text/javascript">
   	$(function(){
   		setScrap();
   		
   		$('.scrap-button').click(function() {
			
   			var u_id = '${sessionScope.rvo.u_id}';
   			
			if(u_id == ""){
				alert("로그인이 필요한 서비스 입니다.");
				return;
			}
			
			var r_id = '${rvo.r_id}'
			var s = $('.scrap-button svg').attr('id');
			if(s == "svg1"){
				$('.scrap-button svg').css("background-image", "url(assets/img/elements/heart-solid.svg)");
				$('.scrap-button svg').attr('id','svg2');
				$.ajax({
	       			type:'post',
	       			url:'scrapadd.do',/*응답하는 데이터 타입이 객체일 때 json 이라고 지정*/
	       			data:'r_id=' + r_id+'&u_id='+u_id,
	       			success: function(result) {
	   				}//callback
	       		});//ajax
			}else{
				$('.scrap-button svg').css("background-image", "url(assets/img/elements/heart-regular.svg)");
				$('.scrap-button svg').attr('id','svg1');
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
   				scrap_list = result.split(",");
   			}//callback
   		});//ajax
   		
   		return scrap_list;
	}
   	
   	function setScrap() {
   		var scrapList = [];
		var u_id = '${sessionScope.rvo.u_id}';
		
		if(u_id != ""){
			scrapList = scrap(u_id);
		}
		
		var src;
		var svg;

		
		if(scrapList.includes("${rvo.r_id}") == false){			
			$('.scrap-button svg').css("background-image", "url(assets/img/elements/heart-regular.svg)");
			$('.scrap-button svg').attr('id','svg1');
		}else{
			$('.scrap-button svg').css("background-image", "url(assets/img/elements/heart-solid.svg)");
			$('.scrap-button svg').attr('id','svg2');
		}
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
                      <div class="main-menu f-right d-none d-lg-block" >
                          <nav>
                               <ul id="navigation">
                                   <li><a href="ranking.jsp">Ranking</a></li>
                                   <li><a href="contact.html">About Us</a></li>
                                </ul>
                          </nav>
                      </div>          
                      <!-- Header-btn -->
                      <div class="header-btns d-none d-lg-block f-right">
                          <%if(vo == null) {%>
                            <a href="register.html" class="mr-40">&nbsp;&nbsp;Sign up</a>
                            <a href="login.jsp" class="mr-40"><i class="ti-user"></i> Log in</a>
                        <%}else{ %>	
							<!-- 로그인 이후 화면 -->
							<div class="main-menu f-right d-none d-lg-block">
	                            <nav>
	                                <ul id="navigation">
	                                   <li><a href="logout.do" class="mr-40"> Log out</a></li>
	                                   <li><a href="#" class="mr-40"><i class="ti-user"></i>&nbsp;&nbsp;<%= vo.getName() %>님</a>
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
      <!--? Hero Start  이미지... 여기에 공고 제목?-->
      <div class="slider-area2">
            <div class="slider-height3  hero-overly hero-bg4 d-flex align-items-center" style="max-height: 150px;">
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
      <!--? Blog Area Start -->
      <section class="blog_area single-post-area section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg posts-list">
                  <div class="single-post">
                  
                     <div class="blog-author">
                     	<div class="media align-items-center">
                        	<img src="${cvo.logo_img}" alt="">
                        	<div class="media-body">
                           		
                             	 <h2>${cvo.company_name} </h2>
                          		
                           		<p>${rvo.title}</p>                      
                        	</div>   
                            <button class='scrap-button'><svg></svg></button>
                        	<a href="${rvo.link}" class="btn">지원하기</a>
                    	</div>
                  	</div> <!-- blog-author,회사 이름 -->
                      <div class="quote-wrapper">
                      <p>접수 기간 :&nbsp; 
                      <c:choose>
						<c:when test="${rvo.exp_date==null && rvo.start_date==null}">상시채용</c:when>
						<c:when test="${rvo.exp_date==null && rvo.start_date!=null}"> ${rvo.start_date} ~ 채용시</c:when>
						<c:otherwise>  ${rvo.start_date} ~ ${rvo.exp_date} </c:otherwise>
					  </c:choose>	
                     
                      </p>
                           <ul class="unordered-list">
								<li>직군 : ${rvo.position}</li>
								<li>기술 스택 : ${rvo.tech}</li>
								<li>채용 형태 :  ${rvo.job_type} </li>
								<li>학력  :  
								<c:choose>
								<c:when test="${rvo.education==''}">무관</c:when>
								<c:otherwise> ${rvo.education} </c:otherwise>
								</c:choose>								
								</li>
								
							</ul>
                        </div><!-- blog-author, 주요 회사 정보 -->
                     
                     
                     <div class="feature-img" align="center">
                        <img class="img-fluid" src="${rvo.img}" alt="" >
                     </div>
                     </div>
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