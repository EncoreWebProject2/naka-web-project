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
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/flaticon.css">
    <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="assets/css/gijgo.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/animated-headline.css">
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="assets/css/themify-icons.css">
	<link rel="stylesheet" href="assets/css/slick.css">
	<link rel="stylesheet" href="assets/css/nice-select.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<style>
    	button{
			cursor:pointer;
		}
    	.slider-height1 {
		    min-height: 120px !important;
		}
		
		#compareFooter{
			position:fixed; 
		}
		
		#cartText{
			position:fixed;
			left:0px; 
			bottom:0px; 
			z-index: 1;
			line-height:70px;
			height:60px; 
			width:170px; 
			background:#170B3B; 
			color: white;
			text-align: center;
			font-family: "Rubik",sans-serif;
			font-size: 15px;
			font-weight: 600;
		}
		
		#cartNum{
			background:rgb(255, 100, 97);
			color: white;
			font-size: 20px;
			font-weight: 500;
			display: inline-block;
		    position:fixed;
		    left:60px; 
			bottom:45px;
		    z-index: 2;
		    width: 50px;
		    height: 50px;
		    line-height:50px;
	        border-radius: 4px;
	        text-align: center;
	        font-family: system-ui;
		}
		
		#compareBox{
			position: fixed;
		    left: 50%;
		    bottom: 0;
		    z-index: 1;
		    transform: translate(-50%,0);
		    width: 1100px;
		    height: 80px;
		    text-align: center;
		    background: rgba(23, 11, 59, 0.95); 
		   
		}
		
		#compareList{
			display: inline-block;
		}
		
		.card{
			display: inline-block;
			float: left;
		    display: table;
		    width: 80px;
		    height: 80px;
		    margin-left: 70px;
		    background: rgba(23, 11, 59, 0); 
		}
		.card>div{
			margin:0 auto;
			position: absolute;
		}
		.card img{
			width: 50px;
		    height: 50px;
		    position: absolute;
		    margin-left:14px;
		    margin-top:13px;
		    top: 0;
		    left: 0;
		}
		#remove{
			width: 20px;
		    height: 20px;
		    margin-left: 50px;
		    margin-top: 8px;
		}
		.compareBtn{
			display: inline-block;
			margin-right: 200px;
			float: right;
			text-align: center;
		    width: 120px;
		    height: 40px;
		    line-height: 40px;
		    margin-top: 20px;
		    font-size: 16px;
		    color: #fff;
		    font-weight: 600;
		    background: rgba(255, 100, 97, 0.85);
		    border-radius: 3px;
		    left:800px; 
			bottom:40px;
			font-family: system-ui;
			
		}
		
		.compareBtn:hover {
		    background: rgba(255, 100, 97, 1);
		    cursor: pointer;
		}
		
		.cartBox:hover{
			cursor: pointer;
		}
		
		.whitePlus{
			color: #fff;
			z-index: 2;
			line-height: 80px;
		}
		.location-img{
			border: 4px solid #B367FF;
			border-radius:24px;
		}
		.location-img img{
			width: 330px;
			height: 330px;
			opacity: 0.4;
		}
		.location-details p{
			font-weight: bold;			
		}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	
	
		$(function () {
			showCart();
			arrLengthCheck();
			
			$("#compareBox").hide();
			$('.cartBox').click(function () {
				console.log("cartbox clicked");
				$("#compareBox").toggle(500);
				$('.cartBox').hide();
	    		
			});//click
	    	
			var previousScroll = 0;
		    $(window).scroll(function(event){
		       //alert("scrolllll");
		    	if($("#compareBox").is(":visible")){
		    		console.log("scroll");
		    		$('#compareBox').hide(500);
		    		$('.cartBox').show();
		    	}
		    });
      
      	$('.card').on('click', '#remove', function() {
	      		var arr = []
	            if(localStorage.getItem('compareStorage') != null){
	               var output = localStorage.getItem('compareStorage');
	               arr = JSON.parse(output);
	            }
	            
	            var idx = Number($(this).attr('name'));
	            arr.splice(idx, 1);
	            
	            localStorage.setItem('compareStorage',JSON.stringify(arr));
	
	            showCart();
	            arrLengthCheck();
			});

      
      	$('.row').on('click','button[name=addItemCart]',function () {
				//로컬 스토리지에 저장 setItem()		
				console.log("click");
				var arr = []
				if(localStorage.getItem('compareStorage') != null){
					var output = localStorage.getItem('compareStorage');
					arr = JSON.parse(output);
				}
				
				if(arr.length >= 3){
					alert("비교함이 가득 찼습니다. 슬롯을 비운 후 다시 시도해 주세요");			
				}else{
					var flag = false;
					for(var i = 0; i<arr.length;i++){
						if(arr[i].r_id==$(this).attr('id')){
							flag = true;
						}
					}
					if(flag){
						alert("비교함에 이미 존재하는 공고입니다.");
					}else{
						var id = $(this).val();
						
						$.ajax({
							type: "post",
							url: "CompareServlet",
							data: "id=" + id,
							
							success: function(result) {
								arr.push(JSON.parse(result));
								localStorage.setItem('compareStorage',JSON.stringify(arr));
							}
						});	
					}
					
				}		
				setTimeout(() => { arrLengthCheck(); }, 100);
				setTimeout(() => { showCart(); }, 100);
			});
      	
      	$('.compareBtn').click( function() {
      		var output = localStorage.getItem('compareStorage');
			arr = JSON.parse(output);
			if(arr.length !=null  && arr.length > 1){
				window.open('compare.jsp', '_blank');
			}else{
				alert("공고를 2개 이상 비교함에 넣어주세요.");
			}
		});
      

		});
		
    function showCart() {
			
	    	var arr = []
	        if(localStorage.getItem('compareStorage') != null){
	           var output = localStorage.getItem('compareStorage');
	           arr = JSON.parse(output);
	        }   
	        
	        var i;
	        var name;
	        var html;
	        for(i=0;i<arr.length;i++){
	           localStorage.setItem('compareStorage',JSON.stringify(arr));
	           html = "<div><img src=assets/img/logo/logo_circle.png>";
	           html += "<img src=" + arr[i].img +">";
	           html += "<img id=remove name=" + i + " src=assets/img/logo/removeBtn.png></div>";
	           
	           name = "#cart" + (i+1);
	           
	           $(name).html(html);
	           
	        }
	        var j;
	        for(j=i+1;j<=3;j++){
	           name = "#cart" + j;
	           html = "<i class='fa fa-plus-circle fa-3x whitePlus' aria-hidden='true'></i>"
	           
	           $(name).html(html);
	        }   
		}

    
		arrLengthCheck = function (){
			var cnt = 0;
			var output = localStorage.getItem('compareStorage');
			arr = JSON.parse(output);
			console.log("checking arr: "+arr);
			if(arr !=  null && arr.length >= 0){
				cnt = arr.length;
			}
			
			document.getElementById("cartNum").innerHTML = cnt;
			
		}
	
		var pageNumber = 1;
		var co_ids = {1:"네이버.png",2:"우아한형제들.jpg",3:"토스.png",4:"라인.png",5:"쿠팡.png",6:"당근마켓.png",7:"카카오.jpg"};
	
		function addLoadedRecruits(){
			$.ajax({
				url:"recruit.do",
				type:"post",
				data:{num:pageNumber},
				success:function(data){
					var jsonObject = JSON.parse(data);
					if(jsonObject.length>0){						
						$("#recruit_container div.row").html('');
						for(key in jsonObject){
							var title = jsonObject[key].title;
							if(title.length>24) title = title.substr(0,24)+"....";							
							var str = '<div class="col-lg-3 col-md-6 col-sm-6"><div class="single-location mb-30"><div class="location-img">'+
							'<img id="'+jsonObject[key].r_id+'" src="assets/img/logo/'+co_ids[jsonObject[key].c_id]+'" alt=""></div><div class="location-details"><p class="title">'+title+'</p>'+
	                        '<button class="location-btn" id="'+jsonObject[key].r_id+'" name="addItemCart" value="'+jsonObject[key].r_id+'">비교함 추가</button><a href="#"><img src="assets/img/gallery/heart1.png" alt=""></a>'+
	                        '</div></div></div>';
							$("#recruit_container div.row").append(str);
						}
						
						$("#recruit_container").trigger('create');
	                	$('.single-location img').click(function() {	                		
	            			var win = window.open("recruit_detail.do?id="+$(this).attr('id'));	
	        			});
					}
				}
			});
		}
		
		$(window).scroll(function() {	
		   if($(window).scrollTop() + $(window).height()+300 >=$(document).height()) {
			   pageNumber++;
			   addLoadedRecruits();
		   }
		});
			
	
		
		$(function () {
			addLoadedRecruits();			
	   		$('select').change(function(){
	   			if($(this).val()!='')
	   				addLoadedRecruits();
	   		});	
		});
		

</script>
</head>
<body>
    <!-- ? Preloader Start -->
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
                                   <li><a href="blog.html">Ranking</a>
                                        <ul class="submenu">
                                            <li><a href="blog.html">Tech Stack</a></li>
                                            <li><a href="blog.html">Position</a></li> 
                                            <li><a href="blog.html">Job Type</a></li> 
                                        </ul>
                                    </li>
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
							<a href="logout.do" class="mr-40"> Log out</a>
							<a href="#" class="mr-40"><i class="ti-user"></i>&nbsp;&nbsp;<%= rvo.getName() %>님</a>
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
        <!--? Hero Area Start-->
        <div class="slider-area hero-bg1 hero-overly">
            <div class="single-slider hero-overly  slider-height1 d-flex align-items-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-10">
                            <!-- Hero Caption -->
                            <div class="hero__caption pt-100">
                                <h1>Look for Jobs</h1>
                                <p>Let's find the pefect matching job for you.</p>
                            </div>
                            <!--Hero form -->
                            <form action="#" class="search-box" style="margin: 10px;">
                                <div class="input-form">
                                    <input type="text" placeholder="What are you finding?">
                                </div>
                                
                                <div class="search-form">
                                    <a href="#"><i class="ti-search"></i> Search</a>
                                    
                                </div>	
                            </form>	
                            <div class="select-form">
                                    <div class="select-itms" style="float: left; margin: 10px; margin-bottom: 30px;">
                                        <select name="select" id="select1">
                                            <option value="">직군</option>
                                            <option value="서버">서버</option>
                                        </select>
                                    </div>
                                    
                                    <div class="select-itms"  style="float: left; margin: 10px; margin-bottom: 30px;" >
                                        <select name="select" id="select2">
                                            <option value="">채용 형태</option>
                                            <option value="신입">신입</option>
                                        </select>
                                    </div>
                                    
                                    <div class="select-itms"  style="float: left; margin: 10px; margin-bottom: 30px;">
                                        <select name="select" id="select3">
                                            <option value="">학력</option>
                                            <option value="">무관</option>
                                        </select>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero Area End-->
        <!--? Popular Locations Start 01-->
        <div class="popular-location border-bottom section-padding40">
            <div id="recruit_container" class="container">
                <div class="row">                    
                    
                </div>
            </div>
        </div>
        <div class="compareFooter">
        	<div class="cartBox">
        		<div id="cartNum">0</div>
        		<div id="cartText">비교함에 담긴 공고 </div>
        		
        		
        	</div>
        	<div id="compareBox">
        		<span id="compareList">
        			<ul>
	        			<li class="card" id="cart1"><i class=fa fa-plus-circle fa-3x whitePlus aria-hidden=true></i></li>
	        			<li class="card" id="cart2"></li>
	        			<li class="card" id="cart3"></li>
        			</ul>
        		</span>
        		<span>
        			<button class="compareBtn on">비교하기</button>
        		</span>
        	</div>	
        		
        	
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
    <!-- Progress -->
    <script src="./assets/js/jquery.barfiller.js"></script>
    
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