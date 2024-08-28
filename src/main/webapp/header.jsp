<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Cookie[] cookie = request.getCookies();

	if(cookie!= null){
		for(Cookie item:cookie){
			if("shopping".equals(item.getName())){
				pageContext.setAttribute("userid",item.getValue());
			}
		}
	}
	else{
		System.out.println("header에서 쿠키 null");
	}

	
%>
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="index.do" class="logo">
                            <img src="assets/images/logo.png">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="index.do">로비</a></li>
                            <li class="scroll-to-section"><a href="goodsList.do">리스트</a></li>
                            <li class="scroll-to-section"><a href="goodsList.do?gender=M">남성복</a></li>
                            <li class="scroll-to-section"><a href="goodsList.do?gender=F">여성복</a></li>
                            <li class="scroll-to-section"><a href="goodsList.do?keyword=아동복">아동복</a></li>
                            <li class="scroll-to-section"><a href="http://172.31.9.180:8080/ShoppingMall-total/shoppingmallPortalWEB.do">통합사이트</a></li>
                            <c:choose>
                            	<c:when test="${empty userid}">
		                            <li class="submenu">
		                                <a href="javascript:;">회원</a>
		                                <ul>
		                                    <li><a href="signInForm.do">로그인</a></li>
		                                    <li><a href="signUp.jsp">회원가입</a></li>
		                                </ul>
		                            </li>
                            	</c:when>
                            	<c:otherwise>
		                            <li class="submenu">
		                                <a href="javascript:;">${userid}</a>
		                                <ul>
		                                    <li><a href="signOut.jsp">로그아웃</a></li>
		                                    <li><a href="basketList.do">장바구니</a></li>
		                                    <li><a href="receiptList.do">구매한 상품</a></li>
		                                </ul>
		                            </li>
                            	</c:otherwise>	
                            </c:choose>
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>