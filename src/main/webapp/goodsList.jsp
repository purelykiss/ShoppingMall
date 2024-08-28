<%@page import="java.net.URLEncoder"%>
<%@page import="kr.ac.kopo.vo.GoodsPicture"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.vo.Search"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.vo.GoodsInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Search search = (Search)request.getAttribute("search");
	pageContext.setAttribute("search", search);
	
	int totalcontents = (int)request.getAttribute("totalcontents");
	pageContext.setAttribute("totalcontents", totalcontents);

	List<GoodsInfo> selectgoodsInfo = (List<GoodsInfo>)request.getAttribute("selectgoodsInfo");
	pageContext.setAttribute("selectgoodsInfo", selectgoodsInfo);

	List<GoodsPicture> selectgoodsPicture = (List<GoodsPicture>)request.getAttribute("selectgoodsPicture");
	pageContext.setAttribute("selectgoodsPicture", selectgoodsPicture);

	int maxpage = (int)request.getAttribute("maxpage");
	pageContext.setAttribute("maxpage", maxpage);
	
	StringBuilder sb = new StringBuilder();
	boolean flag = false;
	if(search.getKeyword()!= null){
		for(int i = 0; i<search.getKeyword().size(); i++){
			if(flag)
				sb.append(" ");
			sb.append(search.getKeyword().get(i));
		}		
	}
	pageContext.setAttribute("keyword", URLEncoder.encode(sb.toString(), "UTF-8"));
%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Hexashop - Product Listing Page</title>


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
    <div class="page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                        <h2>Check Our Products</h2>
                        <span>Awesome &amp; Creative HTML CSS layout by TemplateMo</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->


    <!-- ***** Products Area Starts ***** -->
    <section class="section" id="products">
        <div class="container">
            <div class="row" style="place-items: center; display: grid;">
                <div class="" style="display:flex">
                    <form action="./goodsList.do" method="get" accept-charset="utf-8">
                    	<div style="float:left; width:700px">
                    		<input name="keyword" type="text" placeholder="검색어" style="float:left" size="70">
							<input type="submit" value="검색" style="float:left"><br>
							<select name="gender" style="float:left">
								<option value="">&lt;성별 선택&gt;</option>
							    <option value="f">여성복</option>
							    <option value="m">남성복</option>
							    <option value="fm">젠더리스</option>
						    </select>
						    <input name="seasonyear" type="number" placeholder="시즌 연도" style="float:left" size="5">
						    <select name="season" style="float:left">
								<option value="">&lt;시즌 선택&gt;</option>
							    <option value="SS">SS</option>
							    <option value="SF">SF</option>
							    <option value="FW">FW</option>
							    <option value="WS">WS</option>
							    <option value="ALL">ALL</option>
						    </select>
						    <br><br>
						    <input name="minprice" type="number" placeholder="최소 가격" style="float:left" size="5">
						    <input name="maxprice" type="number" placeholder="최대 가격" style="float:left" size="5">
                    	</div>
						<div style="float:right;">
						</div>
					</form>
                </div>
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>Our Latest Products</h2>
                        <span>Check out all of our products.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
            	<c:if test="${selectgoodsInfo[0] == null}">
            		<span>검색결과가 없습니다.</span>
           		</c:if>
            	<c:forEach var="item" items="${selectgoodsInfo}">
	                <div class="col-lg-4">
	                    <div class="item">
	                        <div class="thumb">
	                            <div class="hover-content">
	                                <ul>
	                                    <li><a href="detail.do?id=${item.sellcode }"><i class="fa fa-shopping-cart"></i></a></li>
	                                </ul>
	                            </div>
	                            <c:forEach var="pic" items="${selectgoodsPicture}">
	                            	<c:if test="${pic.sellcode == item.sellcode and pic.picturetype=='F'}">
	                            		<img src="${pic.picturepath}" alt="">
	                            	</c:if>
	                            </c:forEach>
	                        </div>
	                        <div class="down-content">
	                            <h4>${item.goodsname}</h4>
	                            <span>${item.goodsprice}&#8361;</span>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>
                <div class="col-lg-12">
                    <div class="pagination">
                        <ul>
                        	<c:if test="${search.curpage > 1}">
                        		<li>
                        			<a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=1"><</a>
                        		</li>
                        	</c:if>
                        	<c:if test="${search.curpage > 10 }">
	                            <li>
	                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=${search.curpage-10 }">${search.curpage-10 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${search.curpage > 3 }">
	                            <li>
	                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage={search.curpage-3 }">${search.curpage-3 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${search.curpage > 2 }">
	                            <li>
	                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=${search.curpage-2 }">${search.curpage-2 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${search.curpage > 1 }">
	                            <li>
	                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=${search.curpage-1 }">${search.curpage-1 }</a>
	                            </li>
                            </c:if>
                            
                            <li class="active">
                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=${search.curpage }">${search.curpage }</a>
                            </li>
                            
                        	<c:if test="${(search.curpage + 1) <= maxpage }">
	                            <li>
	                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=${search.curpage+1 }">${search.curpage+1 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${(search.curpage + 2) <= maxpage }">
	                            <li>
	                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=${search.curpage+2 }">${search.curpage+2 }</a>
	                            </li>
                            </c:if>
                        	<c:if test="${(search.curpage + 3) <= maxpage }">
	                            <li>
	                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=${search.curpage+3 }">${search.curpage+3 }</a>
	                            </li>
                            </c:if>
                            <c:if test="${(search.curpage + 10) <= maxpage }">
	                            <li>
	                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=${search.curpage+10 }">${search.curpage+10 }</a>
	                            </li>
                            </c:if>
                            <c:if test="${search.curpage < maxpage }">
	                            <li>
	                                <a href="goodsList.do?keyword=${keyword}&gender=${search.gender}&seasonyear${search.seasonyear}&season=${search.season}&maxprice=${search.maxprice}&minprice=${minprice}&curpage=${maxpage}">></a>
	                            </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Products Area Ends ***** -->
    
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