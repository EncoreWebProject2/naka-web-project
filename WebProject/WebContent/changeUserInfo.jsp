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
		
		.mr-40{
			color: rgb(112, 48, 160) !important;
			z-index: 2;
		}		
		.header-area .menu-wrapper .main-menu ul ul.submenu{
			background: rgba(179,103,255,0.8) !important; 
		}
			
		a, button {
		    color: rgb(112, 48, 160);
		    outline: medium none;
		}
		
		.blog_details div p {
    		margin-bottom: 0px;
		}
		.table-name{
			vertical-align: top;
    		padding-top: 5px;
    		width: 80px;
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
		
		table {
			border-collapse: separate;
			border-spacing: 0 10px;
		}
		
    </style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	 
	 function changeUser(){
		 var queryString = $("form[name=changeUserInfo]").serialize();
		    $.ajax({
				type: "post",
				url: "changeUserInfo.do",
				data: queryString,
			    encode: true,
				success: function(result) {
					alert('<%=rvo.getName() %>'+"님의 회원정보가 성공적으로 수정되었습니다");
					window.location.href = 'myPage.jsp'; 
		
				}
			});	
		 
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
                            <article class="blog_item">
                                <div class="blog_details">
                                        <h2 class="blog-head" style="color: #2d2d2d;">회원 정보 수정</h2>
                                    <form name="changeUserInfo" action="" method="post">
                                   <table>
							            <tr>
							                <td class="table-name" id="title" style="vertical-align:top">아이디</td>
							                <td>
							                	<div>
							                		<p><%=rvo.getU_id() %></p>
							                		<p><input type="hidden" name="id" value="<%=rvo.getU_id() %>"></p>
							                	</div>
							                </td>
							            </tr>
							            <tr>
							                <td class="table-name" id="title">이름</td>
							                <td>
							                	<div>
							                		<p><%=rvo.getName() %></p>
							                		<p><input type="text" name="name" value="<%=rvo.getName() %>"></p>
							                	</div>
							                </td>
							            </tr>
							            <tr>
							                <td class="table-name" id="title">주소</td>
							                <td>
							                	<div>
							                		<p><%=rvo.getAddress() %></p>
							                		<p><input type="text" name="address" value="<%=rvo.getAddress() %>"></p>
							                	</div>
							                </td>
							            </tr>   
							            <tr>
							                <td class="table-name" id="title">휴대전화</td>
							                <td>
							                	<div>
							                		<p><%=rvo.getPhone() %></p>
							                		<p><input type="text" name="phone" value="<%=rvo.getPhone() %>"></p>
							                	</div>
							                </td>
							            </tr>
							            <tr>
							                <td class="table-name" id="title">구직상태</td>
							                <td>
							                	<div>
							                		<p><%=rvo.getStatus() %></p>
							                		<p>						                		
											           <span><input type="radio" name="status" <% if(rvo.getStatus().equals("학생")){%> checked <%} %> value="학생"> 학생</span>
											           <span><input type="radio" name="status" <% if(rvo.getStatus().equals("구직자")){%> checked <%} %> value="구직자"> 구직자</span>
											           <span><input type="radio" name="status" <% if(rvo.getStatus().equals("채용담당자")){%> checked <%} %> value="채용담당자"> 채용담당자</span></p>
							                	</div>
							                </td>
							            </tr>  
							            <tr>
							                <td class="table-name" id="title">이메일</td>
							                <td>
							                	<div>
							                		<p><%=rvo.getEmail() %></p>
							                		<p><input type="text" name="email" value="<%=rvo.getEmail() %>"></p>
							                	</div>
							                </td>
							            </tr>
							            <tr>
							                <td class="table-name" id="title">분야</td>
							                <td>
							                	<div>
							                		<p><%=rvo.getJob_field() %></p>
							                		<p> <select class="select"  name="jobField" id="jobField" >
							                			  <option value="" <% if(rvo.getJob_field().equals("")){%> selected <%} %>>분야</option>
											              <option value="서버" <% if(rvo.getJob_field().equals("서버")){%> selected <%} %>>서버</option>
											              <option value="프론트엔드" <% if(rvo.getJob_field().equals("프론트엔드")){%> selected <%} %>>프론트엔드</option>
											              <option value="Network" <% if(rvo.getJob_field().equals("Network")){%> selected <%} %>>Network</option>
											              <option value="정보보호" <% if(rvo.getJob_field().equals("정보보호")){%> selected <%} %>>정보보호</option>
											              </select></p>
							                	</div>
							                </td>
							            </tr>        
							            <tr>
							                <td class="table-name" id="title">최종학력</td>
							                <td>
							                	<div>
							                		<p><%=rvo.getEducation() %></p>
							                		<p><select class="select" name="education" id="education" >
							                		  <option value="" <% if(rvo.getEducation().equals("")){%> selected <%} %>>최종학력</option>
										              <option value="고등학교 졸업" <% if(rvo.getEducation().equals("고등학교 졸업")){%> selected <%} %>>고등학교 졸업</option>
										              <option value="대학교 졸업 예정" <% if(rvo.getEducation().equals("대학교 졸업 예정")){%> selected <%} %>>대학교 졸업 예정</option>
										              <option value="대학교 졸업" <% if(rvo.getEducation().equals("대학교 졸업")){%> selected <%} %>>대학교 졸업</option>
										              <option value="석사 이상" <% if(rvo.getEducation().equals("석사 이상")){%> selected <%} %>>석사 이상</option>
										              </select></p>
							                	</div>
							                </td>
							            </tr>       
							            <tr>
							                <td class="table-name" id="title">생일</td>
							                <td>
							                	<div>
							                		<p><%=rvo.getBirth_day() %></p>
							                		<p><input type="date" name="birthday" value="<%=rvo.getBirth_day() %>"></p>
							                		
							                	</div>
							                </td>
							            </tr>							         
							        </table>
							        <div class="mt-10">
							        <br>
							           <input type="button" class="genric-btn primary-border submit_btn login-signup-button" onclick="changeUser();" value="회원 정보 수정">
							        </div>
    							 </form> 
                                </div>
                            </article>
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
                                        <a href="changePassword.jsp" class="d-flex">
                                            <p>비밀번호 변경</p>
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