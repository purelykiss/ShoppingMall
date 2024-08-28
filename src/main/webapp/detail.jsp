<%@page import="java.text.Format"%>
<%@page import="kr.ac.kopo.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.vo.GoodsPicture"%>
<%@page import="kr.ac.kopo.vo.GoodsInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	GoodsInfo selectgoodsInfo = (GoodsInfo)request.getAttribute("selectgoodsInfo");
	if(selectgoodsInfo == null)
		selectgoodsInfo = new GoodsInfo();
	pageContext.setAttribute("selectgoodsInfo", selectgoodsInfo);
	pageContext.setAttribute("sellcode", Integer.parseInt(selectgoodsInfo.getSellcode()));
	
	List<GoodsPicture> selectgoodsPicture = (List<GoodsPicture>)request.getAttribute("selectgoodsPicture");
	if(selectgoodsPicture == null)
		selectgoodsPicture = new ArrayList<GoodsPicture>();
	pageContext.setAttribute("selectgoodsPicture", selectgoodsPicture);
	
	List<Review> selectReview = (List<Review>)request.getAttribute("selectReview");
	if(selectReview == null)
		selectReview = new ArrayList<Review>();
	for(int i = selectReview.size()-1; i > 3; i--){
		selectReview.remove(i);
	}
	System.out.println(selectReview.size());
	pageContext.setAttribute("selectReview", selectReview);
%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Hexashop - Product Detail Page</title>


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
	a:link{
		color: lightgray;	
	}
	a:visited{
		color: lightgray;
	}
	a:hover{
		color: gray;
	}
	a:active{
		color: black;
	}
	.previewImage{
		position: absolute;
		visibility: hidden;
	}
	
	.active{
		position: relative;
		visibility: visible;
	}
	
	.detailImage{
		width: 650px
	}
	</style>
	<script src='https://code.jquery.com/jquery-3.7.1.js'></script>
	<script>
	    var goodsprice = <%= selectgoodsInfo.getGoodsprice() %>; // 추가됨
	    
	    $(document).ready(function(){

			function moveTo(){
				$('.previewImage').removeClass('active')
				$('.previewImage').first().appendTo($('.divRoller'))
				$('.previewImage').first().addClass('active')
				console.log('left')
			}
			$('.divRoller').click(function(){
				moveTo()
			})
			setInterval(function() {
				$('.divRoller').trigger('click')
			}, 10000)
			
			$('.chkbtn').click(function(){
				$.ajax({    
				    url: '/ShoppingMall/insertBasketItem.do',
				    type: 'GET', // GET 메서드를 사용하려면 type을 명시하는 것이 좋습니다.
				    data: {	//물건 정보, 수량
				        sellcode: ${sellcode}
				        ,amount: $('input.qty').val()
				    },
				    success: function(response) {
				        switch(response){
				        case '1'://장바구니 성공
				        	alert("장바구니에 넣었습니다.")
				        	break;
				        case '2'://같은 상품
				        	alert("이미 같은 상품이 있습니다.")
				        	break;
				        case '3'://로그인 필요
				        	alert("로그인이 필요합니다!")
				        	location.href = "signInForm.do"
				        	break;
				        case '4'://오류
				        	alert("오류가 발생했습니다. 다시 이용해주십시오.")
				        	break;
				        }
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
    <div class="page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                        <h2>상품 정보</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->


    <!-- ***** Product Area Starts ***** -->
    <section class="section" id="product">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                	<div class="left-images divRoller">
	                	<c:forEach var="item" items="${selectgoodsPicture}">
		                	<c:if test="${item.picturetype eq 'F'}">
		                		<img class="previewImage active" src="${item.picturepath}" alt="">	
		                	</c:if>
		                	<c:if test="${item.picturetype eq 'P'}">
		                		<img class="previewImage" src="${item.picturepath}" alt="">
		                	</c:if>
	                	</c:forEach>
                	</div>
            	</div>
	            <div class="col-lg-4">
	                <div class="right-content">
	                	<ul class="stars" style="position:relative">
	                    	<!-- 점수1 -->
	                    </ul>
	                    <h4>${selectgoodsInfo.goodsname}</h4>
	                    <span class="price">${selectgoodsInfo.goodsprice}&#8361;</span>
	                   
	                    <span>
	                    	브랜드 : ${selectgoodsInfo.brand}<br>
	                    	
							<c:if test="${selectgoodsInfo.seasonyear ne 0 and !empty selectgoodsInfo.season}">
								시즌 : ${selectgoodsInfo.seasonyear} ${selectgoodsInfo.season}<br>
							</c:if>
							
							성별 : 
							<c:choose>
								<c:when test="${selectgoodsInfo.gender eq 'M'}">
								남성복
								</c:when>
								<c:when test="${selectgoodsInfo.gender eq 'F'}">
								여성복
								</c:when>
								<c:when test="${selectgoodsInfo.gender eq 'FM'}">
								젠더리스
								</c:when>
							</c:choose>
							<br><br>
							
							재고 수량 : ${selectgoodsInfo.stock}<br>
							
						</span>
	                    <div class="quantity-content">
	                        <div class="left-content">
	                            <h6>주문 수량</h6>
	                        </div>
	                        <div class="right-content">
	                            <div class="quantity buttons_added">
	                                <input type="button" value="-" class="minus"><input type="number" step="1" min="1" max="" name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="" inputmode=""><input type="button" value="+" class="plus">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="total">
	                        <h4>
	                        	총합: 
	                        	<span class="totalcost">
	                        		${selectgoodsInfo.goodsprice}
	                       		</span>
	                       		&#8361;
	                     	</h4>
	                        <div class="main-border-button chkbtn"><a href="#">장바구니 넣기</a></div>
	                    </div>
	                </div>
	            </div>
            </div>
            <div class="right-content">
            	<hr/>
            	<span style="font-size:1.3rem"><b>리뷰</b></span>
            	<hr/>
            	<div>
	            	<table	style="width:100%">
	            		<c:if test="${fn:length(selectReview) gt 0}">
	            			<tr>
	            				<td style="border:1px solid lightgray">
            						<a href="#">
	            						<div>
	            							<ul class="stars" style="position:relative">
											<c:if test="${selectReview[0].score ge 1}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
											<c:if test="${selectReview[0].score ge 2}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
											<c:if test="${selectReview[0].score ge 3}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
											<c:if test="${selectReview[0].score ge 4}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
											<c:if test="${selectReview[0].score ge 5}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
						                    </ul><br>
						                    ${selectReview[0].contents}
	            						</div>
				                    </a>
            					</td>
	            				<c:if test="${not empty selectReview[1]}">
	            					<td style="border:1px solid lightgray">
	            						<a href="#">
		            						<div>
		            							<ul class="stars" style="position:relative">
												<c:if test="${selectReview[1].score ge 1}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
												<c:if test="${selectReview[1].score ge 2}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
												<c:if test="${selectReview[1].score ge 3}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
												<c:if test="${selectReview[1].score ge 4}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
												<c:if test="${selectReview[1].score ge 5}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
							                    </ul><br>
							                    ${selectReview[1].contents}
		            						</div>
					                    </a>
	            					</td>
	            				</c:if>
	            			</tr>
	            		</c:if>
	            		<c:if test="${fn:length(selectReview) gt 2}">
	            			<tr>
	            				<td style="border:1px solid lightgray">
            						<a href="#">
	            						<div>
	            							<ul class="stars" style="position:relative">
											<c:if test="${selectReview[2].score ge 1}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
											<c:if test="${selectReview[2].score ge 2}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
											<c:if test="${selectReview[2].score ge 3}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
											<c:if test="${selectReview[2].score ge 4}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
											<c:if test="${selectReview[2].score ge 5}">
												<li><i class="fa fa-star"></i></li>
											</c:if>
						                    </ul><br>
						                    ${selectReview[2].contents}
	            						</div>
				                    </a>
            					</td>
	            				<c:if test="${not empty selectReview[3]}">
	            					<td style="border:1px solid lightgray">
	            						<a href="#">
		            						<div>
		            							<ul class="stars" style="position:relative">
												<c:if test="${selectReview[3].score ge 1}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
												<c:if test="${selectReview[3].score ge 2}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
												<c:if test="${selectReview[3].score ge 3}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
												<c:if test="${selectReview[3].score ge 4}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
												<c:if test="${selectReview[3].score ge 5}">
													<li><i class="fa fa-star"></i></li>
												</c:if>
							                    </ul><br>
							                    ${selectReview[3].contents}
		            						</div>
					                    </a>
	            					</td>
	            				</c:if>
	            			</tr>
	            		</c:if>
	            	</table>
	            	<c:choose>
	            		<c:when test="${not empty selectReview[0]}">
	            			<a href="#">
		            			<span style="float:right">더보기</span><br>
		            		</a>
	            		</c:when>
	            		<c:otherwise>
	            			<span>아직 리뷰가 없습니다...</span>
	            			<a href="#">
		            			<span style="float:right">리뷰 쓰러가기</span><br>
		            		</a>
	            		</c:otherwise>
	            	</c:choose>
	            </div>
            	<hr/>
            	<span style="font-size:1.3rem"><b>상세정보</b></span>
            	<hr/>
            	<span style="display: grid; place-items: center">
	               	<c:forEach var="item" items="${selectgoodsPicture}">
	                	<c:if test="${item.picturetype eq 'D'}">
	                		<img class="detailImage" src="/ShoppingMall/${item.picturepath}" alt="">	
	                	</c:if>
	               	</c:forEach>
            	</span>
            	<hr/>
            	<a href="#">
            		<div style="float:right">
            			맨위로
            		</div>
            	</a>
            </div>
        </div>
    </section>
    <!-- ***** Product Area Ends ***** -->
    
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
    <script src="assets/js/quantity.js"></script>
    
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
