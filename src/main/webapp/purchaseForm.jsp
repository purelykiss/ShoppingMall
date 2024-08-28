<%@page import="kr.ac.kopo.vo.BasketItem"%>
<%@page import="kr.ac.kopo.vo.GoodsPicture"%>
<%@page import="kr.ac.kopo.vo.GoodsInfo"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.vo.Search"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<BasketItem> selectBasketItem = (List<BasketItem>)request.getAttribute("selectBasketItem");
	pageContext.setAttribute("selectBasketItem", selectBasketItem);
	
	List<GoodsInfo> selectgoodsInfo = (List<GoodsInfo>)request.getAttribute("selectgoodsInfo");
	pageContext.setAttribute("selectgoodsInfo", selectgoodsInfo);
	
	int selectgoodsPrice = (int)request.getAttribute("selectgoodsPrice");
	pageContext.setAttribute("selectgoodsPrice", selectgoodsPrice);
%>
<!DOCTYPE html>
<html lang="ko">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Hexashop - About Page</title>


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
	<style>
	a.purchase:link{
		color: lightgray;	
	}
	a.purchase:visited{
		color: lightgray;
	}
	a.purchase:hover{
		color: gray;
	}
	a.purchase:active{
		color: black;
	}
	</style>
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
                        <h2>결제 페이지</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** About Area Starts ***** -->
    <div class="about-us">
        <div class="container">
        	<div class="row" style="height:200px">
        		<div class="col-lg-4" >
        			<span>결제 금액:</span><br>
        			<span style="">${selectgoodsPrice}&#8361;</span>
        		</div>
        		<div class="col-lg-4">
        			<span style="width:100%">
        				<span style="float:left">포인트:</span>
        				<div style="float:right;border-style:solid;border-width:1px">사용</div>
        			</span><br><br>
        			<span>
        				<span style="float:left">사용 전 결제 가격</span>
        				<span id="" style="float:right">&#8361;</span>
        			</span><br>
        			<span>
        				<span style="float:left">보유 포인트</span>
        				<span id="" style="float:right">&#8361;</span>
        			</span><br>
        			<span>
        				<span style="float:left">사용 포인트</span>
        				<span id="" style="float:right">&#8361;</span>
        			</span><br>
        			<span>
        				<span style="float:left">사용 후 결제 가격</span>
        				<span id="" style="float:right">&#8361;</span>
        			</span>
        		</div>
        		<div class="col-lg-4">
        			<span style="width:100%">
        				<span style="float:left">결제 수단:</span>
        				<span>
							<select name="paymethod" style="float:left">
								<option value="">&lt;결제 수단&gt;</option>
							    <option value="card">신용카드</option>
							    <option value="bill">계좌이체</option>
						    </select>
					    </span>
					    <a class="purchase" href="purchase.do">
					    	<div style="float:right;border-style:solid;border-width:1px">결제</div>
					    </a>
        			</span><br>
        		</div>
        	</div>
        	<hr/>
        	<c:forEach var="basketItem" items="${selectBasketItem}">
	            <div class="row">
                    <c:forEach var="goodsInfoItem" items="${selectgoodsInfo}">
                    	<c:if test="${goodsInfoItem.sellcode == basketItem.sellcode}">
			                <div class="col-lg-6">
	                    		<a href="detail.do?id=${goodsInfoItem.sellcode}">
	                    			${goodsInfoItem.goodsname}
                    			</a>
			                </div>
			                <div class="col-lg-3">
			                	<span>수량: ${basketItem.purchasequantity}</span>
			                </div>
			                <div class="col-lg-3">
			                    <span>가격: ${goodsInfoItem.goodsprice * basketItem.purchasequantity}&#8361;</span>
			                </div>
                   		</c:if>
                    </c:forEach>
	            </div>
	            <hr/>
        	</c:forEach>
        </div>
    </div>
    
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
