<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Hexashop - Contact Page</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">
<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->
	<script src="http://code.jquery.com/jquery-3.7.1.min.js" ></script>
	<script>
		$(document).ready(function(){
			$('.chkbtn').click(function(){
				$.ajax({    
				    url: '/ShoppingMall/checkUserId.do',
				    type: 'GET', // GET 메서드를 사용하려면 type을 명시하는 것이 좋습니다.
				    data: {
				        id: $('input#id').val()
				    },
				    success: function(response) {
				        alert(response);
				    },
				    error: function() {
				        alert('서버상태가 안좋습니다. 잠시후 다시 시도해주세요.');
				    }
				})
				
				/* httpRequest.open('get', 'hello.jsp',true)
				http.Request.send() */
			})
		})
	</script>

    </head>
    
    <body>
    
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
   	<jsp:include page="/header.jsp" />
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
    <div class="page-heading about-page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                        <h2>회원가입</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** Signup Area Starts ***** -->
    <div class="contact-us">
        <div class="container">
         	<form action="./signUp.do" method="post" accept-charset="utf-8">
            	<div class="row">
                	<div class="col-lg-3" style="text-align:right">
                    	아이디:
                	</div>
                	<div class="col-lg-4">
                    	<input id="id" name="id" type="text"  size="50">
                	</div>
                	<div class="col-lg-3">
                    	<input class="chkbtn" type="button" value="중복확인" >
                	</div>
                </div>
                <div class="row">
                	<div class="col-lg-3" style="text-align:right">
                    	패스워드: 
                	</div>
                	<div class="col-lg-4">
                    	<input name="password" type="password">
                	</div>
                </div>
                <div class="row">
                	<div class="col-lg-3" style="text-align:right">
                    	이름: 
                	</div>
                	<div class="col-lg-4">
                    	<input name="username" type="text">
                	</div>
                </div>
                <div class="row">
                	<div class="col-lg-3" style="text-align:right">
                    	성별: 
                	</div>
                	<div class="col-lg-4">
                    	<select name="gender">
						    <option value="M">남성</option>
						    <option value="F">여성</option>
					    </select>
                	</div>
                </div>
                <div class="row">
                	<div class="col-lg-3" style="text-align:right">
                    	이메일:  
                	</div>
                	<div class="col-lg-3">
                    	<input name="emailid" type="text">
                	</div>
                	@
                	<div class="col-lg-4">
                    	<input name="emaildomain" type="text">
                	</div>
                </div>
                <div class="row">
                	<div class="col-lg-3" style="text-align:right">
                    	전화번호: 
                	</div>
                	<div class="col-lg-4">
                    	<input name="phone" type="text">
                	</div>
                </div>
                <div class="row">
                	<div class="col-lg-3" style="text-align:right">
                    	우편번호: 
                	</div>
                	<div class="col-lg-3">
                    	<input name="postcode" type="text">
                	</div>
                </div>
                <div class="row">
                	<div class="col-lg-3" style="text-align:right">
                    	집주소: 
                	</div>
                	<div class="col-lg-8">
                    	<input name="homeaddress" type="text">
                	</div>
                </div>
                <div class="row">
                	<div class="col-lg-3" style="text-align:right">
                    	상세주소: 
                	</div>
                	<div class="col-lg-8">
                    	<input name="detailaddress" type="text">
                	</div>
                </div>
                <br><br><br>
                <div class="row" style="place-items: center; display: grid;">
	               	<div class="col-lg-3">
	               		<input type="submit">
	               	</div>
                </div>
           	</form>
        </div>
    </div>
    <!-- ***** Signup Area Ends ***** -->

    

    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="first-item">
                        <div class="logo">
                            <img src="assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
                        </div>
                        <ul>
                            <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                            <li><a href="#">hexashop@company.com</a></li>
                            <li><a href="#">010-020-0340</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <h4>Shopping &amp; Categories</h4>
                    <ul>
                        <li><a href="#">Men’s Shopping</a></li>
                        <li><a href="#">Women’s Shopping</a></li>
                        <li><a href="#">Kid's Shopping</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><a href="#">Homepage</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Help &amp; Information</h4>
                    <ul>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">FAQ's</a></li>
                        <li><a href="#">Shipping</a></li>
                        <li><a href="#">Tracking ID</a></li>
                    </ul>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 
                        
                        <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a>

                        <br>Distributed By: <a href="https://themewagon.com" target="_blank" title="free & premium responsive templates">ThemeWagon</a></p>
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    

    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/slick.js"></script> 
    <script src="assets/js/lightbox.js"></script> 
    <script src="assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>

  </body>

</html>
