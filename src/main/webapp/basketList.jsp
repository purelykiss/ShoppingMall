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
	Search search = (Search)request.getAttribute("search");
	pageContext.setAttribute("search", search);
	
	List<BasketItem> selectBasketItem = (List<BasketItem>)request.getAttribute("selectBasketItem");
	pageContext.setAttribute("selectBasketItem", selectBasketItem);
	
	List<GoodsInfo> selectgoodsInfo = (List<GoodsInfo>)request.getAttribute("selectgoodsInfo");
	pageContext.setAttribute("selectgoodsInfo", selectgoodsInfo);
	
	List<GoodsPicture> selectgoodsPicture = (List<GoodsPicture>)request.getAttribute("selectgoodsPicture");
	pageContext.setAttribute("selectgoodsPicture", selectgoodsPicture);
	
	int maxpage = (int)request.getAttribute("maxpage");
	pageContext.setAttribute("maxpage", maxpage);
	
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
                        <h2>장바구니</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** About Area Starts ***** -->
    <div class="about-us">
        <div class="container">
        	<div class="row">
        		<div class="col-lg-3" style="float:left;border-style:solid; border-width:1px">
        			<a href="deleteBasketItem.do?deleteAll=1">전체 삭제</a>
        		</div>
        		<div class="col-lg-6" align=right style="border-style:solid; border-width:1px">
        			총 가격: ${selectgoodsPrice}&#8361;
        		</div>
        		<div class="col-lg-3" style="float:right;border-style:solid; border-width:1px">
        			<a href="purchaseForm.do">구매</a>
        		</div>        		
        	</div>
        	<hr/>
        	<c:forEach var="basketItem" items="${selectBasketItem}">
	            <div class="row">
	                <div class="col-lg-3">
	                    <c:forEach var="pictureItem" items="${selectgoodsPicture}">
	                    	<c:if test="${pictureItem.sellcode == basketItem.sellcode}">
	                    		<img src="/ShoppingMall/${pictureItem.picturepath}" alt="" style="float:right;width:80px">
	                    	</c:if>
	                    </c:forEach>
	                </div>
	                    <c:forEach var="goodsInfoItem" items="${selectgoodsInfo}">
                    	<c:if test="${goodsInfoItem.sellcode == basketItem.sellcode}">
			                <div class="col-lg-6">
	                    		<a href="detail.do?id=${goodsInfoItem.sellcode}">
	                    			${goodsInfoItem.goodsname}
                    			</a>
			                </div>
			                <div class="col-lg-3">
			                    <span>가격: ${goodsInfoItem.goodsprice}&#8361;</span><br>
			                    <span>수량: ${basketItem.purchasequantity}</span><br>
			                    <a href="deleteBasketItem.do?basketitemcode=${basketItem.basketitemcode}"><span>삭제</span></a>
			                </div>
                   		</c:if>
                    </c:forEach>
	            </div>
	            <hr/>
        	</c:forEach>
        </div>
    </div>
    <section class="section" id="products">
    	<div class="container">
    		<div class="row">
        		<div class="col-lg-12">
                    <div class="pagination">
                        <ul>
                        	<c:if test="${search.curpage > 1}">
                        		<li>
                        			<a href="basketList.do?curpage=1"><</a>
                        		</li>
                        	</c:if>
                        	<c:if test="${search.curpage - 10 >= 1 }">
	                            <li>
	                                <a href="basketList.do?curpage=${search.curpage-10 }">${search.curpage-10 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${search.curpage - 3 >= 1 }">
	                            <li>
	                                <a href="basketList.do?curpage=${search.curpage-3 }">${search.curpage-3 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${search.curpage - 2 >= 1 }">
	                            <li>
	                                <a href="basketList.do?curpage=${search.curpage-2 }">${search.curpage-2 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${search.curpage - 1 >= 1 }">
	                            <li>
	                                <a href="basketList.do?curpage=${search.curpage-1 }">${search.curpage-1 }</a>
	                            </li>
                            </c:if>
                            
                            <li class="active">
                                <a href="basketList.do?curpage=${search.curpage }">${search.curpage }</a>
                            </li>
                            
                        	<c:if test="${search.curpage +1 <= maxpage }">
	                            <li>
	                                <a href="basketList.do?curpage=${search.curpage+1 }">${search.curpage+1 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${search.curpage + 2 <= maxpage }">
	                            <li>
	                                <a href="basketList.do?curpage=${search.curpage+2 }">${search.curpage+2 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${search.curpage + 3 <= maxpage }">
	                            <li>
	                                <a href="basketList.do?curpage=${search.curpage+3 }">${search.curpage+3 }</a>
	                            </li>
                            </c:if>
                            <c:if test="${search.curpage + 10 <= maxpage }">
	                            <li>
	                                <a href="basketList.do?curpage=${search.curpage+10 }">${search.curpage+10 }</a>
	                            </li>
                            </c:if>
                            <c:if test="${search.curpage < maxpage }">
	                            <li>
	                                <a href="basketList.do?curpage=${maxpage}">></a>
	                            </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
        	</div>
    	</div>
    </section>
    
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
